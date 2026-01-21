module Instruction_Queue(clk,rst,ins0,ins1,ins2,ins3,valid,ins0_out,ins1_out,ins2_out,ins3_out,valid_out,push,pop,full,empty);
input clk,rst;
input [31:0] ins0,ins1,ins2,ins3;
input [3:0] valid;
input push,pop;
output reg [31:0] ins0_out,ins1_out,ins2_out,ins3_out;
output reg [3:0] valid_out;

output wire full,empty;

reg [31:0] mem0 [0:7];
reg [31:0] mem1 [0:7];
reg [31:0] mem2 [0:7];
reg [31:0] mem3 [0:7];
reg [3:0]  mem_valid [0:7];

reg [2:0] write_ptr,read_ptr;
reg [3:0] count;

assign full  = (count == 8);
assign empty = (count == 0);

always@(posedge clk,negedge rst)begin

if(!rst) write_ptr <= 3'b000;

else if(push && !full)begin

mem0[write_ptr] <= ins0;
mem1[write_ptr] <= ins1;
mem2[write_ptr] <= ins2;
mem3[write_ptr] <= ins3;
mem_valid[write_ptr] <= valid;

write_ptr <= write_ptr + 1;

end

end

always@(posedge clk,negedge rst)begin

if(!rst) begin

read_ptr <= 3'b000;
ins0_out <= 32'd0;
ins1_out <= 32'd0;
ins2_out <= 32'd0;
ins3_out <= 32'd0;
valid_out <= 4'd0;

end

else if(pop && !empty)begin

ins0_out <= mem0[read_ptr];
ins1_out <= mem1[read_ptr];
ins2_out <= mem2[read_ptr];
ins3_out <= mem3[read_ptr];
valid_out <= mem_valid[read_ptr];

read_ptr <= read_ptr + 1;

end

end

always@(posedge clk,negedge rst)begin

if(!rst) count <= 4'b0000;

else begin

case({push && !full, pop && !empty})

2'b00: count <= count;
2'b01: count <= count - 1;
2'b10: count <= count + 1;
2'b11: count <= count;
default: count <= count;

endcase

end

end

endmodule

