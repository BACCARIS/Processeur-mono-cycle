Library IEEE;
use IEEE.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all ;

entity decodeur_instructions is
  port (
    instruction: in std_logic_vector(31 downto 0);
    ALUflag: in std_logic_vector(31 downto 0);
    offset: out std_logic_vector(23 downto 0);
    Imm: out std_logic_vector (7 downto 0);
    Rn, Rd, Rm : out std_logic_vector(3 downto 0);
    ALUctr: out std_logic_vector(1 downto 0);
    ALUsrc: out std_logic;
    PSREn: out std_logic;
    nPCsel: out std_logic;
    WrSrc: out std_logic;
    MemWr: out std_logic;
    RegSel: out std_logic; 
    RegWr: out std_logic
    );
  end entity;
  
  
architecture archi_decodeur_instructions of decodeur_instructions is

  type enum_instruction is (MOV, ADDi, ADDr, CMP, LDR, STR, BAL, BLT);
  signal instr_courante: enum_instruction;
  signal op : std_logic_vector(11 downto 0);
  
  begin
    
    instruction_select : process(instruction)
    begin
      op <= instruction(31 downto 20);
      
      if (op = "111000101000") then
        instr_courante <= ADDi;
      elsif (op = "111000001000") then
        instr_courante <= ADDr;
      elsif (op = "111000111010") then
        instr_courante <= MOV;
      elsif (op = "111000110101") then
        instr_courante <= CMP;
      elsif (op = "111001100001") then
        instr_courante <= LDR;
      elsif (op = "111001100000") then
        instr_courante <= STR;
      elsif (op(11 downto 4) = "11101010") then
        instr_courante <= BAL;
      elsif (op(11 downto 4) = "10111010") then
        instr_courante <= BAL;
      end if;
        
    end process instruction_select;
    
    config_instruction : process(instruction)
    begin
    
    nPCsel  <= '0';
    RegWr   <= '1';
    ALUsrc  <= '1';
    ALUctr  <= "00";
    PSREn   <= '0';
    MemWr   <= '0';
    WrSrc   <= '0';
    RegSel  <= '0';
    offset  <= "000000000000000000000000";
    imm     <= "00000000";
    Rd      <= "0000";
    Rn      <= "0000";
    Rm      <= "0000";
      
      if (instr_courante = ADDi) then
        nPCsel  <= '0';
        RegWr   <= '1';
        ALUsrc  <= '1';
        ALUctr  <= "00";
        PSREn   <= '0';
        MemWr   <= '0';
        WrSrc   <= '0';
        RegSel  <= '0';
        imm     <= instruction(7 downto 0);
        Rd      <= instruction(15 downto 12);
        Rn      <= instruction(19 downto 16);
      elsif (instr_courante = ADDr) then
        nPCsel  <= '0';
        RegWr   <= '1';
        ALUsrc  <= '0';
        ALUctr  <= "00";
        PSREn   <= '0';
        MemWr   <= '0';
        WrSrc   <= '0';
        RegSel  <= '0';
        Rd      <= instruction(15 downto 12);
        Rn      <= instruction(19 downto 16);
        Rm      <= instruction(3 downto 0);
      elsif (instr_courante = BAL) then 
        nPCsel  <= '1';
        RegWr   <= '0';
        ALUsrc  <= '0';
        ALUctr  <= "00";
        PSREn   <= '0';
        MemWr   <= '0';
        WrSrc   <= '0';
        RegSel  <= '0';
        offset  <= instruction(23 downto 0);
      elsif (instr_courante = BLT) then 
        nPCsel  <= ALUflag(0); 
        RegWr   <= '0';
        ALUsrc  <= '0';
        ALUctr  <= "00";
        PSREn   <= '1';
        MemWr   <= '0';
        WrSrc   <= '0';
        RegSel  <= '0';
        offset  <= instruction(23 downto 0);
      elsif (instr_courante = CMP) then
        nPCsel  <= '0';
        RegWr   <= '0';
        ALUsrc  <= '1';
        ALUctr  <= "10";
        PSREn   <= '1';
        MemWr   <= '0';
        WrSrc   <= '0';
        RegSel  <= '0';
        imm     <= instruction(7 downto 0);
        Rd      <= instruction(19 downto 16);
      elsif (instr_courante = LDR) then
        nPCsel  <= '0';
        RegWr   <= '1';
        ALUsrc  <= '1';
        ALUctr  <= "00";
        PSREn   <= '1';
        MemWr   <= '0';
        WrSrc   <= '1';
        RegSel  <= '0';
        offset(11 downto 0)  <= instruction(11 downto 0);
        Rd      <= instruction(15 downto 12);
        Rn      <= instruction(19 downto 16);
      elsif (instr_courante = MOV) then
        nPCsel  <= '0';
        RegWr   <= '1';
        ALUsrc  <= '1';
        ALUctr  <= "01";
        PSREn   <= '0';
        MemWr   <= '0';
        WrSrc   <= '0';
        RegSel  <= '0';
        imm     <= instruction(7 downto 0);
        Rd      <= instruction(15 downto 12);
      elsif (instr_courante = STR) then
        nPCsel  <= '0';
        RegWr   <= '0';
        ALUsrc  <= '1';
        ALUctr  <= "00";
        PSREn   <= '0';
        MemWr   <= '1';
        WrSrc   <= '0';
        RegSel  <= '1';
        offset(11 downto 0)  <= instruction(11 downto 0);
        Rd      <= instruction(15 downto 12);
        Rn      <= instruction(19 downto 16);
      end if;             
      
    end process config_instruction;
    
  end architecture;
  
    
  


