library ieee;			
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;  
use ieee.numeric_std.all;  

entity reversible_counter is -- counts from 0 to 255 and back to 0
	port(clk: in std_logic;
	enable: in std_logic;							   
	output: out std_logic_vector(7 downto 0));
end reversible_counter;

architecture arch of reversible_counter is	
begin	 
	process(clk)
	
	variable aux: std_logic_vector(7 downto 0) := "00000000";
	variable direction: std_logic := '0';
	
	begin
		if (clk'event and clk = '1' and enable = '1') then 
			if (direction = '0') then -- ascending
				if (aux < "11111111") then
					aux := aux + '1';
				else
					aux := aux - '1';
					direction := '1';
				end if;
			else -- decresing
				if (aux > "00000000") then
					aux := aux - '1';
				else
					aux := aux + '1';
					direction := '0';
				end if;
			end if;	 
		end if;	
		
		output <= aux;
	end process;	   
end arch;