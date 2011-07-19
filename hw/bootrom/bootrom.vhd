-- DO NOT EDIT
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
entity bootrom is
generic (addr_width : integer);
port (clk     : in std_logic;
	address : in std_logic_vector(addr_width-1 downto 0);
	rd      : in std_logic;
	rd_data : out std_logic_vector(31 downto 0);
	rdy_cnt : out unsigned(1 downto 0));
end bootrom;
architecture rtl of bootrom is
	signal a : std_logic_vector(7 downto 0);
	signal d : std_logic_vector(31 downto 0);
begin
process(a) begin
	case a is
		when X"00" => d <= X"00000194";
		when X"01" => d <= X"f6460c25";
		when X"02" => d <= X"8a07f267";
		when X"03" => d <= X"80c98000";
		when X"04" => d <= X"65705e37";
		when X"05" => d <= X"a62002fa";
		when X"06" => d <= X"c583f828";
		when X"07" => d <= X"dff02048";
		when X"08" => d <= X"dff0a038";
		when X"09" => d <= X"dea3a32a";
		when X"0a" => d <= X"001038de";
		when X"0b" => d <= X"b3234a80";
		when X"0c" => d <= X"1078dec2";
		when X"0d" => d <= X"a0005090";
		when X"0e" => d <= X"00a80818";
		when X"0f" => d <= X"df722088";
		when X"10" => d <= X"df71a017";
		when X"11" => d <= X"44202003";
		when X"12" => d <= X"1c0003e0";
		when X"13" => d <= X"9000aba3";
		when X"14" => d <= X"17001017";
		when X"15" => d <= X"6f702003";
		when X"16" => d <= X"11000560";
		when X"17" => d <= X"176f7020";
		when X"18" => d <= X"03b1000b";
		when X"19" => d <= X"e38013f0";
		when X"1a" => d <= X"4b817802";
		when X"1b" => d <= X"1603e220";
		when X"1c" => d <= X"19c20020";
		when X"1d" => d <= X"1b0e10a0";
		when X"1e" => d <= X"158210e0";
		when X"1f" => d <= X"173ff648";
		when X"20" => d <= X"023603e3";
		when X"21" => d <= X"206b18b0";
		when X"22" => d <= X"39c20022";
		when X"23" => d <= X"22187037";
		when X"24" => d <= X"000eed87";
		when X"25" => d <= X"08503183";
		when X"26" => d <= X"81e44b08";
		when X"27" => d <= X"10810776";
		when X"28" => d <= X"20001a57";
		when X"29" => d <= X"ff601b08";
		when X"2a" => d <= X"00e01458";
		when X"2b" => d <= X"10a01700";
		when X"2c" => d <= X"35e80291";
		when X"2d" => d <= X"0005e0ec";
		when X"2e" => d <= X"45f01516";
		when X"2f" => d <= X"a0a01700";
		when X"30" => d <= X"04c80230";
		when X"31" => d <= X"1610639f";
		when X"32" => d <= X"e8b00276";
		when X"33" => d <= X"56002600";
		when X"34" => d <= X"01971001";
		when X"35" => d <= X"80169700";
		when X"36" => d <= X"203000b6";
		when X"37" => d <= X"20015810";
		when X"38" => d <= X"1758c020";
		when X"39" => d <= X"03176f70";
		when X"3a" => d <= X"20031100";
		when X"3b" => d <= X"05e07658";
		when X"3c" => d <= X"00260001";
		when X"3d" => d <= X"97100184";
		when X"3e" => d <= X"16990020";
		when X"3f" => d <= X"3000c120";
		when X"40" => d <= X"01601017";
		when X"41" => d <= X"44202003";
		when X"42" => d <= X"1c000478";
		when X"43" => d <= X"3000c620";
		when X"44" => d <= X"8b003017";
		when X"45" => d <= X"58c02003";
		when X"46" => d <= X"17002260";
		when X"47" => d <= X"02765400";
		when X"48" => d <= X"26000197";
		when X"49" => d <= X"10018816";
		when X"4a" => d <= X"95002030";
		when X"4b" => d <= X"00a12001";
		when X"4c" => d <= X"50101744";
		when X"4d" => d <= X"2020031c";
		when X"4e" => d <= X"00047890";
		when X"4f" => d <= X"16106000";
		when X"50" => d <= X"55d0876f";
		when X"51" => d <= X"7020033a";
		when X"52" => d <= X"57ff630b";
		when X"53" => d <= X"00101b08";
		when X"54" => d <= X"0060876f";
		when X"55" => d <= X"70200311";
		when X"56" => d <= X"18006087";
		when X"57" => d <= X"6f702003";
		when X"58" => d <= X"1601e220";
		when X"59" => d <= X"19c00020";
		when X"5a" => d <= X"1b0e0020";
		when X"5b" => d <= X"158000e0";
		when X"5c" => d <= X"173ff648";
		when X"5d" => d <= X"02364000";
		when X"5e" => d <= X"2301f190";
		when X"5f" => d <= X"7882a066";
		when X"60" => d <= X"20029da0";
		when X"61" => d <= X"40081002";
		when X"62" => d <= X"00201740";
		when X"63" => d <= X"00200317";
		when X"64" => d <= X"3fade002";
		when X"65" => d <= X"0000005c";
		when X"66" => d <= X"399e01a0";
		when X"67" => d <= X"2fc3f01a";
		when X"68" => d <= X"4000201b";
		when X"69" => d <= X"0e00a014";
		when X"6a" => d <= X"0200e037";
		when X"6b" => d <= X"c000280f";
		when X"6c" => d <= X"c3f40310";
		when X"6d" => d <= X"00106016";
		when X"6e" => d <= X"05e22019";
		when X"6f" => d <= X"c400201b";
		when X"70" => d <= X"0e212015";
		when X"71" => d <= X"8400e017";
		when X"72" => d <= X"3ff64802";
		when X"73" => d <= X"1605e320";
		when X"74" => d <= X"18841020";
		when X"75" => d <= X"1a400020";
		when X"76" => d <= X"3b0e00a0";
		when X"77" => d <= X"00083014";
		when X"78" => d <= X"0200e017";
		when X"79" => d <= X"3fe84802";
		when X"7a" => d <= X"301f87e3";
		when X"7b" => d <= X"e0001003";
		when X"7c" => d <= X"0000004c";
		when X"7d" => d <= X"f6020123";
		when X"7e" => d <= X"00001267";
		when X"7f" => d <= X"80680bf0";
		when X"80" => d <= X"fc1605e2";
		when X"81" => d <= X"2019c400";
		when X"82" => d <= X"201b0e21";
		when X"83" => d <= X"20158410";
		when X"84" => d <= X"e0173ff6";
		when X"85" => d <= X"48027605";
		when X"86" => d <= X"e3202108";
		when X"87" => d <= X"70602018";
		when X"88" => d <= X"39c40022";
		when X"89" => d <= X"01007010";
		when X"8a" => d <= X"1f87e837";
		when X"8b" => d <= X"c0002d87";
		when X"8c" => d <= X"10901104";
		when X"8d" => d <= X"00200217";
		when X"8e" => d <= X"3fe36002";
		when X"8f" => d <= X"00000060";
		when X"90" => d <= X"76020724";
		when X"91" => d <= X"cf00d017";
		when X"92" => d <= X"e1f831c0";
		when X"93" => d <= X"11230306";
		when X"94" => d <= X"1010c4f1";
		when X"95" => d <= X"60110431";
		when X"96" => d <= X"a02621e2";
		when X"97" => d <= X"2029e000";
		when X"98" => d <= X"202b0f02";
		when X"99" => d <= X"20158800";
		when X"9a" => d <= X"e0173ff6";
		when X"9b" => d <= X"48027042";
		when X"9c" => d <= X"4863100a";
		when X"9d" => d <= X"f1412838";
		when X"9e" => d <= X"20050120";
		when X"9f" => d <= X"f12000e0";
		when X"a0" => d <= X"8300b510";
		when X"a1" => d <= X"8038c0fc";
		when X"a2" => d <= X"64388620";
		when X"a3" => d <= X"200fc3e4";
		when X"a4" => d <= X"17c00008";
		when X"a5" => d <= X"03173fd8";
		when X"a6" => d <= X"e0020000";
		when X"a7" => d <= X"0000005c";
		when X"a8" => d <= X"799e01a0";
		when X"a9" => d <= X"2fc3f190";
		when X"aa" => d <= X"fff8301e";
		when X"ab" => d <= X"40634101";
		when X"ac" => d <= X"f0180000";
		when X"ad" => d <= X"6019c000";
		when X"ae" => d <= X"201b0801";
		when X"af" => d <= X"60150220";
		when X"b0" => d <= X"a0170013";
		when X"b1" => d <= X"68021c81";
		when X"b2" => d <= X"000019c0";
		when X"b3" => d <= X"00201b08";
		when X"b4" => d <= X"00e01002";
		when X"b5" => d <= X"10e01800";
		when X"b6" => d <= X"102019c0";
		when X"b7" => d <= X"00201b08";
		when X"b8" => d <= X"00e01502";
		when X"b9" => d <= X"20a0173f";
		when X"ba" => d <= X"f0680216";
		when X"bb" => d <= X"01ff2018";
		when X"bc" => d <= X"00006017";
		when X"bd" => d <= X"3ffe6002";
		when X"be" => d <= X"414f4c0a";
		when X"bf" => d <= X"00000a44";
		when X"c0" => d <= X"544f4f42";
		when X"c1" => d <= X"0000000a";
		when X"c2" => d <= X"4958450a";
		when X"c3" => d <= X"00002054";
		when X"c4" => d <= X"4c494146";
		when X"c5" => d <= X"00004020";
		when others => d <= (others => '0');
	end case;
end process;
process(clk) begin
	if rising_edge(clk) then
		if rd = '1' then
			a <= address;
		end if;
		rd_data <= d;
		rdy_cnt <= '0' & rd;
	end if;
end process;
end rtl;
