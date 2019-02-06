-- Bascule D Latch
-- Matthias Tornay

-- Déclaration des Librairies
library ieee;
use ieee.std_logic_1164.all;

-- Description de l'entité
entity Bascule_D_Latch is
     port(D, Latch : in std_logic;
	  Q : out std_logic);

end Bascule_D_Latch;

-- Déclaration du comportement
architecture arch_Bascule_D_Latch of Bascule_D_Latch is

begin
     process(Latch, D)
          begin
	       if (Latch = '0') then Q <= D;
  
	       end if;
 
     end process;

end arch_Bascule_D_Latch;
