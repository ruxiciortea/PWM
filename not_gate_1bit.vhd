library ieee;			
use ieee.std_logic_1164.all;

entity not_gate_1bit is
	port(input: in std_logic;
	output: out std_logic);
end not_gate_1bit;

architecture arch of not_gate_1bit is
begin
	output <= not input;
end arch;