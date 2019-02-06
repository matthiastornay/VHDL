-- Demultiplexer 1 to 4
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;

-- Entity description
entity demux_4C1 is
     port(E, D : in std_logic;
	  Sel : in std_logic_vector (1 downto 0);
	  S0, S1, S2, S3 : out std_logic);

end demux_4C1;

-- Behavior
architecture arch_demux_4C1 of demux_4C1 is

begin
     with Sel select
          S0 <= ((D) or (E)) when "00",
                '1' when others;

     with Sel select
	  S1 <= ((D) or (E)) when "01",
                '1' when others;
	
     with Sel select
	  S2 <= ((D) or (E)) when "10",
                '1' when others;
     
     with Sel select
	  S3 <= ((D) or (E)) when "11",
                '1' when others;
	
end arch_demux_4C1;

signal white_now : std_logic_vector (2 downto 0);

white_now <= (Sel)&(E);
