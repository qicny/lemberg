//===----- SchedulePostRATDList.h - list scheduler ---------------*- C++ -*-===//
//
//                     The LLVM Compiler Infrastructure
//
// This file is distributed under the University of Illinois Open Source
// License. See LICENSE.TXT for details.
//
//===----------------------------------------------------------------------===//
//
// This implements a top-down list scheduler, using standard algorithms.
// The basic approach uses a priority queue of available nodes to schedule.
// One at a time, nodes are taken from the priority queue (thus in priority
// order), checked for legality to schedule, and emitted if legal.
//
// Nodes may not be legal to schedule either due to structural hazards (e.g.
// pipeline or resource constraints) or because an input to the instruction has
// not completed execution.
//
//===----------------------------------------------------------------------===//

#ifndef SCHEDULEPOSTRATDLIST_H
#define SCHEDULEPOSTRATDLIST_H

#include "AntiDepBreaker.h"
#include "llvm/CodeGen/ScheduleDAG.h"
#include "llvm/CodeGen/ScheduleDAGInstrs.h"
#include "llvm/CodeGen/LatencyPriorityQueue.h"
#include "llvm/CodeGen/ScheduleHazardRecognizer.h"
#include "llvm/Analysis/AliasAnalysis.h"

namespace llvm {

  class LLVM_LIBRARY_VISIBILITY SchedulePostRATDList : public ScheduleDAGInstrs {
    /// AvailableQueue - The priority queue to use for the available SUnits.
    ///
    LatencyPriorityQueue AvailableQueue;

    /// PendingQueue - This contains all of the instructions whose operands have
    /// been issued, but their results are not ready yet (due to the latency of
    /// the operation).  Once the operands becomes available, the instruction is
    /// added to the AvailableQueue.
    std::vector<SUnit*> PendingQueue;

    /// Topo - A topological ordering for SUnits.
    ScheduleDAGTopologicalSort Topo;

    /// AntiDepBreak - Anti-dependence breaking object, or NULL if none
    AntiDepBreaker *AntiDepBreak;

    /// AA - AliasAnalysis for making memory reference queries.
    AliasAnalysis *AA;

    /// LiveRegs - true if the register is live.
    BitVector LiveRegs;

  public:

    /// HazardRec - The hazard recognizer to use.
    ScheduleHazardRecognizer *HazardRec;

    /// The schedule. Null SUnit*'s represent noop instructions.
    std::vector<SUnit*> Sequence;

    SchedulePostRATDList(
      MachineFunction &MF, MachineLoopInfo &MLI, MachineDominatorTree &MDT,
      AliasAnalysis *AA, const RegisterClassInfo&,
      TargetSubtargetInfo::AntiDepBreakMode AntiDepMode,
      SmallVectorImpl<const TargetRegisterClass*> &CriticalPathRCs);

    ~SchedulePostRATDList();

    /// startBlock - Initialize register live-range state for scheduling in
    /// this block.
    ///
    void startBlock(MachineBasicBlock *BB);

    /// Initialize the scheduler state for the next scheduling region.
    virtual void enterRegion(MachineBasicBlock *bb,
                             MachineBasicBlock::iterator begin,
                             MachineBasicBlock::iterator end,
                             unsigned endcount);

    /// Notify that the scheduler has finished scheduling the current region.
    virtual void exitRegion();

    /// Schedule - Schedule the instruction range using list scheduling.
    ///
    void schedule();

    void EmitSchedule();

    /// Observe - Update liveness information to account for the current
    /// instruction, which will not be scheduled.
    ///
    void Observe(MachineInstr *MI, unsigned Count);

    /// finishBlock - Clean up register live-range state.
    ///
    void finishBlock();

    /// FixupKills - Fix register kill flags that have been made
    /// invalid due to scheduling
    ///
    void FixupKills(MachineBasicBlock *MBB);

  private:
    void ReleaseSucc(SUnit *SU, SDep *SuccEdge);
    void ReleaseSuccessors(SUnit *SU);
    void ScheduleNodeTopDown(SUnit *SU, unsigned CurCycle);
    void ListScheduleTopDown();
    void StartBlockForKills(MachineBasicBlock *BB);

    // ToggleKillFlag - Toggle a register operand kill flag. Other
    // adjustments may be made to the instruction if necessary. Return
    // true if the operand has been deleted, false if not.
    bool ToggleKillFlag(MachineInstr *MI, MachineOperand &MO);

    void dumpSchedule() const;
  };
}

#endif
