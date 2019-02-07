-- LED animation
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity led is
	port(CLK : in std_logic;
	     Q : out std_logic_vector(2 downto 0));

end led;

-- Behavior
architecture arch_led of led is

Type State_led is (ZERO, ONE, TWO);
signal State : State_led;

begin
	process(CLK)
	
	begin
  		if rising_Edge(CLK) then
			case State is
				when ZERO => State <= TWO;
				when TWO => State <= ONE;
				when ONE => State <= ZERO;

			end case;

 		 end if;
	
	end process;

Q <= "001" when State = ZERO else
     "010" when State = ONE else
     "100" when State = TWO;

end arch_led;
