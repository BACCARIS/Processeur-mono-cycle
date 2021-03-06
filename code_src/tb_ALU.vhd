Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ALU is
end entity tb_ALU;


architecture tb_comportemental_ALU of tb_ALU is 

signal OP1 : std_logic_vector( 1 downto 0);
signal A1, B1, S :std_logic_vector( 31 downto 0);
signal N : std_logic;

begin
  
  T0 : entity work.ALU(comportemental_ALU)
  port map ( OP1, A1, B1 , S, N);
    
  test : process
    begin
      
      OP1 <= "00"; --ADD
      A1 <= "00000000000000000000000000000101"; --5  x"00000005"
      B1 <= "00000000000000000000000000000111"; --7
      wait for 5 ns;
      
      OP1 <= "01"; --B1
      A1 <= "00000000000000000000000000000101"; --5
      B1 <= "00000000000000000000000000000111"; --7
      wait for 5 ns;
      
      OP1 <= "10"; --SUB
      A1 <= "00000000000000000000000000000101"; --5
      B1 <= "00000000000000000000000000000111"; --7
      
      wait for 5 ns;
      
      OP1 <= "11"; --A1
      A1 <= "00000000000000000000000000000101"; --5
      B1 <= "00000000000000000000000000000111"; --7
      
      wait for 5 ns;
      
    end process test;
    
  end architecture tb_comportemental_ALU;
      