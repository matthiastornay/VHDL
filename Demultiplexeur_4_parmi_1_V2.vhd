-- Démultiplexeur 4 parmi 1
-- Matthias Tornay

-- Déclaration des Librairies
library ieee;
use ieee.std_logic_1164.all;

-- Description de l'entité
entity Demultiplexeur_4C1 is
     port(E, D : in std_logic;
	  Sel : in std_logic_vector (1 downto 0);
	  S0, S1, S2, S3 : out std_logic);

end DEMUX_14;

-- Déclaration du comportement
architecture arch_Demultiplexeur_4C1 of Demultiplexeur_4C1 is

begin
     with Sel select
          S0 <= ((D) or (E)) when "00",
                '1' when others;

     with Sel select
	  S1 <= ((D) or (E)) when "01",
                '1' when others;
	
     with Sel select
	  S2 <= ((D) or (E)) when "10",
                '1' when others;
     
     with Sel select
	  S3 <= ((D) or (E)) when "11",
                '1' when others;
	
end arch_Demultiplexeur_4C1;

signal white_now : std_logic_vector (2 downto 0);

white_now <= (Sel)&(E);
