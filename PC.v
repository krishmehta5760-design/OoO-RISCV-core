module PC(clk,rst,next,pc);
input clk,rst;
input [31:0] next;
output reg [31:0] pc;

always@(posedge clk,negedge rst)begin

if(!rst) pc <= 32'd0;

else pc <= next;

end

endmodule
