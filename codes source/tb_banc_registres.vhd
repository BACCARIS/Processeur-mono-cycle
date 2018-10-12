Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_banc is
end entity tb_banc;


architecture tb_comportemental_banc of tb_banc is 

    signal CLK, RST: std_logic;
    signal W: std_logic_vector (31 downto 0);
    signal RA, RB, RW: std_logic_vector (3 downto 0);
    signal WE: std_logic;
    signal A, B: std_logic_vector (31 downto 0);
begin
  
  T0 : entity work.BancRegistres(comportemental_bancregistres)
  port map ( CLK, RST, W, RA, RB, RW, WE, A, B );
    
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
      
      W <= X"0000000F";
      RW <= (others => '0');
      WE <= '1';
      
      wait for 2 ns;
      
      W <= X"0000000C";
      RW <= "0001";
      
      wait for 2 ns;
      
      WE <= '0';
      
      wait for 10 ns;
      
      RA <= (others => '0');
      RB <= "0001";
      
      wait for 10 ns;
      
      
    end process test;
    
  end architecture tb_comportemental_banc;
      
