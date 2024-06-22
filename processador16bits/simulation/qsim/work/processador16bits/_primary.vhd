library verilog;
use verilog.vl_types.all;
entity processador16bits is
    port(
        clk             : in     vl_logic;
        clear           : in     vl_logic;
        en_input        : in     vl_logic;
        data_out        : out    vl_logic_vector(15 downto 0)
    );
end processador16bits;
