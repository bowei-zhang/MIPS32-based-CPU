`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/02 14:03:06
// Design Name: 
// Module Name: control32
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


module control32(
    Opcode,
    Function_opcode,
    Jrn,
    RegDST,
    ALUSrc,
    MemtoReg,
    RegWrite,
    MemWrite,
    Branch,
    nBranch,
    Jmp,
    Jal,
    I_format,
    Sftmd,
    ALUOp
   // clock
    );
    input[5:0] Opcode;
    input[5:0] Function_opcode;
   // input clock;
    output Jrn;
    output RegDST;
    output MemtoReg;
    output ALUSrc;
    output RegWrite;
    output MemWrite;
    output Branch;
    output nBranch;
    output Jmp;
    output Jal;
    output I_format;
    output Sftmd;
    output[1:0] ALUOp;
    
        reg Jrn;
        reg RegDST;
        reg MemtoReg;
        reg ALUSrc;
        reg RegWrite;
        reg MemWrite;
        reg Branch;
        reg nBranch;
        reg Jmp;
        reg Jal;
        reg I_format;
        reg Sftmd;
        reg[1:0] ALUOp;
    
    wire R_format;
    wire Lw;
    wire Sw;
    
    always @(Opcode or Function_opcode)
    begin
    if(Opcode==6'b000000)
        begin
        if( Function_opcode==6'b001000)  //jr
            begin
            Jrn = 1;
            RegDST = 1;
            ALUSrc = 0;
            MemtoReg = 0;
            RegWrite = 0;
            MemWrite = 0;
            Branch = 0;
            nBranch = 0;
            Jmp = 0;
            Jal = 0;
            I_format = 0;
            Sftmd = 0;
            ALUOp[1:0] = 2'b00;
            end
         else   //R-
                    begin
                    Jrn = 0;
                    RegDST = 1;
                    ALUSrc = 0;
                    MemtoReg = 0;
                    RegWrite = 1;
                    MemWrite = 0;
                    Branch = 0;
                    nBranch = 0;
                    Jmp = 0;
                    Jal = 0;
                    I_format = 0;
                    if(Function_opcode[5]==0)
                    Sftmd = 1;
                    else Sftmd = 0;                    
                    ALUOp[1:0] = 2'b10;
                    end     
        end
        if(Opcode[5:3]==3'b001) //I
                    begin
                    Jrn = 0;
                    RegDST = 0;
                    ALUSrc = 1;
                    MemtoReg = 0;
                    RegWrite = 1;
                    MemWrite = 0;
                    Branch = 0;
                    nBranch = 0;
                    Jmp = 0;
                    Jal = 0;
                    I_format = 1;
                    Sftmd = 0;
                    ALUOp[1:0] = 2'b10;
                    end
         if(Opcode==6'b100011) //lw
                                        begin
                                        Jrn = 0;
                                        RegDST = 0;
                                        ALUSrc = 1;
                                        MemtoReg = 1;
                                        RegWrite = 1;
                                        MemWrite = 0;
                                        Branch = 0;
                                        nBranch = 0;
                                        Jmp = 0;
                                        Jal = 0;
                                        I_format = 0;
                                        Sftmd = 0;
                                        ALUOp[1:0] = 2'b00;
                                        end
        if(Opcode==6'b101011) //sw
                                                                                begin
                                                                                Jrn = 0;
                                                                                RegDST = 0;
                                                                                ALUSrc = 1;
                                                                                MemtoReg = 0;
                                                                                RegWrite = 0;
                                                                                MemWrite = 1;
                                                                                Branch = 0;
                                                                                nBranch = 0;
                                                                                Jmp = 0;
                                                                                Jal = 0;
                                                                                I_format = 0;
                                                                                Sftmd = 0;
                                                                                ALUOp[1:0] = 2'b00;
                                                                                end  
         if(Opcode==6'b000100) //beq
                            begin
                            Jrn = 0;
                            RegDST = 0;
                            ALUSrc = 0;
                            MemtoReg = 0;
                            RegWrite = 0;
                            MemWrite = 0;
                            Branch = 1;
                            nBranch = 0;
                            Jmp = 0;
                            Jal = 0;
                            I_format = 0;
                            Sftmd = 0;
                            ALUOp[1:0] = 2'b01;
                            end  
        if(Opcode==6'b000101) //bne
                                                       begin
                                                       Jrn = 0;
                                                       RegDST = 0;
                                                       ALUSrc = 0;
                                                       MemtoReg = 0;
                                                       RegWrite = 0;
                                                       MemWrite = 0;
                                                       Branch = 0;
                                                       nBranch = 1;
                                                       Jmp = 0;
                                                       Jal = 0;
                                                       I_format = 0;
                                                       Sftmd = 0;
                                                       ALUOp[1:0] = 2'b01;
                                                       end   
        if(Opcode==6'b000010) //j
                                                                                   begin
                                                                                   Jrn = 0;
                                                                                   RegDST = 0;
                                                                                   ALUSrc = 0;
                                                                                   MemtoReg = 0;
                                                                                   RegWrite = 0;
                                                                                   MemWrite = 0;
                                                                                   Branch = 0;
                                                                                   nBranch = 0;
                                                                                   Jmp = 1;
                                                                                   Jal = 0;
                                                                                   I_format = 0;
                                                                                   Sftmd = 0;
                                                                                   ALUOp[1:0] = 2'b00;
                                                                                   end       
    if(Opcode==6'b000011) //jal
                            begin
                            Jrn = 0;
                            RegDST = 0;
                            ALUSrc = 0;
                            MemtoReg = 0;
                            RegWrite = 1;
                            MemWrite = 0;
                            Branch = 0;
                            nBranch = 0;
                            Jmp = 0;
                            Jal = 1;
                            I_format = 0;
                            Sftmd = 0;
                            ALUOp[1:0] = 2'b00;
                            end                                                                                                                                                                                                                                                                                                                                                                                                
     end
endmodule
