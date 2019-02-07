-- Adder 8 bits
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity LED is
	port(S : in std_logic;
	     LED : out std_logic_vector (7 downto 0));

end LED;

-- Behavior
architecture arch_LED of LED is

begin
	with S select  
    		LED <= "10111001" when '1',
		       "11110011" when '0';   

end arch_LED;
