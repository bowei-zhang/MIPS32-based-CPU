`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/04 09:40:46
// Design Name: 
// Module Name: cpu
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module minisys(
    reset, 
    clock,
    pc,
    alu_result_out,
    read_data_1_out,
    read_data_2_out,
    write_data_out,
    instruction_out,
    branch_out,
    zero_out,
    memwrite_out,
    regwrite_out,
    i_format_out,
        //executeµ•∂¿≤‚ ‘ÃÌº”
            Ainput,Binput,
            Cinput,Dinput,
            Einput,Finput,
           Ginput,Hinput,
            Sinput,
            ALU_output_mux,
            Branch_Add,
           ALU_ctl,
       //executeµ•∂¿≤‚ ‘ÃÌº”
    //control≤‚ ‘ÃÌº”
//        alusrc,branch,nbranch,jmp,jal,jrn,i_format,memwrite,regwrite,memtoreg,regdst,
sftmd,
//zero,aluop,
//        sign_extend
    //control≤‚ ‘ÃÌº”   
    read_data,
    register1_out
    );
    input reset,clock;
    output[31:0] alu_result_out;
    output[31:0] read_data_1_out,read_data_2_out;
    output[31:0] instruction_out;
    output[31:0] write_data_out;
    output[31:0] pc;
    output branch_out,zero_out;
    output memwrite_out,regwrite_out;
    output i_format_out;
    output[31:0] read_data;
    //control≤‚ ‘ÃÌº”  
//    output alusrc,branch,nbranch,jmp,jal,jrn,i_format,memwrite,regwrite,memtoreg,regdst,
output sftmd;
//zero;
//    output[31:0] sign_extend;
//        output[1:0] aluop;
    //control≤‚ ‘ÃÌº”  
    
        //executeµ•∂¿≤‚ ‘ÃÌº”
            output[31:0] Ainput,Binput;
            output[31:0] Cinput,Dinput;
            output[31:0] Einput,Finput;
            output[31:0] Ginput,Hinput;
            output[31:0] Sinput;
            output[31:0] ALU_output_mux;
            output[31:0] Branch_Add;
            output[2:0] ALU_ctl;
        //executeµ•∂¿≤‚ ‘ÃÌº”
        
        output[31:0] register1_out;
        
    wire[31:0] pc_plus_4;
    wire[31:0] read_data_1;
    wire[31:0] read_data_2;
    wire[31:0] sign_extend;
    wire[31:0] add_result;
    wire[31:0] alu_result;
    wire[31:0] read_data;
    wire alusrc,branch,nbranch,jmp,jal,jrn,i_format,memwrite,regwrite,memtoreg,regdst,sftmd,zero;
    wire[1:0] aluop;
    wire[31:0] instruction;
    wire[31:0] opcplus4;
    wire clk;
    
    assign clk = !clock;
    assign instruction_out = instruction;
    assign alu_result_out = alu_result;
    assign read_data_1_out = read_data_1;
    assign read_data_2_out = read_data_2;
    assign write_data_out = (memtoreg==1)?read_data:alu_result;
    assign branch_out = branch;
    assign zero_out = zero;
    assign regwrite_out = regwrite;
    assign memwrite_out = memwrite;
    assign i_format_out = i_format;
    
    Ifetc32 ifetch(
        .Instruction(instruction),
        .PC_plus_4_out(pc_plus_4),
        .Add_result(add_result),
        .Branch(branch),
        .nBranch(nbranch),
        .Jmp(jmp),
        .Jal(jal),
        .Jrn(jrn),
        .Read_data_1(read_data_1),
        .Zero(zero),
        .PC_out(pc),
        .clock(clock),
        .reset(reset),
        .opcplus4(opcplus4)
    );
    
    Idecode32 idecode(
        .read_data_1(read_data_1),
        .read_data_2(read_data_2),
        .Instruction(instruction),
        .read_data(read_data),
        .ALU_result(alu_result),
        .MemtoReg(memtoreg),
        .RegWrite(regwrite),
        .RegDst(regdst),
        .Sign_extend(sign_extend),
        .Jal(jal),
        //.PC_next(pc_next),
        .clock(clock),
        .reset(reset),
        .opcplus4(opcplus4),
        .register1_out(register1_out)
    );
    
    control32 control(
    .Opcode(instruction[31:26]),
    .Function_opcode(instruction[5:0]),
    .RegDST(regdst),
    .ALUSrc(alusrc),
    .MemtoReg(memtoreg),
    .RegWrite(regwrite),
    .MemWrite(memwrite),
    .ALUOp(aluop),
    .I_format(i_format),
    .Branch(branch),
    .nBranch(nbranch),
    .Sftmd(sftmd),
    .Jal(jal),
    .Jrn(jrn),
    .Jmp(jmp)
    );
    
    Execute32 execute(
        .Read_data_1(read_data_1),
        .Read_data_2(read_data_2),
        .Sign_extend(sign_extend),
        .Function_opcode(instruction[5:0]),
        .Shamt(instruction[10:6]),
        .Exe_opcode(instruction[31:26]),
        .Sftmd(sftmd),
        .ALUOp(aluop),
        .ALUSrc(alusrc),
        .ALU_Result(alu_result),
        .Add_Result(add_result),
        .I_format(i_format),
        .Zero(zero),
        .PC_plus_4(pc_plus_4),
        //≤‚ ‘ÃÌº”
                .Ainput(Ainput),.Binput(Binput),
                .Cinput(Cinput),.Dinput(Dinput),
                .Einput(Einput),.Finput(Finput),
                .Ginput(Ginput),.Hinput(Hinput),
                .Sinput(Sinput),
                .ALU_output_mux(ALU_output_mux),
                .Branch_Add(Branch_Add),
                .ALU_ctl(ALU_ctl),
                .clock(clock)
                //≤‚ ‘ÃÌº”
        );
        
        ram ram(
            .clka(clk),
            .wea(memwrite),
            .addra(alu_result[14:0]),
            .dina(read_data_2),
            .douta(read_data)
        );
endmodule
