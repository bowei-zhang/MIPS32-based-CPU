`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/02 14:02:25
// Design Name: 
// Module Name: Idecode32
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


module Idecode32(
    read_data_1,
    read_data_2,
    Instruction,
    read_data,
    ALU_result,
    Jal,
    RegWrite,
    MemtoReg,
    RegDst,
    Sign_extend,
    clock,
    reset,
    opcplus4,
    //≤‚ ‘ÃÌº”
    register1_out
//    registerv_out,
//    write_address_out
    //≤‚ ‘ÃÌº”
    );
    
    output[31:0] read_data_1;
    output[31:0] read_data_2;
    output[31:0] Sign_extend;
    input[31:0] Instruction;
    input[31:0] read_data;
    input[31:0] ALU_result;
    input Jal;
    input RegWrite;
    input MemtoReg;
    input RegDst;
    input clock,reset;
    input [31:0] opcplus4;
    reg[31:0] read_data_1;
    reg[31:0] read_data_2;
    //≤‚ ‘ÃÌº”
    output[31:0] register1_out;
//    output[31:0] registerv_out;
//    output[4:0] write_address_out;
    //≤‚ ‘ÃÌº”
    
    
    reg[31:0] register0, register1, register2, register3; 
    reg[31:0] register4, register5, register6, register7; 
    reg[31:0] register8, register9, registera, registerb; 
    reg[31:0] registerc, registerd, registere, registerf; 
    reg[31:0] registerg, registerh, registeri, registerj; 
    reg[31:0] registerk, registerl, registerm, registern; 
    reg[31:0] registero, registerp, registerq, registerr; 
    reg[31:0] registers, registert, registeru, registerv;
    
    reg[4:0] write_register_address;
    reg[31:0] write_data;
    wire[4:0] read_register_1_address,read_register_2_address;
    wire[4:0] write_register_address_1,write_register_address_0;
    wire[15:0] Instruction_immediate_value;
    wire[5:0]opcode;
    wire sign;
    
    assign register1_out = register1;
    assign write_address_out = write_register_address;
    assign register2_out = register2;
    assign registerv_out = registerv;
    assign opcode = Instruction[31:26];
    assign read_register_1_address = Instruction[25:21]; //00000
    assign read_register_2_address = Instruction[20:16]; //11111   
    assign write_register_address_1 = Instruction[15:11]; //00010
    assign write_register_address_0 = Instruction[20:16]; //11111
    assign Instruction_immediate_value = Instruction[15:0]; //1000000000000000
    
    assign sign = Instruction_immediate_value[15];
    assign Sign_extend[31:0] = ((opcode==6'b001100)
                                ||(opcode==6'b001101)
                                ||(opcode==6'b001110)
                                ||(opcode==6'b001011))
                                ?{16'h0000,Instruction_immediate_value[15:0]}
                                :{sign,sign,sign,sign,sign,sign,sign,sign,
                                sign,sign,sign,sign,sign,sign,sign,sign,
                                Instruction_immediate_value[15:0]};
                                
    always @ (read_register_1_address or posedge clock)
    begin
        case(read_register_1_address[4:0])
            5'd0:read_data_1 = register0;
            5'd1:read_data_1 = register1; 
            5'd2:read_data_1 = register2; 
            5'd3:read_data_1 = register3; 
            5'd4:read_data_1 = register4; 
            5'd5:read_data_1 = register5; 
            5'd6:read_data_1 = register6; 
            5'd7:read_data_1 = register7; 
            5'd8:read_data_1 = register8; 
            5'd9:read_data_1 = register9; 
            5'd10:read_data_1 = registera; 
            5'd11:read_data_1 = registerb; 
            5'd12:read_data_1 = registerc; 
            5'd13:read_data_1 = registerd; 
            5'd14:read_data_1 = registere; 
            5'd15:read_data_1 = registerf; 
            5'd16:read_data_1 = registerg; 
            5'd17:read_data_1 = registerh; 
            5'd18:read_data_1 = registeri; 
            5'd19:read_data_1 = registerj; 
            5'd20:read_data_1 = registerk; 
            5'd21:read_data_1 = registerl; 
            5'd22:read_data_1 = registerm; 
            5'd23:read_data_1 = registern; 
            5'd24:read_data_1 = registero; 
            5'd25:read_data_1 = registerp; 
            5'd26:read_data_1 = registerq; 
            5'd27:read_data_1 = registerr; 
            5'd28:read_data_1 = registers; 
            5'd29:read_data_1 = registert; 
            5'd30:read_data_1 = registeru; 
            5'd31:read_data_1 = registerv;
            default read_data_1 = 32'bx;
        endcase
    end
   
   always @ (read_register_2_address or posedge clock)
        begin
            case(read_register_2_address[4:0])
                5'd0:read_data_2 = register0;
                5'd1:read_data_2 = register1; 
                5'd2:read_data_2 = register2; 
                5'd3:read_data_2 = register3; 
                5'd4:read_data_2 = register4; 
                5'd5:read_data_2 = register5; 
                5'd6:read_data_2 = register6; 
                5'd7:read_data_2 = register7; 
                5'd8:read_data_2 = register8; 
                5'd9:read_data_2 = register9; 
                5'd10:read_data_2 = registera; 
                5'd11:read_data_2 = registerb; 
                5'd12:read_data_2 = registerc; 
                5'd13:read_data_2 = registerd; 
                5'd14:read_data_2 = registere; 
                5'd15:read_data_2 = registerf; 
                5'd16:read_data_2 = registerg; 
                5'd17:read_data_2 = registerh; 
                5'd18:read_data_2 = registeri; 
                5'd19:read_data_2 = registerj; 
                5'd20:read_data_2 = registerk; 
                5'd21:read_data_2 = registerl; 
                5'd22:read_data_2 = registerm; 
                5'd23:read_data_2 = registern; 
                5'd24:read_data_2 = registero; 
                5'd25:read_data_2 = registerp; 
                5'd26:read_data_2 = registerq; 
                5'd27:read_data_2 = registerr; 
                5'd28:read_data_2 = registers; 
                5'd29:read_data_2 = registert; 
                5'd30:read_data_2 = registeru; 
                5'd31:read_data_2 = registerv;
                default read_data_2 = 32'bx;
            endcase
        end 
    
    always @(posedge clock)
    begin
    if((RegDst==1)&&(Jal==0))
        write_register_address = write_register_address_1;
    else if((RegDst==0)&&(Jal==1))
        write_register_address = 5'b11111;
    else
        write_register_address = write_register_address_0;
    end
    
    
    always @(negedge clock)
        begin
            if((MemtoReg==0)&&(Jal==0)) 
            begin
            write_data = ALU_result[31:0];
                        if(RegWrite==1)
                        begin
                            case(write_register_address[4:0])
                                5'd0:register0<=32'd0;
                                5'd1:register1<=write_data;
                                5'd2:register2<=write_data;
                                5'd3:register3<=write_data;
                                5'd4:register4<=write_data;
                                5'd5:register5<=write_data;
                                5'd6:register6<=write_data;
                                5'd7:register7<=write_data;
                                5'd8:register8<=write_data;
                                5'd9:register9<=write_data;
                                5'd10:registera<=write_data;
                                5'd11:registerb<=write_data;
                                5'd12:registerc<=write_data;
                                5'd13:registerd<=write_data;
                                5'd14:registere<=write_data;
                                5'd15:registerf<=write_data;
                                5'd16:registerg<=write_data;
                                5'd17:registerh<=write_data;
                                5'd18:registeri<=write_data;
                                5'd19:registerj<=write_data;
                                5'd20:registerk<=write_data;
                                5'd21:registerl<=write_data;
                                5'd22:registerm<=write_data;
                                5'd23:registern<=write_data;
                                5'd24:registero<=write_data;
                                5'd25:registerp<=write_data;
                                5'd26:registerq<=write_data;
                                5'd27:registerr<=write_data;
                                5'd28:registers<=write_data;
                                5'd29:registert<=write_data;
                                5'd30:registeru<=write_data;
                                5'd31:registerv<=write_data;
                                default:register0<=32'd0;
                               endcase
                           end    
                           end 
        end
        
    always @(posedge clock)
    begin
       // if((MemtoReg==0)&&(Jal==0))
            //write_data = ALU_result[31:0]; 
           
        if((MemtoReg==0)&&(Jal==1))
            begin
                write_data[31:0] = {16'b0000000000000000,opcplus4[15:0]};
            end
        else if((MemtoReg==1)&&(Jal==0))   write_data = read_data;
    end


    always @ (posedge clock)
    begin
        if(reset==1)
        begin
            register0<=32'd0;
            register1<=32'd1; 
            register2<=32'd2; 
            register3<=32'd3; 
            register4<=32'd4; 
            register5<=32'd5; 
            register6<=32'd6; 
            register7<=32'd7; 
            register8<=32'd8; 
            register9<=32'd9; 
            registera<=32'd10; 
            registerb<=32'd11; 
            registerc<=32'd12; 
            registerd<=32'd13; 
            registere<=32'd14; 
            registerf<=32'd15; 
            registerg<=32'd16; 
            registerh<=32'd17; 
            registeri<=32'd18; 
            registerj<=32'd19; 
            registerk<=32'd20; 
            registerl<=32'd21; 
            registerm<=32'd22; 
            registern<=32'd23; 
            registero<=32'd24; 
            registerp<=32'd25; 
            registerq<=32'd26; 
            registerr<=32'd27; 
            registers<=32'd28; 
            registert<=32'd29; 
            registeru<=32'd30; 
            registerv<=32'd31;
        end
        else if(RegWrite==1)
            begin
                case(write_register_address[4:0])
                    5'd0:register0<=32'd0;
                    5'd1:register1<=write_data;
                    5'd2:register2<=write_data;
                    5'd3:register3<=write_data;
                    5'd4:register4<=write_data;
                    5'd5:register5<=write_data;
                    5'd6:register6<=write_data;
                    5'd7:register7<=write_data;
                    5'd8:register8<=write_data;
                    5'd9:register9<=write_data;
                    5'd10:registera<=write_data;
                    5'd11:registerb<=write_data;
                    5'd12:registerc<=write_data;
                    5'd13:registerd<=write_data;
                    5'd14:registere<=write_data;
                    5'd15:registerf<=write_data;
                    5'd16:registerg<=write_data;
                    5'd17:registerh<=write_data;
                    5'd18:registeri<=write_data;
                    5'd19:registerj<=write_data;
                    5'd20:registerk<=write_data;
                    5'd21:registerl<=write_data;
                    5'd22:registerm<=write_data;
                    5'd23:registern<=write_data;
                    5'd24:registero<=write_data;
                    5'd25:registerp<=write_data;
                    5'd26:registerq<=write_data;
                    5'd27:registerr<=write_data;
                    5'd28:registers<=write_data;
                    5'd29:registert<=write_data;
                    5'd30:registeru<=write_data;
                    5'd31:registerv<=write_data;
                    default:register0<=32'd0;
                   endcase
               end                 
    end                                           
endmodule
