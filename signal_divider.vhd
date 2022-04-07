library ieee;			
use ieee.std_logic_1164.all;

entity signal_divider is
	port(input: in std_logic;
	output: out std_logic_vector(6 downto 0));
end signal_divider;

architecture arch of signal_divider is
begin
	process(input)
	begin
		output(0) <= input;
		output(1) <= input;
		output(2) <= input;
		output(3) <= input;
		output(4) <= input;
		output(5) <= input;
		output(6) <= input;	  
	end process;
end arch;