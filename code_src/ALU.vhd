library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all ;

entity ALU is 
  port(
    OP : in std_logic_vector( 1 downto 0);
    A, B : in std_logic_vector( 31 downto 0);
    S : out std_logic_vector( 31 downto 0);
    N : out std_logic 
  );
end ALU;

architecture comportemental_ALU of ALU is
  signal Y : std_logic_vector( 31 downto 0);
begin 
  
  Process(A, B, OP)
    begin
      
      if OP = "00" then
        Y <= A + B;
      elsif OP = "01" then
        Y <= B;
      elsif OP = "10" then
        Y <= A - B;
      else 
        Y <= A;
      end if;
        
    end Process;
    
    N <= Y(31);
    S <= Y;
end architecture;
