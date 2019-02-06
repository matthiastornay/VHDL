-- OR 2 bits
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;

-- Entity description
entity OR_2B is
     port(A, B : in std_logic;
	  S : out std_logic);

end OR_2B;

-- Behavior
architecture arch_OR_2B of OR_2B is

begin
     S <= A OR B;

end arch_OR_2B;
