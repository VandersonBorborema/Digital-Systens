library verilog;
use verilog.vl_types.all;
entity somador_4bits is
    port(
        Cout            : out    vl_logic;
        X               : in     vl_logic_vector(3 downto 0);
        Y               : in     vl_logic_vector(3 downto 0);
        Cin             : in     vl_logic;
        S               : out    vl_logic_vector(3 downto 0)
    );
end somador_4bits;
