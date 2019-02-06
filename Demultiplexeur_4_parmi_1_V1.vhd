-- Démultiplexeur 4C1
-- Matthias Tornay

-- Déclaration des Librairies
library ieee;
use ieee.std_logic_1164.all;

-- Description de l'entité
entity Demultiplexeur_4C1 is
     port(E, D : in std_logic;
	  Sel : in std_logic_vector (1 downto 0);
	  S0, S1, S2, S3 : out std_logic);

end Demultiplexeur_4C1;

-- Déclaration du comportement
architecture arch_Demultiplexeur_4C1 of Demultiplexeur_4C1 is

begin
     S0 <= D when (Sel = "00") and (E = '0') else '1';
     S1 <= D when (Sel = "01") and (E = '0') else '1';
     S2 <= D when (Sel = "10") and (E = '0') else '1';
     S3 <= D when (Sel = "11") and (E = '0') else '1';
	
end arch_Demultiplexeur_4C1;
