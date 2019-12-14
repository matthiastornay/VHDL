-- Motor 1 - Clockwise rotation
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity Clockwise_sens is
     port(CLK, sens, blockage, stop, half_step : in std_logic;
	  PH : out std_logic_vector(3 downto 0));

end Clockwise_sens;

-- Behavior
architecture arch_Clockwise_sens of Clockwise_sens is

Type State_Clockwise_sens is (E0, E1, E2, E3, E4, E5, E6, E7, E8);
signal State: State_Clockwise_sens;

begin
			
process(CLK)

begin  	
     if rising_Edge() then
          if (blockage = '1') then 
	       State <= State;
    
     else
          if half_step = '0' then
	       if stop = '1' then
	            case State is
 		         when E0 => State <= E0;
			 when E1 => State <= E0;
			 when E2 => State <= E0;
			 when E3 => State <= E0;
			 when E4 => State <= E0;
			 when E5 => State <= E0;
			 when E6 => State <= E0;
			 when E7 => State <= E0;
			 when E8 => State <= E0;

		    end case;
	else
		if sens = '1' then 	
			case State is
				when E0 => State <= E2;
				when E2 => State <= E4;
				when E4 => State <= E6;
				when E6 => State <= E8;
				when E8 => State <= E2;
				when E1 => State <= E2;
				when E3 => State <= E2;
				when E5 => State <= E2;
				when E7 => State <= E2;
			end case;
		else	
			case State is
				when E0 => State <= E2;
				when E2 => State <= E8;
				when E8 => State <= E6;
				when E6 => State <= E4;
				when E4 => State <= E2;
				when E1 => State <= E2;
				when E3 => State <= E2;
				when E5 => State <= E2;
				when E7 => State <= E2;
			end case;
		end if;
	end if;
 else
	if Stop = '1' then
		case State is
				when E0 => State <= E0;
				when E1 => State <= E0;
				when E2 => State <= E0;
				when E3 => State <= E0;
				when E4 => State <= E0;
				when E5 => State <= E0;
				when E6 => State <= E0;
				when E7 => State <= E0;
				when E8 => State <= E0;
		end case;
	else
		if sans = '1' then 	
			case State is
				when E0 => State <= E1;
				when E1 => State <= E2;
				when E2 => State <= E3;
				when E3 => State <= E4;
				when E4 => State <= E5;
				when E5 => State <= E6;
				when E6 => State <= E7;
				when E7 => State <= E8;
				when E8 => State <= E1;
			end case;
		else	
			case State is
				when E8 => State <= E7;
				when E7 => State <= E6;
				when E6 => State <= E5;
				when E5 => State <= E4;
				when E4 => State <= E3;
				when E3 => State <= E2;
				when E2 => State <= E1;
				when E1 => State <= E8;
				when E0 => State <= E1;
			end case;
		end if;
	end if;
  end if;
 end if;
end if;	
end process;

Ph <= "0000" when State = E0 else
	  "1000" when State = E1 else
	  "1010" when State = E2 else
	  "0010" when State = E3 else
	  "0110" when State = E4 else
	  "0100" when State = E5 else
	  "0101" when State = E6 else
	  "0001" when State = E7 else
	  "1001" when State = E8;
end arch_Clockwise_sens;
