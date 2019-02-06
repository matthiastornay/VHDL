-- D Latch
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;

-- Entity description
entity D_latch is
     port(D, Latch : in std_logic;
	  Q : out std_logic);

end D_latch;

-- Behavior
architecture arch_D_latch of D_latch is

begin
     process(Latch, D)
          begin
	       if (Latch = '0') then Q <= D;
  
	       end if;
 
     end process;

end arch_D_latch;
