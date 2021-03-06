-- ring oscillator with ring of inverter gates (1-LUT)

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity oszillator2 is
    Port ( clk : in  STD_LOGIC;
           i_en : in  STD_LOGIC;
           o_osz : out  STD_LOGIC);
end oszillator2;


architecture Behavioral of oszillator2 is
  signal delayline_input : std_logic;
  signal delayline_output : std_logic;
  
  component delayline
    generic (
      linelength : integer);
    port (
      sgnl         : in  std_logic;
      delayed_sgnl : out std_logic);
  end component;

  attribute S : string;
  attribute S of i_en: signal is "true";
  attribute S of o_osz: signal is "true";

begin
  delayline_inst : delayline
    generic map (
      linelength => 78)
    port map (
      sgnl         => delayline_input,
      delayed_sgnl => delayline_output);

  delayline_input <= delayline_output and i_en;
  --delayline_output <= delayed_sgnl;
  o_osz <= delayline_output;
  
end Behavioral;
