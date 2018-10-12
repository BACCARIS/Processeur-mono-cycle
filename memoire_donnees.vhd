library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity memoire_donnees is 
  port (
    CLK, WrEn : in std_logic;
    DataIn : in std_logic_vector( 31 downto 0);
    DataOut : out std_logic_vector( 31 downto 0);
    Addr : in std_logic_vector( 5 downto 0)
  );
end entity;

architecture archi_memoire_donnees of memoire_donnees is
  type table_memoire is array (63 downto 0) of std_logic_vector (31 downto 0);
  
  function init_banc return table_memoire is
  
    variable result: table_memoire;
    
  begin
    for i in 62 downto 0 loop
      result(i) := (others => '0');
    end loop;
  
    result(63) := X"00000030";
    return result;
  end init_banc;

  signal memoire: table_memoire := init_banc;
  
  begin
    
    DataOut <= memoire( to_integer(unsigned(Addr)) );
    
    write : process(CLK)
    begin
      
      if WrEn = '1' and rising_edge(CLK) then 
        memoire( to_integer(unsigned(Addr)) ) <= DataIn;
      end if;
      
    end process;
  end architecture;
  