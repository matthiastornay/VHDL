-- Arithmetic Logic Unit
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity ALU_VHDL is
	port(A, B : in  std_logic_vector (3 downto 0);
		 OPF : in  std_logic_vector (2 downto 0);
		 Cin : in  std_logic;
		 Cout : out std_logic;
		 S : out std_logic_vector (3 downto 0));

end ALU_VHDL;

-- Behavior
architecture arch_ALU_VHDL of ALU_VHDL is

signal white_now : std_logic_vector(4 downto 0);

begin
 
	result <= ('0' & A) + ('0' & B) + ("0000" & Cin) when (OPF = "000") else
	          ('0' & A) - ('0' & B) - ("0000" & Cin) when (OPF = "001") else
	          "00000" when (OPF = "010") else
	          ('0' & A) + ("0000" & Cin) when (OPF = "011") else
	          '0' & not(A) when (OPF =  "100") else
	          ('0' & A) or ('0' & B) when (OPF = "101") else
	          ('0' & A) and ('0' & B) when (OPF =  "110") else
	          ('0' & A) xor ('0' & B) when (OPF =  "111"); 
		 
	S <= result (3 downto 0);
	Cout <= result (4) when OPF (2) = '0' else '0';

end arch_ALU_VHDL;
