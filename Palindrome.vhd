-- Palindrome
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity palindrome is
	port(CLK, Off, Clear : in std_logic;
	     Letter : out std_logic_vector(1 downto 0));
	
end entity palindrome;

-- Behavior
architecture arch_palindrome of palindrome is

Type State is (R, o, t, r_bis, o_bis);
signal internal_State : State;
	
begin
	process(CLK, Off, Clear)
		
	begin	
		if(Off = '1') then internal_State <= R;

		elsif(rising_edge(CK) and (Clear = '0')) then
			case internal_State is
				when R => internal_State <= o;
				when o => internal_State <= t;
				when t => internal_State <= o_bis;
				when o_bis => internal_State <= r_bis;
				when r_bis => internal_State <= o;
					
			end case;

		end if;

	end process;
		
	Letter <= "00" when internal_State = R else
		  "00" when internal_State = r_bis else
	          "01" when internal_State = o else
		  "01" when internal_State = o_bis else
		  "10" when internal_State = t;
					 
end architecture arch_palindrome;
