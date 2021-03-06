-- Generated by vhdlparse 0
-- 20110825 oswald berthold
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity osc_wrapper is
	Port (
		clk : in std_logic ;
		i_en : in std_logic ;
		o_osz : out std_logic
	);
end entity osc_wrapper;

architecture bhv of osc_wrapper is
-- Components
	component osc_wrapped
		Port (
			clk : in std_logic ;
			i_en : in std_logic ;
			o_osz : out std_logic
		);
	end component;

-- signals
	signal i_en_buf : std_logic ;
	signal o_osz_buf : std_logic ;
-- body
begin
-- instances
	osc_wrapped_inst : osc_wrapped
		port map (
			clk => clk,
			i_en => i_en_buf,
			o_osz => o_osz_buf
		);

-- struct/process
	buf_process: process(clk)
	begin
		if rising_edge(clk) then
			i_en_buf <= i_en ;
			o_osz <= o_osz_buf ;
		end if;
	end process;
end bhv ;
