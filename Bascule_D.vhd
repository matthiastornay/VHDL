-- Bascule D
-- Matthias Tornay

-- Déclaration des librairies
library ieee;
use ieee.std_logic_1164.all;

-- Description de l'entité
entity Bascule_D is
	port(D, CLK, Set, Reset : in std_logic;
	     Q : out std_logic);

end Bascule_D;

-- Déclaration du comportement
architecture arch_Bascule_D of Bascule_D is

begin
     	process(CLK, Set, Reset)
     
	begin
		--if (Set = '0') then Q <= '1';		-- Asynchrone
   		--elsif (Reset = '0') then Q <= '0';
   		--elsif Rising_edge(CLK) then Q <= D;
   
		  if Rising_edge(CLK) then		-- Sychrone
	    	  	if (Set = '0') then Q <= '1';
	  		elsif (Reset = '0') then Q <= '0';
			else Q <= D;

    	 	end if;

    	end if;

 	end process;

end arch_Bascule_D;
