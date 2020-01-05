
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY counter_tb IS
END counter_tb;
 
ARCHITECTURE behavior OF counter_tb IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT counter
    PORT(
         clk : IN  std_logic;
         rst : IN  std_logic;
         enable : IN  std_logic;
         count : OUT  std_logic_vector(3 downto 0);
         salida : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';
   signal enable : std_logic := '0';

 	--Outputs
   signal count : std_logic_vector(3 downto 0);
   signal salida : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: counter PORT MAP (
          clk => clk,
          rst => rst,
          enable => enable,
          count => count,
          salida => salida
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here 
		rst<='1';
		enable<='1';
		wait for 20 ns;
		
		rst<='0';
		wait for 120 ns;
		
		enable<='0';
		wait for 20 ns;
      wait;
   end process;

END;
