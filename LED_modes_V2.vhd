-- LED animations selector
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity led_modes is
	port(CLK, INIT : in std_logic;
	     Mode : in std_logic_vector(1 downto 0);
	     Q : out std_logic_vector(2 downto 0));

end led_modes;

-- Behavior
architecture arch_led_modes of led_modes is

Type State_led_modes is (ONE, TWO, THREE, FOUR, FIVE, ONE);
signal State : State_led_modes;

begin
	process(CLK, INIT)
	
	begin
		if INIT = '0' then State <= FIVE;

 		elsif rising_Edge(CLK) then
			if(Mode = "00") then
				case State is
					when FIVE => State <= ZERO;
					when THREE => State <= ZERO;
					when FOUR => State <= ZERO;
					when ZERO => State <= ONE;
					when ONE => State <= TWO;
					when TWO => State <= ZERO;

				end case;

 			 end if;

  			if(Mode = "01") then
				case State is
					when FIVE => State <= ZERO;
					when FOUR => State <= ZERO;
					when ZERO => State <= ONE;
					when ONE => State <= TWO;
					when TWO => State <= THREE;
					when THREE => State <= ZERO;

				end case;

  			end if;

  			if(Mode = "10") then
				case State is
					when FIVE => State <= ONE;
					when ZERO => State <= ONE;
					when TWO => State <= ONE;
					when THREE => State <= ONE;
					when ONE => State <= FOUR;
					when FOUR => State <= ONE;

				end case;

 			 end if;

  			if(Mode = "11")then 
				State <= State;
  			
			end if;
 		
		end if;

	end process;

Q <= "100" when State = ZERO else
     "010" when State = ONE else
     "001" when State = TWO else
     "010" when State = THREE else
     "101" when State = FOUR else
     "000" when State = FIVE;

end arch_led_modes;
