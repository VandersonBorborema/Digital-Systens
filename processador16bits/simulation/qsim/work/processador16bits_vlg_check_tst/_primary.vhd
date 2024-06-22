library verilog;
use verilog.vl_types.all;
entity processador16bits_vlg_check_tst is
    port(
        data_out        : in     vl_logic_vector(15 downto 0);
        sampler_rx      : in     vl_logic
    );
end processador16bits_vlg_check_tst;
