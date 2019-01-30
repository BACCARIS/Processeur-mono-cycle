Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_memoire_donnees is
end entity tb_memoire_donnees;


architecture tb_archi_memoire_donnees of tb_memoire_donnees is 

    signal CLK, WrEn : std_logic;
    signal DataIn : std_logic_vector( 31 downto 0);
    signal DataOut : std_logic_vector( 31 downto 0);
    signal Addr : std_logic_vector( 5 downto 0);
begin
  
  T0 : entity work.memoire_donnees(archi_memoire_donnees)
  port map ( CLK, WrEn, DataIn, DataOut, Addr);
    
  clk_gen : process
  begin
    CLK <= '1';
    wait for 1 ns;
    CLK <= '0';
    wait for 1 ns;
  end process;
    
  test : process
    begin
      
      DataIn <= X"00000008";
      WrEn <= '0';    
      Addr <= "000101"; -- 5ieme adresse
      
      wait for 10 ns;
      
      WrEn <= '1';
      Addr <= "001111"; -- 15ieme adresse
      
      wait for 2 ns;
      
      WrEn <= '0';
      wait for 20 ns;
      
      
    end process test;
    
  end architecture tb_archi_memoire_donnees;