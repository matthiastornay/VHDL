-- Transcoder Binary to Gray 4 bits
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity transcoder_B_G is
	port(B0, B1, B2, B3 : in std_logic;
	     G0, G1, G2, G3 : out std_logic);

end transcoder_B_G;

-- Behavior
architecture arch_transcoder_B_G of transcoder_B_G is

begin
     G0 <= B1 xor B0;
     G1 <= B1 xor B2;
     G2 <= B2 xor B3;
     G3 <= B3;

end arch_transcoder_B_G;
