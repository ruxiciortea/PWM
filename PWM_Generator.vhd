library ieee;			
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;  
use ieee.numeric_std.all;

entity pwm is
	port(clk: in std_logic;
    duty_cycle: in std_logic_vector(7 downto 0);
   	pulse: out std_logic); -- the output signal 
end pwm;

architecture arch of pwm is
signal count: std_logic_vector(7 downto 0);

begin
	process(clk) -- the one that increments the counter	  
	begin 
		if (clk'event and clk = '1') then
			if (count < (255)) then
				count <= count + 1;
			else
				count <= (others => '0');
			end if;
		end if;
	end process;	
	
	process(clk) -- knows if the signal is high or low
	begin
		if (clk'event and clk = '1') then
			if (duty_cycle > count) then -- check where the desired duty cycle is against the counter 
				pulse <= '1';  
			else 
				pulse <= '0';
			end if;
		end if;
	end process;
end arch;