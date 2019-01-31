library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all ;

entity unite_controle is
  port (
    DATAIN : in std_logic;
    RST, CLK, WE : in std_logic;
    DATAOUT : out std_logic_vector (31 downto 0)
  );
end entity;


architecture archi of unite_controle is
  
  signal SOUT: std_logic_vector(31 downto 0);
  
  begin
  
  Process (CLK, RST)
  begin
    if (RST = '1') then
      SOUT <= (others => '0');
    else
      if (rising_edge(CLK) and CLK = '1') then
        if (WE = '1') then
          SOUT(0) <= DATAIN;
        else
          SOUT <= SOUT;
        end if;
      end if;
    end if;
  end process;  
  
  DATAOUT <= SOUT; 
      
end architecture;