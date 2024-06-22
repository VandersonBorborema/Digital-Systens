library verilog;
use verilog.vl_types.all;
entity processador16bits_vlg_sample_tst is
    port(
        clear           : in     vl_logic;
        clk             : in     vl_logic;
        en_input        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end processador16bits_vlg_sample_tst;
