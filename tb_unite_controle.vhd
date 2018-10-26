Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_unite_controle is
end entity tb_unite_controle;

architecture archi of tb_unite_controle is 
  
    signal DATAIN, DATAOUT : std_logic_vector (31 downto 0);
    signal CLK, RST, WE : std_logic;
    
  begin
  
  unite_controle: entity work.unite_controle port map (DATAIN, RST, CLK, WE, DATAOUT);



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
      
      DATAIN <= X"0000000f";
      WE <= '1';
      
      wait for 2 ns;
      
      WE <= '0';
      
      wait for 6 ns;
      
      DATAIN <= X"0000000c";
      WE <= '1';      
      
      wait for 2 ns;
    end process;
  end architecture;
  