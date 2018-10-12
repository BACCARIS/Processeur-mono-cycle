Library IEEE;
use IEEE.std_logic_1164.all;

entity unite_traitement is
  port (
    CLK, RST, WE: in std_logic;
    RA, RB, RW: in std_logic_vector (3 downto 0);
    Imm: in std_logic_vector (7 downto 0);
    COM1, COM2: in std_logic;
    OP: in std_logic_vector(1 downto 0);
    WrEn: in std_logic;
    N: out std_logic
  );
end entity;


architecture archi of unite_traitement is
  signal busW, busA, busB, immExtend, ALUout, DataOut, mux1S: std_logic_vector (31 downto 0);
  constant immN: integer := 8;
  constant muxN: integer := 32;
begin
  
  registres: entity work.banc_registres port map (CLK, RST, busW, RA, RB, RW, WE, busA, busB);
  immExtender: entity work.extension_signe generic map (immN) port map (Imm, immExtend);
  mux1: entity work.mux2v1 generic map (muxN) port map (busB, immExtend, COM1, mux1S);
  ALU: entity work.ALU port map (OP, busA, mux1S, ALUout, N);
  memoire: entity work.memoire_donnees port map (CLK, WrEn, busB, DataOut, ALUout(5 downto 0));
  mux2: entity work.mux2v1 generic map (muxN) port map (ALUout, DataOut, COM2, busW);
  
end architecture;