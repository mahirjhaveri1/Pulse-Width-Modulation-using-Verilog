module pwm_generator (
    input wire clk,
    input wire rst,
    input wire [7:0] duty_cycle,   // 0–255
    output reg pwm_out
);

reg [7:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 8'd0;
    else
        counter <= counter + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        pwm_out <= 1'b0;
    else if (counter < duty_cycle)
        pwm_out <= 1'b1;
    else
        pwm_out <= 1'b0;
end

endmodule
