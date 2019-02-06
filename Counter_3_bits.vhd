-- Counter 3 bits
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity counter_3B is
	port(CLK, Reset : in std_logic;
	     Q : out std_logic_vector(2 downto 0));

end counter_3B;

-- Behavior
architecture arch_counter_3B of counter_3B is

signal QQ : std_logic_vector (2 downto 0);

begin
	process(CLK, Reset)
	
	begin
		if (Reset = '0') then QQ <= "000";		-- Asynchronous
		elsif (Rising_edge(CLK)) then QQ <= QQ + 1;	-- Synchronous
		end if;

	end process;

Q <= QQ;

end arch_counter_3B;
