Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_mux2v1 is
end entity tb_mux2v1;


architecture tb_behavioral_mux2v1 of tb_mux2v1 is 

  signal A, B, S : std_logic_vector ( N-1 downto 0);
  signal COM : std_logic;

begin
  
  T0 : entity work.mux2v1 generic map ( 32 );
  port map ( A, B, COM, S);
    
  test : process
    begin
      
      --stuff
      
    end process test;
    
  end architecture tb_behavioral_mux2v1;