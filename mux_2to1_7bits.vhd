library ieee;			
use ieee.std_logic_1164.all;	

entity mux_2to1_7bits is
	port(i0, i1: in std_logic_vector(6 downto 0);
	sel: in std_logic;
	enable: in std_logic;
	output: out std_logic_vector(6 downto 0));
end mux_2to1_7bits;		  

architecture arch of mux_2to1_7bits is
begin 
	process(i0, i1, sel)
	begin
	   if(enable = '1') then
            if (sel = '0') then  
                output <= i0 after 10 ns;
            elsif (sel = '1') then
			    output <= i1 after 10 ns;
		    else
		         output <= "0000000";
            end if;
        end if;
    end process;
end arch;

