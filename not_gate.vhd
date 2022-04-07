library ieee;			
use ieee.std_logic_1164.all;

entity not_gate_7bits is
	port(input: in std_logic_vector(6 downto 0);
	output: out std_logic_vector(6 downto 0));
end not_gate_7bits;

architecture arch of not_gate_7bits is
begin
	output(0) <= not input(0); 
	output(1) <= not input(1);
	output(2) <= not input(2);
	output(3) <= not input(3);
	output(4) <= not input(4);
	output(5) <= not input(5);
	output(6) <= not input(6);
end arch;