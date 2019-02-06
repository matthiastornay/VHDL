-- XOR 3 bits
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;

-- Entity description
entity XOR_3_B is
     port(A, B, C : in std_logic;
	  S : out std_logic);

end XOR_3_B;

-- Behavior
architecture arch_XOR_3_B of XOR_3_B is

begin
     S <= A XOR B XOR C;

end arch_XOR_3_B;
