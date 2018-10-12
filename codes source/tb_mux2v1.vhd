Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux2v1 is
end entity tb_mux2v1;


architecture tb_behavioral_mux2v1 of tb_mux2v1 is 
  
  signal N : integer ;
  signal A, B, S : std_logic_vector ( N-1 downto 0);
  signal COM : std_logic;

begin
  
  T0 : entity work.mux2v1 generic map ( 4 )
  port map ( A, B, COM, S);
    
  test : process
    begin
      
      A <= "0010";
      B <= "0100";
      
      
      COM <= '0';
      
      wait for 10 ns;
      
      COM <= '1';
      
      wait for 10 ns;
      
    end process test;
    
  end architecture tb_behavioral_mux2v1;