-- Moteur 1 - Sens Horaire
-- Matthias Tornay

-- Déclaration des Librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Description de l'entité
entity Sens_Horaire is
     port(CLK, sens, blocage, stop, demi_pas : in std_logic;
	  PH : out std_logic_vector(3 downto 0));

end Sens_Horaire;

-- Déclaration du comportement
architecture arch_Sens_Horaire of Sens_Horaire is

Type Etat_Sens_Horaire is (E0, E1, E2, E3, E4, E5, E6, E7, E8);
signal Etat: Etat_Sens_Horaire;

begin
			
process(CLK)

begin  	
     if rising_Edge() then
          if (blocage = '1') then 
	       Etat <= Etat;
    
     else
          if demi_pas = '0' then
	       if stop = '1' then
	            case Etat is
 		         when E0 => Etat <= E0;
			 when E1 => Etat <= E0;
			 when E2 => Etat <= E0;
			 when E3 => Etat <= E0;
			 when E4 => Etat <= E0;
			 when E5 => Etat <= E0;
			 when E6 => Etat <= E0;
			 when E7 => Etat <= E0;
			 when E8 => Etat <= E0;

		    end case;
	else
		if sens = '1' then 	
			case Etat is
				when E0 => Etat <= E2;
				when E2 => Etat <= E4;
				when E4 => Etat <= E6;
				when E6 => Etat <= E8;
				when E8 => Etat <= E2;
				when E1 => Etat <= E2;
				when E3 => Etat <= E2;
				when E5 => Etat <= E2;
				when E7 => Etat <= E2;
			end case;
		else	
			case Etat is
				when E0 => Etat <= E2;
				when E2 => Etat <= E8;
				when E8 => Etat <= E6;
				when E6 => Etat <= E4;
				when E4 => Etat <= E2;
				when E1 => Etat <= E2;
				when E3 => Etat <= E2;
				when E5 => Etat <= E2;
				when E7 => Etat <= E2;
			end case;
		end if;
	end if;
 else
	if Stop = '1' then
		case Etat is
				when E0 => Etat <= E0;
				when E1 => Etat <= E0;
				when E2 => Etat <= E0;
				when E3 => Etat <= E0;
				when E4 => Etat <= E0;
				when E5 => Etat <= E0;
				when E6 => Etat <= E0;
				when E7 => Etat <= E0;
				when E8 => Etat <= E0;
		end case;
	else
		if sans = '1' then 	
			case Etat is
				when E0 => Etat <= E1;
				when E1 => Etat <= E2;
				when E2 => Etat <= E3;
				when E3 => Etat <= E4;
				when E4 => Etat <= E5;
				when E5 => Etat <= E6;
				when E6 => Etat <= E7;
				when E7 => Etat <= E8;
				when E8 => Etat <= E1;
			end case;
		else	
			case Etat is
				when E8 => Etat <= E7;
				when E7 => Etat <= E6;
				when E6 => Etat <= E5;
				when E5 => Etat <= E4;
				when E4 => Etat <= E3;
				when E3 => Etat <= E2;
				when E2 => Etat <= E1;
				when E1 => Etat <= E8;
				when E0 => Etat <= E1;
			end case;
		end if;
	end if;
  end if;
 end if;
end if;	
end process;

Ph <= "0000" when Etat = E0 else
	  "1000" when Etat = E1 else
	  "1010" when Etat = E2 else
	  "0010" when Etat = E3 else
	  "0110" when Etat = E4 else
	  "0100" when Etat = E5 else
	  "0101" when Etat = E6 else
	  "0001" when Etat = E7 else
	  "1001" when Etat = E8;
end arch_SH;
