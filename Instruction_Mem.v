module Instruction_Mem(rst,pc,ins0,ins1,ins2,ins3);
input rst;
input [31:0] pc;
output reg [31:0] ins0;
output reg [31:0] ins1;
output reg [31:0] ins2;
output reg [31:0] ins3;
reg [31:0] inst_mem [0:31];

initial begin

    inst_mem[0]  = 32'd0;
    inst_mem[1]  = 32'd0;
    inst_mem[2]  = 32'd0;
    inst_mem[3]  = 32'd0;
    inst_mem[4]  = 32'h002081b3; // add x3, x1, x2 (R-type)
    inst_mem[5]  = 32'h00310233; // add x4, x2, x3 (R-type)
    inst_mem[6]  = 32'h403183b3; // sub x7, x3, x1 (R-type)
    inst_mem[7]  = 32'h00508113; // addi x2, x1, 5 (I-type)
    inst_mem[8]  = 32'hfff10193; // addi x3, x2, -1 (I-type)
    inst_mem[9]  = 32'h00208663; // beq x1, x2, +4 (B-type)
    inst_mem[10]  = 32'h00310463; // beq x3, x1, +8 (B-type)
    inst_mem[11]  = 32'h020000ef; // jal x1, +32 (J-type)
    inst_mem[12]  = 32'h0400016f; // jal x2, +64 (J-type)
    inst_mem[13]  = 32'h00418333; // add x6, x3, x4 (R-type)
    inst_mem[14] = 32'h4052c3b3; // sub x7, x5, x2 (R-type)
    inst_mem[15] = 32'h00208093; // addi x1, x1, 2 (I-type)
    inst_mem[16] = 32'h00310113; // addi x2, x2, 3 (I-type)
    inst_mem[17] = 32'h00110663; // beq x1, x1, +12 (B-type)
    inst_mem[18] = 32'h00218663; // beq x2, x3, +16 (B-type)
    inst_mem[19] = 32'h004003ef; // jal x7, +256 (J-type)
    // Repeat pattern to fill 32 entries
    inst_mem[20] = inst_mem[0];
    inst_mem[21] = inst_mem[3];
    inst_mem[22] = inst_mem[5];
    inst_mem[23] = inst_mem[7];
    inst_mem[24] = inst_mem[1];
    inst_mem[25] = inst_mem[4];
    inst_mem[26] = inst_mem[6];
    inst_mem[27] = inst_mem[8];
    inst_mem[28] = inst_mem[2];
    inst_mem[29] = inst_mem[11];
    inst_mem[30] = inst_mem[13];
    inst_mem[31] = inst_mem[15];

end

always@(*)begin

if(!rst) {ins0,ins1,ins2,ins3} = 128'd0;

else begin

ins0 = inst_mem[(pc>>2)&5'b11111]; 
ins1 = inst_mem[((pc>>2)&5'b11111)+5'd1]; 
ins2 = inst_mem[((pc>>2)&5'b11111)+5'd2]; 
ins3 = inst_mem[((pc>>2)&5'b11111)+5'd3]; 

end

end

endmodule