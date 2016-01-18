`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2015/01/02 14:01:42
// Design Name: 
// Module Name: Execute32
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


module Execute32(
    Read_data_1,
    Read_data_2,
    Sign_extend,
    Function_opcode,
    Exe_opcode,
    ALUOp,
    Shamt,
    ALUSrc,
    I_format,
    Sftmd,
    Zero,
    ALU_Result,
    Add_Result,
    PC_plus_4,
    clock,
    //µ•∂¿≤‚ ‘ÃÌº”
        ALU_Result,
        Ainput,Binput,
        Cinput,Dinput,
        Einput,Finput,
        Ginput,Hinput,
        Sinput,
        ALU_output_mux,
        Branch_Add,
        ALU_ctl,
        Shamt
    //µ•∂¿≤‚ ‘ÃÌº”
    );
    
    input[31:0] Read_data_1;
    input[31:0] Read_data_2;
    input[31:0] Sign_extend;
    input[5:0] Function_opcode;
    input[5:0] Exe_opcode;
    input[1:0] ALUOp;
    input[4:0] Shamt;
    input Sftmd;
    input ALUSrc;
    input I_format;
    input[31:0] PC_plus_4;
    input clock;
    output Zero;
    output[31:0] ALU_Result;
    output[31:0] Add_Result;
    //µ•∂¿≤‚ ‘ÃÌº”
        output[31:0] Ainput,Binput;
        output[31:0] Cinput,Dinput;
        output[31:0] Einput,Finput;
        output[31:0] Ginput,Hinput;
        output[31:0] Sinput;
        output[31:0] ALU_output_mux;
        output[31:0] Branch_Add;
        output[2:0] ALU_ctl;
    //µ•∂¿≤‚ ‘ÃÌº”
    reg[31:0] ALU_Result;
    wire[31:0] Ainput,Binput;
    reg[31:0] Cinput,Dinput;
    reg[31:0] Einput,Finput;
    reg[31:0] Ginput,Hinput;
    reg[31:0] Sinput;
    reg[31:0] ALU_output_mux;
    wire[31:0] Branch_Add;
    wire[2:0] ALU_ctl;
    wire[5:0] Exe_code;
    wire[2:0] Sftm;
    reg s;
    
    assign Sftm = Function_opcode[2:0];
    
    assign Branch_Add = PC_plus_4[31:0] + Sign_extend[31:0];
    assign Add_Result = Branch_Add[31:0];
    
    assign Zero = (ALU_output_mux[31:0]==32'h00000000)?1'b1:1'b0;
    
    assign Ainput = Read_data_1;
    assign Binput = (ALUSrc==0)?Read_data_2:Sign_extend[31:0];
    
    //SLL¬ﬂº≠◊Û“∆
    always @(posedge clock)             
    begin
        //Cinput[31:0] = Binput[31:0];
        case (Shamt)
            5'b00000:Cinput[31:0] = Binput[31:0];
            5'b00001:Cinput[31:0] = {Binput[30:0],1'b0};
            5'b00010:Cinput[31:0] = {Binput[29:0],2'b00};
            5'b00011:Cinput[31:0] = {Binput[28:0],3'b000};
            5'b00100:Cinput[31:0] = {Binput[27:0],4'b0000};
            5'b00101:Cinput[31:0] = {Binput[26:0],5'b00000};
            5'b00110:Cinput[31:0] = {Binput[25:0],6'b000000};
            5'b00111:Cinput[31:0] = {Binput[24:0],7'b0000000};
            5'b01000:Cinput[31:0] = {Binput[23:0],8'b00000000};
            5'b01001:Cinput[31:0] = {Binput[22:0],9'b000000000};
            5'b01010:Cinput[31:0] = {Binput[21:0],10'b0000000000};
            5'b01011:Cinput[31:0] = {Binput[20:0],11'b00000000000};
            5'b01100:Cinput[31:0] = {Binput[19:0],12'b000000000000};
            5'b01101:Cinput[31:0] = {Binput[18:0],13'b0000000000000};
            5'b01110:Cinput[31:0] = {Binput[17:0],14'b00000000000000};
            5'b01111:Cinput[31:0] = {Binput[16:0],15'b000000000000000};
            5'b10000:Cinput[31:0] = {Binput[15:0],16'b0000000000000000};
            5'b10001:Cinput[31:0] = {Binput[14:0],17'b00000000000000000};
            5'b10010:Cinput[31:0] = {Binput[13:0],18'b000000000000000000};
            5'b10011:Cinput[31:0] = {Binput[12:0],19'b0000000000000000000};
            5'b10100:Cinput[31:0] = {Binput[11:0],20'b00000000000000000000};
            5'b10101:Cinput[31:0] = {Binput[10:0],21'b000000000000000000000};
            5'b10110:Cinput[31:0] = {Binput[9:0],22'b0000000000000000000000};
            5'b10111:Cinput[31:0] = {Binput[8:0],23'b00000000000000000000000};
            5'b11000:Cinput[31:0] = {Binput[7:0],24'b000000000000000000000000};
            5'b11001:Cinput[31:0] = {Binput[6:0],25'b0000000000000000000000000};
            5'b11010:Cinput[31:0] = {Binput[5:0],26'b00000000000000000000000000};
            5'b11011:Cinput[31:0] = {Binput[4:0],27'b000000000000000000000000000};
            5'b11100:Cinput[31:0] = {Binput[3:0],28'b0000000000000000000000000000};
            5'b11101:Cinput[31:0] = {Binput[2:0],29'b00000000000000000000000000000};
            5'b11110:Cinput[31:0] = {Binput[1:0],30'b000000000000000000000000000000};
            5'b11111:Cinput[31:0] = {Binput[0],31'b0000000000000000000000000000000};
            default:Cinput[31:0] = Binput[31:0];
         endcase
    end
            
            //Srl¬ﬂº≠”““∆
        always @(posedge clock)                
        begin
            case (Shamt)
                5'b00000:Dinput[31:0] = Binput[31:0];
                5'b00001:Dinput[31:0] = {1'b0,Binput[31:1]};
                5'b00010:Dinput[31:0] = {2'b00,Binput[31:2]};
                5'b00011:Dinput[31:0] = {3'b000,Binput[31:3]};
                5'b00100:Dinput[31:0] = {4'b0000,Binput[31:4]};
                5'b00101:Dinput[31:0] = {5'b00000,Binput[31:5]};
                5'b00110:Dinput[31:0] = {6'b000000,Binput[31:6]};
                5'b00111:Dinput[31:0] = {7'b0000000,Binput[31:7]};
                5'b01000:Dinput[31:0] = {8'b00000000,Binput[31:8]};
                5'b01001:Dinput[31:0] = {9'b000000000,Binput[31:9]};
                5'b01010:Dinput[31:0] = {10'b0000000000,Binput[31:10]};
                5'b01011:Dinput[31:0] = {11'b00000000000,Binput[31:11]};
                5'b01100:Dinput[31:0] = {12'b000000000000,Binput[31:12]};
                5'b01101:Dinput[31:0] = {13'b0000000000000,Binput[31:13]};
                5'b01110:Dinput[31:0] = {14'b00000000000000,Binput[31:14]};
                5'b01111:Dinput[31:0] = {15'b000000000000000,Binput[31:15]};
                5'b10000:Dinput[31:0] = {16'b0000000000000000,Binput[31:16]};
                5'b10001:Dinput[31:0] = {17'b00000000000000000,Binput[31:17]};
                5'b10010:Dinput[31:0] = {18'b000000000000000000,Binput[31:18]};
                5'b10011:Dinput[31:0] = {19'b0000000000000000000,Binput[31:19]};
                5'b10100:Dinput[31:0] = {20'b00000000000000000000,Binput[31:20]};
                5'b10101:Dinput[31:0] = {21'b000000000000000000000,Binput[31:21]};
                5'b10110:Dinput[31:0] = {22'b0000000000000000000000,Binput[31:22]};
                5'b10111:Dinput[31:0] = {23'b00000000000000000000000,Binput[31:23]};
                5'b11000:Dinput[31:0] = {24'b000000000000000000000000,Binput[31:24]};
                5'b11001:Dinput[31:0] = {25'b0000000000000000000000000,Binput[31:25]};
                5'b11010:Dinput[31:0] = {26'b00000000000000000000000000,Binput[31:26]};
                5'b11011:Dinput[31:0] = {27'b000000000000000000000000000,Binput[31:27]};
                5'b11100:Dinput[31:0] = {28'b0000000000000000000000000000,Binput[31:28]};
                5'b11101:Dinput[31:0] = {29'b00000000000000000000000000000,Binput[31:29]};
                5'b11110:Dinput[31:0] = {30'b000000000000000000000000000000,Binput[31:30]};
                5'b11111:Dinput[31:0] = {31'b0000000000000000000000000000000,Binput[31]};
                default:Dinput[31:0] = Binput[31:0];
             endcase
        end
        
         //sllv¬ﬂº≠◊Û“∆
           always @(posedge clock)                
           begin
               case (Ainput[4:0])
                   5'b00000:Einput[31:0] = Binput[31:0];
                   5'b00001:Einput[31:0] = {Binput[30:0],1'b0};
                   5'b00010:Einput[31:0] = {Binput[29:0],2'b00};
                   5'b00011:Einput[31:0] = {Binput[28:0],3'b000};
                   5'b00100:Einput[31:0] = {Binput[27:0],4'b0000};
                   5'b00101:Einput[31:0] = {Binput[26:0],5'b00000};
                   5'b00110:Einput[31:0] = {Binput[25:0],6'b000000};
                   5'b00111:Einput[31:0] = {Binput[24:0],7'b0000000};
                   5'b01000:Einput[31:0] = {Binput[23:0],8'b00000000};
                   5'b01001:Einput[31:0] = {Binput[22:0],9'b000000000};
                   5'b01010:Einput[31:0] = {Binput[21:0],10'b0000000000};
                   5'b01011:Einput[31:0] = {Binput[20:0],11'b00000000000};
                   5'b01100:Einput[31:0] = {Binput[19:0],12'b000000000000};
                   5'b01101:Einput[31:0] = {Binput[18:0],13'b0000000000000};
                   5'b01110:Einput[31:0] = {Binput[17:0],14'b00000000000000};
                   5'b01111:Einput[31:0] = {Binput[16:0],15'b000000000000000};
                   5'b10000:Einput[31:0] = {Binput[15:0],16'b0000000000000000};
                   5'b10001:Einput[31:0] = {Binput[14:0],17'b00000000000000000};
                   5'b10010:Einput[31:0] = {Binput[13:0],18'b000000000000000000};
                   5'b10011:Einput[31:0] = {Binput[12:0],19'b0000000000000000000};
                   5'b10100:Einput[31:0] = {Binput[11:0],20'b00000000000000000000};
                   5'b10101:Einput[31:0] = {Binput[10:0],21'b000000000000000000000};
                   5'b10110:Einput[31:0] = {Binput[9:0],22'b0000000000000000000000};
                   5'b10111:Einput[31:0] = {Binput[8:0],23'b00000000000000000000000};
                   5'b11000:Einput[31:0] = {Binput[7:0],24'b000000000000000000000000};
                   5'b11001:Einput[31:0] = {Binput[6:0],25'b0000000000000000000000000};
                   5'b11010:Einput[31:0] = {Binput[5:0],26'b00000000000000000000000000};
                   5'b11011:Einput[31:0] = {Binput[4:0],27'b000000000000000000000000000};
                   5'b11100:Einput[31:0] = {Binput[3:0],28'b0000000000000000000000000000};
                   5'b11101:Einput[31:0] = {Binput[2:0],29'b00000000000000000000000000000};
                   5'b11110:Einput[31:0] = {Binput[1:0],30'b000000000000000000000000000000};
                   5'b11111:Einput[31:0] = {Binput[0],31'b0000000000000000000000000000000};
                   default:Einput[31:0] = Binput[31:0];
                endcase
           end
           
            //Srlv¬ﬂº≠”““∆
                  always  @(posedge clock)               
                  begin
                      case (Ainput[4:0])
                          5'b00000:Finput[31:0] = Binput[31:0];
                          5'b00001:Finput[31:0] = {1'b0,Binput[31:1]};
                          5'b00010:Finput[31:0] = {2'b00,Binput[31:2]};
                          5'b00011:Finput[31:0] = {3'b000,Binput[31:3]};
                          5'b00100:Finput[31:0] = {4'b0000,Binput[31:4]};
                          5'b00101:Finput[31:0] = {5'b00000,Binput[31:5]};
                          5'b00110:Finput[31:0] = {6'b000000,Binput[31:6]};
                          5'b00111:Finput[31:0] = {7'b0000000,Binput[31:7]};
                          5'b01000:Finput[31:0] = {8'b00000000,Binput[31:8]};
                          5'b01001:Finput[31:0] = {9'b000000000,Binput[31:9]};
                          5'b01010:Finput[31:0] = {10'b0000000000,Binput[31:10]};
                          5'b01011:Finput[31:0] = {11'b00000000000,Binput[31:11]};
                          5'b01100:Finput[31:0] = {12'b000000000000,Binput[31:12]};
                          5'b01101:Finput[31:0] = {13'b0000000000000,Binput[31:13]};
                          5'b01110:Finput[31:0] = {14'b00000000000000,Binput[31:14]};
                          5'b01111:Finput[31:0] = {15'b000000000000000,Binput[31:15]};
                          5'b10000:Finput[31:0] = {16'b0000000000000000,Binput[31:16]};
                          5'b10001:Finput[31:0] = {17'b00000000000000000,Binput[31:17]};
                          5'b10010:Finput[31:0] = {18'b000000000000000000,Binput[31:18]};
                          5'b10011:Finput[31:0] = {19'b0000000000000000000,Binput[31:19]};
                          5'b10100:Finput[31:0] = {20'b00000000000000000000,Binput[31:20]};
                          5'b10101:Finput[31:0] = {21'b000000000000000000000,Binput[31:21]};
                          5'b10110:Finput[31:0] = {22'b0000000000000000000000,Binput[31:22]};
                          5'b10111:Finput[31:0] = {23'b00000000000000000000000,Binput[31:23]};
                          5'b11000:Finput[31:0] = {24'b000000000000000000000000,Binput[31:24]};
                          5'b11001:Finput[31:0] = {25'b0000000000000000000000000,Binput[31:25]};
                          5'b11010:Finput[31:0] = {26'b00000000000000000000000000,Binput[31:26]};
                          5'b11011:Finput[31:0] = {27'b000000000000000000000000000,Binput[31:27]};
                          5'b11100:Finput[31:0] = {28'b0000000000000000000000000000,Binput[31:28]};
                          5'b11101:Finput[31:0] = {29'b00000000000000000000000000000,Binput[31:29]};
                          5'b11110:Finput[31:0] = {30'b000000000000000000000000000000,Binput[31:30]};
                          5'b11111:Finput[31:0] = {31'b0000000000000000000000000000000,Binput[31]};
                          default:Finput[31:0] = Binput[31:0];
                       endcase
                  end
           
           //SraÀ„ ı”““∆
           always @(posedge clock)   
           begin
           s = Binput[31];
           case(Shamt)
            5'b00000:Ginput[31:0] = Binput[31:0];
            5'b00001:Ginput[31:0] = {s,Binput[31:1]};
            5'b00010:Ginput[31:0] = {s,s,Binput[31:2]};
            5'b00011:Ginput[31:0] = {s,s,s,Binput[31:3]};
            5'b00100:Ginput[31:0] = {s,s,s,s,Binput[31:4]};
            5'b00101:Ginput[31:0] = {s,s,s,s,s,Binput[31:5]};
            5'b00110:Ginput[31:0] = {s,s,s,s,s,s,Binput[31:6]};
            5'b00111:Ginput[31:0] = {s,s,s,s,s,s,s,Binput[31:7]};
            5'b01000:Ginput[31:0] = {s,s,s,s,s,s,s,s,Binput[31:8]};
            5'b01001:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,Binput[31:9]};
            5'b01010:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,Binput[31:10]};
            5'b01011:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,Binput[31:11]};
            5'b01100:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:12]};
            5'b01101:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:13]};
            5'b01110:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:14]};
            5'b01111:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:15]};
            5'b10000:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:16]};
            5'b10001:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:17]};
            5'b10010:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:18]};
            5'b10011:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:19]};
            5'b10100:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:20]};
            5'b10101:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:21]};
            5'b10110:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:22]};
            5'b10111:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:23]};
            5'b11000:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:24]};
            5'b11001:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:25]};
            5'b11010:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:26]};
            5'b11011:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:27]};
            5'b11100:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:28]};
            5'b11101:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:29]};
            5'b11110:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:30]};
            5'b11111:Ginput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31]}; 
            default:Ginput[31:0] = Binput[31:0];
           endcase
      end
      
        //SravÀ„ ı”““∆
               always @(posedge clock)   
               begin
               s = Binput[31];
               case(Ainput[4:0])
                5'b00000:Hinput[31:0] = Binput[31:0];
                5'b00001:Hinput[31:0] = {s,Binput[31:1]};
                5'b00010:Hinput[31:0] = {s,s,Binput[31:2]};
                5'b00011:Hinput[31:0] = {s,s,s,Binput[31:3]};
                5'b00100:Hinput[31:0] = {s,s,s,s,Binput[31:4]};
                5'b00101:Hinput[31:0] = {s,s,s,s,s,Binput[31:5]};
                5'b00110:Hinput[31:0] = {s,s,s,s,s,s,Binput[31:6]};
                5'b00111:Hinput[31:0] = {s,s,s,s,s,s,s,Binput[31:7]};
                5'b01000:Hinput[31:0] = {s,s,s,s,s,s,s,s,Binput[31:8]};
                5'b01001:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,Binput[31:9]};
                5'b01010:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,Binput[31:10]};
                5'b01011:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,Binput[31:11]};
                5'b01100:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:12]};
                5'b01101:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:13]};
                5'b01110:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:14]};
                5'b01111:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:15]};
                5'b10000:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:16]};
                5'b10001:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:17]};
                5'b10010:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:18]};
                5'b10011:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:19]};
                5'b10100:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:20]};
                5'b10101:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:21]};
                5'b10110:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:22]};
                5'b10111:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:23]};
                5'b11000:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:24]};
                5'b11001:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:25]};
                5'b11010:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:26]};
                5'b11011:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:27]};
                5'b11100:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:28]};
                5'b11101:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:29]};
                5'b11110:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31:30]};
                5'b11111:Hinput[31:0] = {s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,s,Binput[31]}; 
                default:Hinput[31:0] = Binput[31:0];
               endcase
          end
          
          
          always @(posedge clock)   
          begin
            case(Sftm[2:0])
                3'b000:Sinput = Cinput;  //Sll,rd,rt,shamt
                3'b010:Sinput = Dinput;  //Srl,rd,rt,shamt
                3'b100:Sinput = Einput;  //Sllv,rd,rt,rs
                3'b110:Sinput = Finput;  //Srlv,rd,rt,rs
                3'b011:Sinput = Ginput;  //Sra,rd,rt,shamt
                3'b111:Sinput = Hinput;  //Srav,rd,rt,rs    
                default:Sinput = Binput;
            endcase
          end
          
        assign Exe_code = (I_format==0)?Function_opcode:{3'b000,Exe_opcode[2:0]};
        assign ALU_ctl[0] = (Exe_code[0]|Exe_code[3]&ALUOp[1]);
        assign ALU_ctl[1] = ((!Exe_code[2])|(!ALUOp[1]));    
        assign ALU_ctl[2] = (Exe_code[1]&ALUOp[1])|ALUOp[0];    
        
        always @ (ALU_ctl or Ainput or Binput)
        begin
            case(ALU_ctl)
            3'b000:ALU_output_mux = Ainput & Binput;  
            3'b001:ALU_output_mux = Ainput | Binput;  
            3'b010:ALU_output_mux = Ainput + Binput;  
            3'b011:ALU_output_mux = Ainput + Binput;  
            3'b100:ALU_output_mux = Ainput ^ Binput;  
            3'b101:ALU_output_mux = ~(Ainput | Binput);  
            3'b110:ALU_output_mux = Ainput - Binput;  
            3'b111:ALU_output_mux = Ainput - Binput; 
            default:ALU_output_mux = 32'h00000000;
            endcase
        end
        
        //◊Ó∫ÛΩ·π˚∏≥÷µ
        always @(posedge clock )   
        begin
            if(((ALU_ctl==3'b111)&&(Exe_code[3]==1))||
            ((ALU_ctl[2:1]==2'b11)&&(I_format==1)))         //¥¶¿ÌSLT¿‡÷∏¡Ó
                ALU_Result = {31'b0000000000000000000000000000000,ALU_output_mux[31]}; 
                  else if ((ALU_ctl==3'b101)&&(I_format==1))//¥¶¿Ìlui÷∏¡Ó
                    ALU_Result[31:0] = {Binput[15:0], 16'b0000000000000000};
                    else if(Sftmd==1) ALU_Result = Sinput;//“∆Œª÷∏¡Ó
                    else ALU_Result[31:0] = ALU_output_mux[31:0];//∆‰À˚«Èøˆ‘ÀÀ„Ω·π˚
        end
endmodule
