library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

entity ALU is
    Port (
        A : in  STD_LOGIC_VECTOR(15 downto 0);
        B : in  STD_LOGIC_VECTOR(15 downto 0);
        Op : in  STD_LOGIC_VECTOR(2 downto 0);
        Result : out STD_LOGIC_VECTOR(15 downto 0)
    );
end ALU;

architecture Behavioral of ALU is
begin
    process(A, B, Op)
    begin
        case Op is
            when "000" => 
                Result <= A + B;
            when "001" => 
                Result <= A - B;
            when "010" => 
                Result <= A and B;
            when "011" => 
                Result <= A or B;
            when "100" => 
                Result <= not A; 
				when "101" =>
                Result <= A xor B;
            when "110" => 
                Result <= std_logic_vector(IEEE.NUMERIC_STD.unsigned(A) srl 1);
					 
					 
            when "111" => 
                Result <= std_logic_vector(IEEE.NUMERIC_STD.unsigned(A) sll 1); 
            when others => 
                Result <= (others => '0'); 
        end case;
    end process;
end Behavioral;