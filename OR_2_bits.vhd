-- OR 2 bits
-- Matthias Tornay

-- D�claration des Librairies
library ieee;
use ieee.std_logic_1164.all;

-- Description de l'entit�
entity OR_2B is
     port(A, B : in std_logic;
	  S : out std_logic);

end OR_2B;

-- D�claration du comportement
architecture arch_OR_2B of OR_2B is

begin
     S <= A OR B;

end arch_OR_2;
