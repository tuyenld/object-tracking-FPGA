library verilog;
use verilog.vl_types.all;
entity test_clk is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        count_rows      : out    vl_logic_vector(9 downto 0);
        count_cols      : out    vl_logic_vector(9 downto 0);
        control_out     : out    vl_logic;
        data_or_none    : out    vl_logic;
        data_in         : in     vl_logic_vector(7 downto 0);
        data_out        : out    vl_logic_vector(8 downto 0);
        data_out_8      : out    vl_logic_vector(7 downto 0);
        choose          : out    vl_logic
    );
end test_clk;
