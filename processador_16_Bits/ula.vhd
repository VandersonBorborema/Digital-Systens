library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use ieee.numeric_std.all;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity ULA is
    Port (
        clk      : in  STD_LOGIC;
        A        : in  STD_LOGIC_VECTOR (15 downto 0);
        B        : in  STD_LOGIC_VECTOR (15 downto 0);
        Op       : in  STD_LOGIC_VECTOR (3 downto 0); 
        Result   : buffer STD_LOGIC_VECTOR (15 downto 0);
        Carry    : out STD_LOGIC;
        Overflow : out STD_LOGIC; 
        Mem_data : in  STD_LOGIC_VECTOR (15 downto 0); 
        Mem_addr : out STD_LOGIC_VECTOR (15 downto 0);
        Mem_write: out STD_LOGIC; 
        Mem_read : out STD_LOGIC 
    );
end ULA;

architecture Behavioral of ULA is
begin
    process(clk, A, B, Op, Mem_data)
        variable temp_result : STD_LOGIC_VECTOR(16 downto 0); 
    begin
        if rising_edge(clk) then
            case Op is
                when "0000" => 
                    Result <= Mem_data;
                    Mem_addr <= A; 
                    Mem_read <= '1';
                    Mem_write <= '0';
                    Carry <= '0';
                    Overflow <= '0';

                when "0001" => 
                    Result <= B; 
                    Mem_addr <= A; 
                    Mem_read <= '0';
                    Mem_write <= '1';
                    Carry <= '0';
                    Overflow <= '0';

                when "0010" => 
                    temp_result := ('0' & A) + ('0' & B);
                    Result <= temp_result(15 downto 0);
                    Carry <= temp_result(16);
                    
						  Overflow <= (A(15) and B(15) and not Result(15)) or (not A(15) and not B(15) and Result(15));

                when "0011" => 
                    temp_result := ('0' & A) - ('0' & B);
                    Result <= temp_result(15 downto 0);
                    Carry <= temp_result(16);
                    
						  Overflow <= (A(15) and not B(15) and not Result(15)) or (not A(15) and B(15) and Result(15));


                when "0100" => 
                    Result <= A and B;
                    Carry <= '0';
                    Overflow <= '0';

                when "0101" => 
                    Result <= A or B;
                    Carry <= '0';
                    Overflow <= '0';

                when "0110" => 
                    Result <= A xor B;
                    Carry <= '0';
                    Overflow <= '0';

                when "0111" => 
                    Result <= not A;
                    Carry <= '0';
                    Overflow <= '0';

               -- when "1000" => 
                 --   Result <= shift_left(A, 1);
                   -- Carry <= A(15); 
                   -- Overflow <= '0';

               -- when "1001" => -- Right Shift
                  --  Result <= shift_right(A, 1);
                   -- Carry <= A(0); 
                   -- Overflow <= '0';

                when others =>
                    Result <= (others => '0');
                    Carry <= '0';
                    Overflow <= '0';
            end case;
        end if;
    end process;
end Behavioral;
