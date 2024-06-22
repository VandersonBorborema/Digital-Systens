library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;
entity ProgramCounter is
    Port (
        clk       : in  STD_LOGIC;
        reset     : in  STD_LOGIC;

        pc_out    : out STD_LOGIC_VECTOR(3 downto 0)
    );
end ProgramCounter;

architecture Behavioral of ProgramCounter is
    signal pc : STD_LOGIC_VECTOR(3 downto 0) := (others => '0');
begin
    process(clk, reset)
    begin
        if reset = '1' then
            pc <= (others => '0');
        elsif rising_edge(clk) then
           
                pc <= std_logic_vector(IEEE.NUMERIC_STD.unsigned(pc) + 1);
            
        end if;
    end process;
    pc_out <= pc;
end Behavioral;
