library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity Decoder is
    Port (
        input_vector : in  STD_LOGIC_VECTOR(15 downto 0);
        opcode       : out STD_LOGIC_VECTOR(3 downto 0);
        ra           : out STD_LOGIC_VECTOR(3 downto 0);
        rb           : out STD_LOGIC_VECTOR(3 downto 0);
        rc           : out STD_LOGIC_VECTOR(3 downto 0);
        output_vector: out STD_LOGIC_VECTOR(15 downto 0)
    );
end Decoder;

architecture Behavioral of Decoder is
begin
    process(input_vector)
    begin
        opcode <= input_vector(15 downto 12);
        ra     <= input_vector(11 downto 8);
        rb     <= input_vector(7 downto 4);
        rc     <= input_vector(3 downto 0);  
        output_vector <= "00000000" & input_vector(7 downto 0);
    end process;
end Behavioral;