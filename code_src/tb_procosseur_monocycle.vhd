Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_processeur_monocycle is
end entity tb_processeur_monocycle;

architecture archi of tb_processeur_monocycle is 

    signal CLK, RST: std_logic;
    
 begin
  
  processeur: entity work.processeur_monocycle port map (CLK, RST);


  clk_gen : process
  begin
    CLK <= '1';
    wait for 1 ns;
    CLK <= '0';
    wait for 1 ns;
  end process;
  
  test : process
    begin
      
      RST <= '1';
      wait for 2 ns;
      RST <= '0';
      wait ;

    end process;
  end architecture;
  