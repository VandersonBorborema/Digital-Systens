library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Mux2to14 is
    Port (
        sel : in  STD_LOGIC;
        a : in  STD_LOGIC_VECTOR(3 downto 0);
        b : in  STD_LOGIC_VECTOR(3 downto 0);
        y : out STD_LOGIC_VECTOR(3 downto 0)
    );
end Mux2to14;

architecture Behavioral of Mux2to14 is
begin
    process(sel, a, b)
    begin
        if sel = '1' then
            y <= a;
        else
            y <= b;
        end if;
    end process;
end Behavioral;