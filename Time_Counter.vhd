library ieee;			
use ieee.std_logic_1164.all;  
use ieee.std_logic_unsigned.all;  
use ieee.numeric_std.all;

entity time_counter is
	port(clk: in std_logic;	
	time_interval: in std_logic_vector(2 downto 0);
	flag: out std_logic); -- the flag that indicates when the counter should send a clock signal to the other counter
end time_counter;	 

architecture arch of time_counter is

signal output: std_logic_vector(24 downto 0);

begin
	process(clk, time_interval)
	
	variable aux: std_logic_vector(24 downto 0) := "0000000000000000000000000";
	
	procedure set_flag(value: std_logic_vector(24 downto 0)) is
    begin
        if (aux = value) then
			flag <= '1';
			aux := "0000000000000000000000000";
		else
	  	    flag <= '0';
			aux := aux + '1';
		end if;
    end procedure;
	
	begin
		if (clk'event and clk = '1') then
		
		  case time_interval is
		      when "001" => set_flag("0000000101111101011110000");
		      when "010" => set_flag("0000001011111010111100001");
		      when "011" => set_flag("0000010001111000011010001");
 		      when "100" => set_flag("0000010111110101111000010");
		      when "101" => set_flag("0000011101110011010110010");
		      when "110" => set_flag("0000100011110000110100011");
		      when "111" => set_flag("0000101001101110010010100");
		      when others => set_flag("0000000000000000000000000");
		  end case;
		end if;
		
		output <= aux;
	end process;
end arch;