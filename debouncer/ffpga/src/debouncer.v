module debouncer #(
    parameter DEBOUNCE_CNT_LIMIT = 500_000
)(
    input   		clk,
    input   		i_pulse,
    output  		o_pulse
);

localparam CNT_WIDTH = $clog2(DEBOUNCE_CNT_LIMIT + 1);

reg [CNT_WIDTH-1:0]  r_clk_cnt = 0;
reg                  r_pulse   = 1'b0;

assign o_pulse     = r_pulse;

always @(posedge clk) begin
    if ((i_pulse != r_pulse) && (r_clk_cnt < DEBOUNCE_CNT_LIMIT)) begin
        r_clk_cnt <= r_clk_cnt + 1;
    end
    else if (r_clk_cnt == DEBOUNCE_CNT_LIMIT) begin
        r_pulse   <= i_pulse;
        r_clk_cnt <= 0;
    end
    else begin
        r_clk_cnt <= 0;
    end
end
endmodule