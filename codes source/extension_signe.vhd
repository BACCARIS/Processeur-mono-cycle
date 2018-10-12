library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity ExtensionSigne is

	generic ( N: integer );
	port (
    	E: in std_logic_vector (N - 1 downto 0);
        S: out std_logic_vector (31 downto 0)
    );

end entity;

architecture archi of ExtensionSigne is
begin

	S <= SXT(E, S'length);

end architecture;
