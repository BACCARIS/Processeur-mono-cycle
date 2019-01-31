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
 	  result(32) := std_logic_vector(to_unsigned(1,32));
	  result(33) := std_logic_vector(to_unsigned(2,32));
	  result(34) := std_logic_vector(to_unsigned(3,32));
	  result(35) := std_logic_vector(to_unsigned(4,32));
	  result(36) := std_logic_vector(to_unsigned(5,32));
	  result(37) := std_logic_vector(to_unsigned(6,32));
	  result(38) := std_logic_vector(to_unsigned(7,32));
	  result(39) := std_logic_vector(to_unsigned(8,32));
	  result(40) := std_logic_vector(to_unsigned(9,32));
	  result(41) := std_logic_vector(to_unsigned(10,32));
	  result(42) := std_logic_vector(to_unsigned(11,32));

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
  