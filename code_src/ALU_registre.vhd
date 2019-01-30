library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all ;


entity ALU_registre is port (
  --input
	CLK, Reset : in std_logic;
	RA, RB, RW: in std_logic_vector (3 downto 0);
	WE : in std_logic;
	OP : in std_logic_vector(1 downto 0);
	
	--output
	N : out std_logic 
);
end entity ALU_registre;

architecture arch_ALU_registre of ALU_registre is
	Signal busA, busB, busW: std_logic_vector(31 downto 0);

begin
  
	registre : entity work.banc_registres(comportemental_bancregistres) port map (CLK, Reset, busW, RA, RB, RW, WE, busA, busB);
	calcul : entity work.ALU(comportemental_ALU) port map (OP, busA, busB, busW, N);


end architecture arch_ALU_registre;