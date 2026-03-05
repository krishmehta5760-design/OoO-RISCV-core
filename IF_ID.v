module IF_ID(clk,rst,ins0_out_F,ins1_out_F,ins2_out_F,ins3_out_F,valid_out_F,ins0_out_D,ins1_out_D,ins2_out_D,ins3_out_D,valid_out_D);

input clk,rst;

input [31:0] ins0_out_F,ins1_out_F,ins2_out_F,ins3_out_F;
input [3:0] valid_out_F;

output reg [31:0] ins0_out_D,ins1_out_D,ins2_out_D,ins3_out_D;
output reg [3:0] valid_out_D;

always@(posedge clk,negedge rst)begin

if(!rst) {ins0_out_D,ins1_out_D,ins2_out_D,ins3_out_D,valid_out_D} <= 132'd0;

else begin

ins0_out_D <= ins0_out_F;
ins1_out_D <= ins1_out_F;
ins2_out_D <= ins2_out_F;
ins3_out_D <= ins3_out_F;
valid_out_D <= valid_out_F;

end

end

endmodule
