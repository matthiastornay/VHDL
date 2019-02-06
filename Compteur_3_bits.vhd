-- Compteur 3 bits
-- Matthias Tornay

-- Déclaration des Librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Description de l'entité
entity Compteur_3B is
	port(CLK, Reset : in std_logic;
	     Q : out std_logic_vector(2 downto 0));

end Compteur_3B;

-- Déclaration du comportement
architecture arch_Compteur_3B of Compteur_3B is

signal QQ : std_logic_vector (2 downto 0);

begin
	process(CLK, Reset)
	
	begin
		if (Reset = '0') then QQ <= "000";		-- Asynchrone
		elsif (Rising_edge(CLK)) then QQ <= QQ + 1;	-- Synchrone
		end if;

	end process;

Q <= QQ;

end arch_Compteur_3B;
