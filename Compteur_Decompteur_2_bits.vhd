-- Compteur/Décompteur 2 bits
-- Matthias Tornay

-- Déclaration des Librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Description de l'entité
entity Compteur_decompteur_2B is
	port(CLK, Init, Sens : in std_logic;
	     Q : out std_logic_vector(1 downto 0));

end Compteur_decompteur_2B;

-- Déclaration du comportement
architecture arch_Compteur_decompteur_2B of Compteur_decompteur_2B is

signal QQ : std_logic_vector (1 downto 0);

begin
	process(CLK)

	begin
		if Init = '1' then
			if Sens = '0' then QQ <= "11";
			else QQ <= "00";
			
			end if;
		
		elsif (Rising_edge(CLK)) then
	
			case sens is
				when '0' => QQ <= QQ-1;
				when '1' => QQ <= QQ+1;
		
			end case;		

		end if;	
	
	end process;

Q <= QQ;

end arch_Compteur_decompteur_2B;
