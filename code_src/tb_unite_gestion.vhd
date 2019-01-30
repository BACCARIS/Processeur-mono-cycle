Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_unite_gestion is
end entity tb_unite_gestion;

architecture archi of tb_unite_gestion is 
  
    signal CLK, RST : std_logic;
    signal nPCsel : std_logic;
    signal Offset : std_logic_vector(23 downto 0);
    signal instruction : std_logic_vector(31 downto 0);
    
  begin
  
  unite_gestion: entity work.unite_gestion port map (CLK, RST, nPCsel, Offset, instruction);



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
      wait for 4 ns;
      RST <= '0';
      
      Offset <= "000000000000000000001111";
      
      -- nPCsel = 0 , PC est incremente a chaque cout d'horloge
      nPCsel <= '0';
      
      wait for 10 ns;
      
      nPCsel <= '1';
      
      wait for 6 ns;
      
    end process;
  end architecture;
  
      