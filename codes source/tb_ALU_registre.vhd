Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_ALU_registre is
end entity tb_ALU_registre;


architecture tb_arch_ALU_registre of tb_ALU_registre is 

	signal CLK, RST : std_logic;
	signal RA, RB, RW: std_logic_vector (3 downto 0);
	signal WE : std_logic;
	signal OP : std_logic_vector(1 downto 0);
	signal N : std_logic ;
begin
  
  T0 : entity work.ALU_registre(arch_ALU_registre)
  port map (CLK, RST, RA, RB, RW, WE, OP);
    
  clk_gen : process
  begin
    CLK <= '1';
    wait for 1 ns;
    CLK <= '0';
    wait for 1 ns;
  end process;
    
  test : process
    begin
      
      --initialisation des registres
      RST <= '1';
      wait for 2 ns;
      RST <= '0';
      
      --operation 1
      WE <= '0'; -- pas d'ecriture
      RA <= "1111"; -- A = R(15)
      OP <= "11"; -- OP = get(A)
      
      wait for 10 ns;

      RW <= "0001"; -- on met la valeur dans R(1)
      WE <= '1'; -- activation de l'ecriture
      wait for 2 ns;
      
      --operation 2
      WE <= '0';
      RA <= "0001"; -- A = R(1)
      RB <= "1111"; -- B = R(15)
      OP <= "00"; -- OP = ADD 
      
      wait for 10 ns;
      
      RW <= "0001"; -- on met la valeur dans R(1)
      WE <= '1';
      wait for 2 ns;
      
      --operation 3
      WE <= '0';
      RA <= "0001"; -- A = R(1)
      RB <= "1111"; -- B = R(15)
      OP <= "00"; -- OP = ADD
      
      wait for 10 ns;
      
      RW <= "0010"; -- on met la valeur dans R(2)
      WE <= '1';
      wait for 2 ns;
      
      --operation 4
      WE <= '0';
      RA <= "0001"; -- A = R(1)
      RB <= "1111"; -- B = R(15)
      OP <= "10"; -- OP = SUB
      
      wait for 10 ns;
      
      WE <= '1';
      RW <= "0011"; -- on met la valeur dans R(3)
      wait for 2 ns;
      
      --operation 5
      WE <='0';
      RA <= "0111"; -- A = R(7)
      RB <= "1111"; -- B = R(15)
      OP <= "10"; -- OP = SUB
      
      wait for 10 ns;
      
      WE <= '1';
      RW <= "0101"; -- on met la valeur dans R(5);
      wait for 2 ns;

      
    end process test;
    
  end architecture tb_arch_ALU_registre;