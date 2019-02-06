-- Additionneur 8 bits
-- Matthias Tornay

-- Déclaration des librairies
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Description de l'entité
entity Additionneur_8B is
     port(A, B : in std_logic_vector(7 downto 0);
	  Cin : in std_logic;
	  S : out std_logic_vector(9 downto 0));

end Additionneur_8B;

-- Déclaration du comportement
architecture arch_Additionneur_8B of Additionneur_8B is

signal Ac : std_logic_vector (9 downto 0);
signal Bc : std_logic_vector (9 downto 0);

begin
     Ac <= "00" & A;
     Bc <= "00" & B;
     
with Cin select  
     S <= Ac + Bc when '0',
	  Ac - Bc when '1';
     
end arch_Additionneur_8B;
