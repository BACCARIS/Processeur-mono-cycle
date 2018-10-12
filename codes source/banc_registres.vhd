library ieee;
use ieee.std_logic_1164.all;
--use ieee.std_logic_arith.all;
--use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity BancRegistres is
  port(
    CLK, RST: in std_logic;
    W: in std_logic_vector (31 downto 0);
    RA, RB, RW: in std_logic_vector (3 downto 0);
    WE: in std_logic;
    A, B: out std_logic_vector (31 downto 0)
  );
end entity;




architecture comportemental_bancregistres of BancRegistres is
  type table is array (15 downto 0) of std_logic_vector (31 downto 0);


  function init_banc return table is
  
    variable result: table;
  
  begin
    for i in 14 downto 0 loop
      result(i) := (others => '0');
    end loop;
  
    result(15) := X"00000030";
    return result;
  end init_banc;

  signal banc: table := init_banc;
begin
  
  write : process (CLK)
  begin
    if RST = '1' then
      banc <= init_banc;
    elsif rising_edge(CLK) and WE = '1' then
      banc(to_integer(unsigned(RW))) <= W;
    end if;
  end process;
  
  A <= banc(to_integer(unsigned(RA)));
  B <= banc(to_integer(unsigned(RB)));
  
end architecture;