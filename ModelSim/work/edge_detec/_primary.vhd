library verilog;
use verilog.vl_types.all;
entity edge_detec is
    port(
        clk_f_nios      : in     vl_logic;
        rst_f_nios      : in     vl_logic;
        dt_f_nios       : in     vl_logic_vector(7 downto 0);
        clk_out         : out    vl_logic;
        data_raw        : out    vl_logic_vector(15 downto 0)
    );
end edge_detec;
