-- D flip-flop
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;

-- Entity description
entity d_flipflop is
	port(D, CLK, Set, Reset : in std_logic;
	     Q : out std_logic);

end d_flipflop;

-- Behavior
architecture arch_d_flipflop of d_flipflop is

begin
     	process(CLK, Set, Reset)
     
	begin
		--if (Set = '0') then Q <= '1';		-- Asynchronous
   		--elsif (Reset = '0') then Q <= '0';
   		--elsif Rising_edge(CLK) then Q <= D;
   
		  if Rising_edge(CLK) then		-- Synchronous
	    	  	if (Set = '0') then Q <= '1';
	  		elsif (Reset = '0') then Q <= '0';
			else Q <= D;

    	 	end if;

    	end if;

 	end process;

end arch_d_flipflop;
