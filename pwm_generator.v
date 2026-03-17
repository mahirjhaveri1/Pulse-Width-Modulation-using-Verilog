module pwm_generator #(parameter WIDTH = 8)(
    input wire clk,
    input wire rst,
    input wire [WIDTH-1:0] duty_cycle,
    output reg pwm_out
);

reg [WIDTH-1:0] counter;

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 0;
    else
        counter <= counter + 1;
end

always @(posedge clk or posedge rst) begin
    if (rst)
        pwm_out <= 0;
    else if (counter < duty_cycle)
        pwm_out <= 1;
    else
        pwm_out <= 0;
end

endmodule