-- Adder 8 bits
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity adder_8B is
     port(A, B : in std_logic_vector(7 downto 0);
	  Cin : in std_logic;
	  S : out std_logic_vector(9 downto 0));

end adder_8B;

-- Behavior
architecture arch_adder_8B of adder_8B is

signal Ac : std_logic_vector (9 downto 0);
signal Bc : std_logic_vector (9 downto 0);

begin
     Ac <= "00" & A;
     Bc <= "00" & B;
     
with Cin select  
     S <= Ac + Bc when '0',
	  Ac - Bc when '1';
     
end arch_adder_8B;
