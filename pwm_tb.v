`timescale 1ns/1ps

module pwm_tb;

reg clk;
reg rst;
reg [7:0] duty_cycle;
wire pwm_out;

pwm_generator uut (
    .clk(clk),
    .rst(rst),
    .duty_cycle(duty_cycle),
    .pwm_out(pwm_out)
);

always #5 clk = ~clk;

initial begin
    clk = 0;
    rst = 1;
    duty_cycle = 0;

    #20 rst = 0;

    #50 duty_cycle = 64;
    #100 duty_cycle = 128;
    #100 duty_cycle = 192;
    #100 duty_cycle = 255;

    #100 $stop;
end

endmodule