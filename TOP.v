module TOP(clk,rst,next,pc,ins0,ins1,ins2,ins3,in0,in1,in2,in3,valid,in0_out,in1_out,in2_out,in3_out,valid_out);
input clk,rst;
output [31:0] next,pc,ins0,ins1,ins2,ins3,in0,in1,in2,in3,in0_out,in1_out,in2_out,in3_out;
output [3:0] valid,valid_out;
wire push,pop;
wire full,empty;

PC a(.clk(clk),
     .rst(rst),
     .next(next),
     .pc(pc));
     
Instruction_Mem b(.rst(rst),
                  .pc(pc),
                  .ins0(ins0),
                  .ins1(ins1),
                  .ins2(ins2),
                  .ins3(ins3));
                  
Predecode_BPL c(.pc(pc),
                .ins0(ins0),
                .ins1(ins1),
                .ins2(ins2),
                .ins3(ins3),
                .IN0(in0),
                .IN1(in1),
                .IN2(in2),
                .IN3(in3),
                .pc_out(next),
                .valid(valid));
                
assign push = ((|valid)&&(!full));
assign pop = !empty;
                
Instruction_Queue d(.clk(clk),
                    .rst(rst),
                    .ins0(in0),
                    .ins1(in1),
                    .ins2(in2),
                    .ins3(in3),
                    .valid(valid),
                    .ins0_out(in0_out),
                    .ins1_out(in1_out),
                    .ins2_out(in2_out),
                    .ins3_out(in3_out),
                    .valid_out(valid_out),
                    .push(push),
                    .pop(pop),
                    .full(full),
                    .empty(empty));

endmodule
