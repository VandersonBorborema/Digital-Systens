library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity ControlUnit is
    Port (
        Sin : in  STD_LOGIC_VECTOR(3 downto 0);
        Regdst : out STD_LOGIC;
        Regwrite : out STD_LOGIC;
		  Regload : out STD_LOGIC;
        en_ALU : out STD_LOGIC;
        opcode : out STD_LOGIC_VECTOR(2 downto 0)
    );
end ControlUnit;

architecture Behavioral of ControlUnit is
begin
    process(Sin)
    begin
        Regdst <= Sin(3);
        Regwrite <= Not(Sin(0) and (Not Sin(2)) and (Not Sin(2)) and (Not Sin(1)) and (Not Sin(0))) ;
		  Regload <= Sin(0) and (Not Sin(2)) and (Not Sin(2)) and (Not Sin(1)) and (Not Sin(0));
        en_ALU <= Not Sin(3);
        opcode <= Sin(2 downto 0);
    end process;
end Behavioral;