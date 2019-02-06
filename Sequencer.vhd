-- Sequencer
-- Matthias Tornay

-- Libraries declaration
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

-- Entity description
entity Sequencer is
     port(CLK : in std_logic;
          Preset : in std_logic_vector (1 downto 0);
	  Q : out std_logic_vector(2 downto 0));

end Sequencer;

-- Behavior
architecture arch_Sequencer of Sequencer is

Type State_Sequencer is (ONE, TWO, THREE, FOUR, FIVE, SIX, SEVEN, ZERO);
signal State, State_Machine : State_Sequencer;

begin			
     process(CLK, Preset)
     
     begin
          if rising_Edge(CLK) then
	       case State is
	            when ZERO => State_Machine <= FOUR;
		    when FOUR => State_Machine <= TWO;
	    	    when TWO => State_Machine <= FIVE;
		    when FIVE => State_Machine <= SIX;
		    when SIX => State_Machine <= ZERO;
		    when ONE => State_Machine <= ZERO;
		    when THREE => State_Machine <= ZERO;
		    when SEVEN => State_Machine <= ZERO;
	
               end case;
  
          end if;
	
     end process;
	 
     with Preset select
          State <= ONE when "01",
		   THREE when "10",
	           SEVEN when "11",
		   State_Machine when "00";
			
Q <= "000" when State = ZERO else
     "001" when State = ONE else
     "010" when State = TWO else
     "011" when State = THREE else
     "100" when State = FOUR else
     "101" when State = FIVE else
     "110" when State = SIX else
     "111" when State = SEVEN;

end arch_Sequencer;
