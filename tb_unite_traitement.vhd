Library IEEE;
use IEEE.std_logic_1164.all;

entity tb_unite_traitement is
end entity tb_unite_traitement;


architecture archi of tb_unite_traitement is 

	signal CLK, RST, WE: std_logic;
  signal RA, RB, RW: std_logic_vector (3 downto 0);
  signal Imm: std_logic_vector (7 downto 0);
  signal COM1, COM2: std_logic;
  signal OP: std_logic_vector(1 downto 0);
  signal WrEn: std_logic;
  signal N: std_logic;
    
begin
  
  unite_traitement: entity work.unite_traitement port map (CLK, RST, WE, RA, RB, RW, Imm, COM1, COM2, OP, WrEn, N);
    
  clk_gen : process
  begin
    CLK <= '1';
    wait for 1 ns;
    CLK <= '0';
    wait for 1 ns;
  end process;
    
  test : process
    begin
      
      -- reset
      RST <= '1';
      wait for 4 ns;
      RST <= '0';
      
      -- ========================
      -- addition de 2 registres
      -- R1 = R15
      -- R2 = R15 + R1
      
      COM1 <= '0';
      COM2 <= '0';
      WrEn <= '0';
      WE <= '0'; -- pas d'ecriture
      
      RA <= "1111"; -- A = R(15)
      OP <= "11"; -- OP = get(A)
      RW <= "0001"; -- on met la valeur dans R(1)
      
      wait for 4 ns;

      
      WE <= '1'; -- activation de l'ecriture
      wait for 2 ns;
      
      WE <= '0';
      RA <= "0001"; -- A = R(1)
      RB <= "1111"; -- B = R(15)
      OP <= "00"; -- OP = ADD 
      
      RW <= "0010"; -- ecrire dans R(2)
      
      wait for 4 ns;
      
      WE <= '1';
      
      wait for 2 ns;
      
      WE <= '0';
      
      wait for 10 ns;
      
      -- ========================
      -- addition d'un registre avec une valeur immediate
      -- R2 = R15 + Imm
      
      COM1 <= '1'; -- activer Imm
      Imm <= "00000010";
      RA <= "1111"; -- A = R(15)
      OP <= "00";
      RW <= "0010"; -- ecrire dans R(2)
      
      wait for 2 ns;
      
      WE <= '1';
      
      wait for 2 ns;
      
      WE <= '0';
      
      wait for 10 ns;
      
      -- ========================
      -- soustraction de 2 registres
      -- R3 = R2 - R15
      
      COM1 <= '0'; -- activer registres
      RA <= "0010"; -- A = R(2)
      RB <= "1111"; -- B = R(15)
      OP <= "10"; -- SUB
      RW <= "0011"; -- ecrire dans R(3)
      
      wait for 2 ns;
      
      WE <= '1';
      
      wait for 2 ns;
      
      WE <= '0';
      
      wait for 10 ns;
      
      -- ========================
      -- soustraction registre - Imm
      -- R4 = R15 - Imm
      
      COM1 <= '1'; -- activer Imm
      Imm <= "00001000";
      RA <= "1111"; -- A = R(15)
      RW <= "0100"; -- ecrire dans R(4)
      
      wait for 2 ns;
      
      WE <= '1';
      
      wait for 2 ns;
      
      WE <= '0';
      
      wait for 10 ns;
      
      -- ========================
      -- lecture d'un mot de la memoire dans un registre
      -- R5 = mem(63)
      
      Imm <= "00111111"; -- Imm = 63
      OP <= "01"; -- B
      COM2 <= '1'; -- activer memoire
      RW <= "0101"; -- ecrire dans R5
      
      wait for 2 ns;
      
      WE <= '1';
      
      wait for 2 ns;
      
      WE <= '0';
      
      wait for 10 ns;
      
      -- ========================
      -- ecriture d'un registre dans la memoire
      -- mem(0) = R(2)
      
      RB <= "0010"; -- B = R(2)
      Imm <= "00000000"; -- addresse memoire 0
      
      wait for 2 ns;
      
      WrEn <= '1';
      
      wait for 2 ns;
      
      WrEn <= '0';
      
      wait for 10 ns;
            
    end process test;
    
  end architecture;