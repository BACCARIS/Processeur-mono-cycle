library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all ;

entity processeur_monocycle is
  port(
    CLK, RST: in std_logic
    );
end entity;


architecture archi of processeur_monocycle is

  -- entree unite_gestion
  signal nPCsel: std_logic;
  signal offset: std_logic_vector(23 downto 0);
  -- sortie unite gestion
  signal instruction: std_logic_vector(31 downto 0); -- entree unite decodeur instrcution
  
  -- entree unite decodeur instruction
  signal N : std_logic; -- flag de l'ALU aussi sortie du PSR 
  
  -- sortie unite decodeur instruction
  signal WrSrc: std_logic;                       -- entree unite traitement
  signal MemWr: std_logic;                       -- entree unite traitement
  signal ALUflag: std_logic_vector(31 downto 0); -- sortie unite traitement
  signal ALUctr: std_logic_vector(1 downto 0);   -- entree unite traitement
  signal ALUsrc: std_logic;                      -- entree unite traitement
  signal RegSel: std_logic;                      -- entree mux avant unite traitement
  signal Rd, Rm, Rn: std_logic_vector(3 downto 0);-- entree unite traitement
  signal RegWr: std_logic;                       -- entree unite traitement
  signal imm: std_logic_vector (7 downto 0);     -- entree unite traitement
  signal PSREn: std_logic;                       -- entree unite controle
  
  -- entree unite traitement
  signal Rs: std_logic_vector(3 downto 0);
 
  
  constant muxN: integer :=4;

  

begin
  
  get_instruction: entity work.unite_gestion port map(CLK, RST, nPCsel, offset, instruction);
  config_instruction: entity work.decodeur_instructions port map(instruction, ALUflag, offset, Imm, Rn, Rd, Rm, ALUctr, ALUsrc, PSRen, nPCsel, WrSrc, MemWr, RegSel, RegWr);
  mux_RegSel: entity work.mux2v1 generic map (muxN) port map (Rd, Rm, RegSel, Rs);
  PSR: entity work.unite_controle port map(N, CLK, RST, PSRen, ALUflag);
  do_traitement: entity work.unite_traitement port map(CLK, RST, RegWr, Rn, Rd, Rm, Imm, ALUsrc, WrSrc, ALUctr, MemWr, N);
  
end;
