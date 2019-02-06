-- Séquenceur
-- Matthias Tornay

-- Déclaration des Librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Description de l'entité
entity Sequenceur is
     port(CLK : in std_logic;
          Preset : in std_logic_vector (1 downto 0);
	  Q : out std_logic_vector(2 downto 0));

end Sequenceur;

-- Déclaration du comportement
architecture arch_Sequenceur of Sequenceur is

Type Etat_Sequenceur is (ZERO, DEUX, QUATRE, CINQ, SIX, UN, TROIS, SEPT);
signal Etat, Etat_Machine : Etat_Sequenceur;

begin			
     process(CLK, Preset)
     
     begin
          if rising_Edge(CLK) then
	       case Etat is
	            when ZERO => Etat_Machine <= QUATRE;
		    when QUATRE => Etat_Machine <= DEUX;
	    	    when DEUX => Etat_Machine <= CINQ;
		    when CINQ => Etat_Machine <= SIX;
		    when SIX => Etat_Machine <= ZERO;
		    when UN => Etat_Machine <= ZERO;
		    when TROIS => Etat_Machine <= ZERO;
		    when SEPT => Etat_Machine <= ZERO;
	
               end case;
  
          end if;
	
     end process;
	 
     with Preset select
          Etat <= UN when "01",
		  TROIS when "10",
	          SEPT when "11",
		  Etat_Machine when "00";
			
Q <= "000" when Etat = ZERO else
     "001" when Etat = UN else
     "010" when Etat = DEUX else
     "011" when Etat = TROIS else
     "100" when Etat = QUATRE else
     "101" when Etat = CINQ else
     "110" when Etat = SIX else
     "111" when Etat = SEPT;

end arch_Sequenceur;
