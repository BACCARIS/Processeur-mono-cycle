library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;

entity tb_ExtensionSigne is
end entity;

architecture test of tb_ExtensionSigne is

	signal N: integer := 8;
    signal E: std_logic_vector (N - 1 downto 0);
    signal S: std_logic_vector (31 downto 0);

begin

    test: entity work.extension_signe generic map (N)
    	port map (E, S);

    test_process: process
    begin
    	E <= "00000001";

        wait for 5 ns;

    	E <= "00000010";

        wait for 5 ns;

	    E <= "11111111";

    	wait for 5 ns;
    	
    	E <= "10000001";
    	
    	wait for 5 ns;

    	assert false report "Test done." severity note;
	    wait;
    end process;
end architecture;
