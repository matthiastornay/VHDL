-- Counter Up/Down 2 bits
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity counter_2B is
	port(CLK, Init, Sensor : in std_logic;
	     Q : out std_logic_vector(1 downto 0));

end counter_2B;

-- Behavior
architecture arch_counter_2B of counter_2B is

signal QQ : std_logic_vector (1 downto 0);

begin
	process(CLK)

	begin
		if Init = '1' then
			if Sens = '0' then QQ <= "11";
			else QQ <= "00";
			
			end if;
		
		elsif (Rising_edge(CLK)) then
	
			case sens is
				when '0' => QQ <= QQ-1;
				when '1' => QQ <= QQ+1;
		
			end case;		

		end if;	
	
	end process;

Q <= QQ;

end arch_counter_2B;
