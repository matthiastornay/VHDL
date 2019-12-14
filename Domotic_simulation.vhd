-- Domotic simulation
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;

-- Entity description
entity simulation is
	port(S, T, V : in std_logic;
	     awning, fan, sprayer : out std_logic);

end simulation;

-- Behavior
architecture arch_simulation of simulation is
begin
	awning  <= S and not V;
 	fan <= T and not V;
 	sprayer <= S and T and not V;

end arch_simulation;
