module TOP_tb;
reg clk,rst;
wire [31:0] next,pc,ins0,ins1,ins2,ins3,in0,in1,in2,in3,in0_out,in1_out,in2_out,in3_out;
wire [3:0] valid,valid_out;

TOP uut(clk,rst,next,pc,ins0,ins1,ins2,ins3,in0,in1,in2,in3,valid,in0_out,in1_out,in2_out,in3_out,valid_out);

initial begin

clk = 1;
forever #5 clk = ~clk; 

end

initial begin

rst = 0; #20
rst = 1; #500
$finish;

end

endmodule
