library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all ;

entity unite_gestion is
  port (
    CLK, RST : in std_logic;
    nPCsel : in std_logic;
    Offset : in std_logic_vector(23 downto 0);
    instruction : out std_logic_vector(31 downto 0)
  );
end entity;


architecture archi_unite_gestion of unite_gestion is
  
  signal extended_offset, PC, registre : std_logic_vector(31 downto 0);
  constant taille_offset: integer := 24;
  
  begin
    
    PCextender : entity work.extension_signe generic map (taille_offset) port map (Offset, extended_offset);
      
    -- registre PC
    Process ( CLK, RST )
      begin
      
      if (RST = '1') then
        PC <= (others => '0' );
        registre <= ( others => '0');
      else
        if clk = '1' then
          registre <= PC;
        else
          registre <= registre;
        end if;
        
        if ( nPCsel = '0' ) then
          PC <= PC + 1;
        else
          PC <= PC + 1 +  extended_offset;
        end if;
      
      end if;
    end process; 
      
        
    instruction_mem : entity work.instruction_memory port map( PC, instruction);  
  end architecture;