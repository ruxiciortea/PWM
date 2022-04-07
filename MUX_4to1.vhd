library ieee;			
use ieee.std_logic_1164.all;	

entity mux_4to1_8bits is
	port(i0, i1, i2, i3: in std_logic_vector(7 downto 0);
	sel: in std_logic_vector(1 downto 0);
	enable: in std_logic;
	output: out std_logic_vector(7 downto 0));
end mux_4to1_8bits;		  

architecture arch of mux_4to1_8bits is
begin 
	process(i0, i1, i2, i3, sel)
	begin
	   if(enable = '1') then
            if (sel = "00") then  
                output <= i0 after 10 ns;
            elsif (sel = "01") then
			    output <= i1 after 10 ns;
            elsif (sel = "10") then
                output <= i2 after 10 ns;
		    elsif (sel = "11") then
			     output <= i3 after 10 ns;
		    else
		         output <= "00000000";
            end if;
        end if;
    end process;
end arch;