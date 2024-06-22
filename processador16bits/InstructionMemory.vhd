library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity InstructionMemory is
    Port (
        clk       : in  STD_LOGIC;
        address   : in  STD_LOGIC_VECTOR(3 downto 0);
        instruction : out  STD_LOGIC_VECTOR(15 downto 0)
    );
end InstructionMemory;

architecture Behavioral of InstructionMemory is
    type memory_array is array (0 to 15) of STD_LOGIC_VECTOR(15 downto 0);

	 constant instructions : memory_array := (
        0  => "1001000000000001",
		  1  => "1001000100000010",
		  2  => "0000000000010010",
        3  => "1000001000000000",
		  4  => "0001000100000011",
		  5  => "0011001000010010",
		  6  => "0100001000010010",
		  7  => "0101001000000010",
		  8  => "0110001000000010",
		  9  => "0111001000000010",
		  10  => "0000001000000010",
        others => (others => '0')
    );

begin
    process(clk)
    begin
        if rising_edge(clk) then
            instruction <= instructions(to_integer(IEEE.NUMERIC_STD.unsigned(address)));
        end if;
    end process;
end Behavioral;