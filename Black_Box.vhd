library ieee;			
use ieee.std_logic_1164.all;
entity black_box is
	port(clk: in std_logic;
	mode: in std_logic_vector(1 downto 0);
	time_interval: std_logic_vector(2 downto 0);
	duty_cycle: in std_logic_vector(7 downto 0);   
	out_signal: out std_logic_vector(6 downto 0);
	anods_on: out std_logic_vector(3 downto 0));
end black_box;

architecture arch of black_box is  
 
component pwm is
	port(clk: in std_logic;
    duty_cycle: in std_logic_vector(7 downto 0);
   	pulse: out std_logic);
end component;

component reversible_counter is
	port(clk: in std_logic;
	enable: in std_logic;							   
	output: out std_logic_vector(7 downto 0));
end component;	

component time_counter is
	port(clk: in std_logic;
	time_interval: in std_logic_vector(2 downto 0);
	flag: out std_logic);
end component;

component signal_divider is
	port(input: in std_logic;
	output: out std_logic_vector(6 downto 0));
end component;

component not_gate_1bit is
	port(input: in std_logic;
	output: out std_logic);
end component;

component not_gate_7bits is
	port(input: in std_logic_vector(6 downto 0);
	output: out std_logic_vector(6 downto 0));
end component;

component mux_4to1_1bit is
	port(i0, i1, i2, i3: in std_logic;
	sel: in std_logic_vector(1 downto 0);
	enable: in std_logic;
	output: out std_logic);
end component;

component mux_4to1_8bits is
	port(i0, i1, i2, i3: in std_logic_vector(7 downto 0);
	sel: in std_logic_vector(1 downto 0);
	enable: in std_logic;
	output: out std_logic_vector(7 downto 0));
end component;

component mux_2to1_7bits is
	port(i0, i1: in std_logic_vector(6 downto 0);
	sel: in std_logic;
	enable: in std_logic;
	output: out std_logic_vector(6 downto 0));
end component;	

-- enable signals for mode selection
signal enable: std_logic;
signal negated_enable: std_logic;

-- signals for manual and automatic mode
signal duty_automatic: std_logic_vector(7 downto 0); 
signal duty_out: std_logic_vector(7 downto 0);
signal flag: std_logic;		
signal positive_output: std_logic;
signal positive_output_vector: std_logic_vector(6 downto 0);
signal output_manual_or_automatic: std_logic_vector(6 downto 0);

-- signals for test mode
signal flag1sec: std_logic;
signal flag2sec: std_logic;
signal flag3sec: std_logic;
signal flag4sec: std_logic;
signal flag5sec: std_logic;
signal flag6sec: std_logic;
signal flag7sec: std_logic;

signal duty1sec: std_logic_vector(7 downto 0);
signal duty2sec: std_logic_vector(7 downto 0);
signal duty3sec: std_logic_vector(7 downto 0);
signal duty4sec: std_logic_vector(7 downto 0);
signal duty5sec: std_logic_vector(7 downto 0);
signal duty6sec: std_logic_vector(7 downto 0);
signal duty7sec: std_logic_vector(7 downto 0);

signal positive_output_test_mode: std_logic_vector(6 downto 0);
signal output_test_mode: std_logic_vector(6 downto 0);

begin
    anods_on <= "0000";
    
    -- enables for initial mode selection
    c1: mux_4to1_1bit port map ('0', '0', '0', '1', mode, '1', enable);
    c2: not_gate_1bit port map (enable, negated_enable);
    
    -- manual and automatic modes
	c3: time_counter port map (clk, time_interval, flag);
	c4: reversible_counter port map (flag, negated_enable, duty_automatic);
	c5: mux_4to1_8bits port map ("00000000", duty_cycle, duty_automatic, "11111111", mode, negated_enable, duty_out);
	c6: pwm port map (clk, duty_out, positive_output);
	c7: signal_divider port map (positive_output, positive_output_vector);
	c8: not_gate_7bits port map (positive_output_vector, output_manual_or_automatic);
	
	-- test mode
	timecounter1sec: time_counter port map (clk, "001", flag1sec);
	counter1sec: reversible_counter port map (flag1sec, enable, duty1sec);
	timecounter2sec: time_counter port map (clk, "010", flag2sec);
	counter2sec: reversible_counter port map (flag2sec, enable, duty2sec);
	timecounter3sec: time_counter port map (clk, "011", flag3sec);
	counter3sec: reversible_counter port map (flag3sec, enable, duty3sec);
	timecounter4sec: time_counter port map (clk, "100", flag4sec);
	counter4sec: reversible_counter port map (flag4sec, enable, duty4sec);
	timecounter5sec: time_counter port map (clk, "101", flag5sec);
	counter5sec: reversible_counter port map (flag5sec, enable, duty5sec);
	timecounter6sec: time_counter port map (clk, "110", flag6sec);
	counter6sec: reversible_counter port map (flag6sec, enable, duty6sec);
	timecounter7sec: time_counter port map (clk, "111", flag7sec);
	counter7sec: reversible_counter port map (flag7sec, enable, duty7sec);
	
	pwm1sec: pwm port map (clk, duty1sec, positive_output_test_mode(0));
	pwm2sec: pwm port map (clk, duty2sec, positive_output_test_mode(1));
	pwm3sec: pwm port map (clk, duty3sec, positive_output_test_mode(2));
	pwm4sec: pwm port map (clk, duty4sec, positive_output_test_mode(3));
	pwm5sec: pwm port map (clk, duty5sec, positive_output_test_mode(4));
	pwm6sec: pwm port map (clk, duty6sec, positive_output_test_mode(5));
	pwm7sec: pwm port map (clk, duty7sec, positive_output_test_mode(6));

    negate: not_gate_7bits port map (positive_output_test_mode, output_test_mode);
    
    -- final output
    final: mux_2to1_7bits port map (output_manual_or_automatic, output_test_mode, enable, '1', out_signal);
end arch;