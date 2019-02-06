-- Comparateur 4 bits
-- Matthias Tornay

-- Déclaration des librairies
library ieee;
use ieee.std_logic_1164.all;

-- Description de l'entité
entity Comparateur_4B is
	port(A, B : in std_logic_vector (3 downto 0);
	     S : out std_logic_vector (2 downto 0);
	     Seg7 : out std_logic_vector (7 downto 0));

end Comparateur_4B;

-- Déclaration du comportement
architecture arch_Comparateur_4B of Comparateur_4B is

begin
	S <= 	"100" when (A < B) else
	     	"010" when (A = B) else
	     	"001" when (A > B);

 	Seg7 <= "00000110" when (A < B) else
	     	"01111001" when (A = B) else
	     	"01101101" when (A > B);

end arch_Comparateur_4B;
