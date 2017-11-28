`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:09:18 11/18/2017
// Design Name:
// Module Name:    ProjectName
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module D_ff_IM(input clk, input reset, input d, output reg q);
	always@(reset or posedge clk)
	if(reset)
		q=d;
endmodule

module register_IM(input clk, input reset, input [15:0] d_in, output [15:0] q_out);
	D_ff_IM dIM0 (clk, reset, d_in[0], q_out[0]);
	D_ff_IM dIM1 (clk, reset, d_in[1], q_out[1]);
	D_ff_IM dIM2 (clk, reset, d_in[2], q_out[2]);
	D_ff_IM dIM3 (clk, reset, d_in[3], q_out[3]);
	D_ff_IM dIM4 (clk, reset, d_in[4], q_out[4]);
	D_ff_IM dIM5 (clk, reset, d_in[5], q_out[5]);
	D_ff_IM dIM6 (clk, reset, d_in[6], q_out[6]);
	D_ff_IM dIM7 (clk, reset, d_in[7], q_out[7]);
	D_ff_IM dIM8 (clk, reset, d_in[8], q_out[8]);
	D_ff_IM dIM9 (clk, reset, d_in[9], q_out[9]);
	D_ff_IM dIM10 (clk, reset, d_in[10], q_out[10]);
	D_ff_IM dIM11 (clk, reset, d_in[11], q_out[11]);
	D_ff_IM dIM12 (clk, reset, d_in[12], q_out[12]);
	D_ff_IM dIM13 (clk, reset, d_in[13], q_out[13]);
	D_ff_IM dIM14 (clk, reset, d_in[14], q_out[14]);
	D_ff_IM dIM15 (clk, reset, d_in[15], q_out[15]);
endmodule

module mux32to1_IM_32bits(input [15:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
	outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,
	input [4:0] Sel, output reg [31:0] outBus );

	always@(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
		outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,
		Sel)
		case (Sel)
			5'd0: outBus = {outR1,outR0};
			5'd1: outBus = {outR2,outR1};
			5'd2: outBus = {outR3,outR2};
			5'd3: outBus = {outR4,outR3};
			5'd4: outBus = {outR5,outR4};
			5'd5: outBus = {outR6,outR5};
			5'd6: outBus = {outR7,outR6};
			5'd7: outBus = {outR8,outR7};
			5'd8: outBus = {outR9,outR8};
			5'd9: outBus = {outR10,outR9};
			5'd10: outBus = {outR11,outR10};
			5'd11: outBus = {outR12,outR11};
			5'd12: outBus = {outR13,outR12};
			5'd13: outBus = {outR14,outR13};
			5'd14: outBus = {outR15,outR14};
			5'd15: outBus = {outR16,outR15};
			5'd16: outBus = {outR17,outR16};
			5'd17: outBus = {outR18,outR17};
			5'd18: outBus = {outR19,outR18};
			5'd19: outBus = {outR20,outR19};
			5'd20: outBus = {outR21,outR20};
			5'd21: outBus = {outR22,outR21};
			5'd22: outBus = {outR23,outR22};
			5'd23: outBus = {outR24,outR23};
			5'd24: outBus = {outR25,outR24};
			5'd25: outBus = {outR26,outR25};
			5'd26: outBus = {outR27,outR26};
			5'd27: outBus = {outR28,outR27};
			5'd28: outBus = {outR29,outR28};
			5'd29: outBus = {outR30,outR29};
			5'd30: outBus = {outR31,outR30};
			5'd31: outBus = {32'b0,outR31};
		endcase
endmodule

module mux32to1_IM_16bits(input [15:0] outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
	outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,
	input [4:0] Sel, output reg [15:0] outBus );

	always@(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
		outR16,outR17,outR18,outR19,outR20,outR21,outR22,outR23,outR24,outR25,outR26,outR27,outR28,outR29,outR30,outR31,
		Sel)
		case (Sel)
			5'd0: outBus = outR0;
			5'd1: outBus = outR1;
			5'd2: outBus = outR2;
			5'd3: outBus = outR3;
			5'd4: outBus = outR4;
			5'd5: outBus = outR5;
			5'd6: outBus = outR6;
			5'd7: outBus = outR7;
			5'd8: outBus = outR8;
			5'd9: outBus = outR9;
			5'd10: outBus =outR10;
			5'd11: outBus =outR11;
			5'd12: outBus =outR12;
			5'd13: outBus =outR13;
			5'd14: outBus = outR14;
			5'd15: outBus = outR15;
			5'd16: outBus = outR16;
			5'd17: outBus = outR17;
			5'd18: outBus = outR18;
			5'd19: outBus = outR19;
			5'd20: outBus = outR20;
			5'd21: outBus = outR21;
			5'd22: outBus = outR22;
			5'd23: outBus = outR23;
			5'd24: outBus = outR24;
			5'd25: outBus = outR25;
			5'd26: outBus = outR26;
			5'd27: outBus = outR27;
			5'd28: outBus = outR28;
			5'd29: outBus = outR29;
			5'd30: outBus = outR30;
			5'd31: outBus = outR31;
		endcase
endmodule

module IM(input clk, input reset, input [4:0] pc_5bits, output [31:0] IR_32bits,output [15:0] IR_16bits);
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31;
	wire [15:0] pc_16bits;
	assign pc_16bits=pc_5bits+2;
	register_IM rIM0 (clk, reset, 16'h0093, Qout0);//addi
	register_IM rIM1 (clk, reset, 16'h0050, Qout1);
	register_IM rIM2 (clk, reset, 16'h8202, Qout2);//c.mv
	register_IM rIM3 (clk, reset, 16'h0113, Qout3);//addi
	register_IM rIM4 (clk, reset, 16'h0010, Qout4);
	register_IM rIM5 (clk, reset, 16'h8202, Qout5);//c.mv
	register_IM rIM6 (clk, reset, 16'h0197, Qout6);//AUIPC
	register_IM rIM7 (clk, reset, 16'h0000, Qout7);
	register_IM rIM8 (clk, reset, 16'h8202, Qout8);//c.mv
	register_IM rIM9 (clk, reset, 16'h8193, Qout9);//addi
	register_IM rIM10 (clk, reset, 16'h0060, Qout10);
	register_IM rIM11 (clk, reset, 16'h8202, Qout11);//c.mv
	register_IM rIM12 (clk, reset, 16'hd293, Qout12);//srli
	register_IM rIM13 (clk, reset, 16'h0010, Qout13);
	register_IM rIM14 (clk, reset, 16'h8202, Qout14);//c.mv
	register_IM rIM15 (clk, reset, 16'hd333, Qout15);//sra
	register_IM rIM16 (clk, reset, 16'h4050, Qout16);
	register_IM rIM17 (clk, reset, 16'h8202, Qout17);//c.mv
	register_IM rIM18 (clk, reset, 16'he393, Qout18);//andi
	register_IM rIM19 (clk, reset, 16'hfff2, Qout19);
	register_IM rIM20 (clk, reset, 16'h8202, Qout20);//c.mv
	register_IM rIM21 (clk, reset, 16'h2403, Qout21);//lw
	register_IM rIM22 (clk, reset, 16'h0040, Qout22);
	register_IM rIM23 (clk, reset, 16'h8202, Qout23);//c.mv
	register_IM rIM24 (clk, reset, 16'h8193, Qout24);//addi
	register_IM rIM25 (clk, reset, 16'h0060, Qout25);
	register_IM rIM26 (clk, reset, 16'he091, Qout26);//bneq
	register_IM rIM27 (clk, reset, 16'h0493, Qout27);//addi
	register_IM rIM28 (clk, reset, 16'h00A0, Qout28);
	register_IM rIM29 (clk, reset, 16'h0513, Qout29);//addi
	register_IM rIM30 (clk, reset, 16'h00A0, Qout30);
	register_IM rIM31 (clk, reset, 16'hc044, Qout31);//c.sw
	mux32to1_IM_32bits mIM1 (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,
		Qout16,Qout17,Qout18,Qout19,Qout20,Qout21,Qout22,Qout23,Qout24,Qout25,Qout26,Qout27,Qout28,Qout29,Qout30,Qout31,
		pc_5bits[4:0],IR_32bits);
	mux32to1_IM_16bits mIM2 (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,
		Qout16,Qout17,Qout18,Qout19,Qout20,Qout21,Qout22,Qout23,Qout24,Qout25,Qout26,Qout27,Qout28,Qout29,Qout30,Qout31,
		pc_16bits[4:0],IR_16bits);

endmodule


//Instruction Memory Design Ends

// Register Memory Starts

module D_ff_reg(input clk, input reset, input regWrite, input decOut1b , input d, output reg q);
	always @ (negedge clk)
	begin
	if(reset==1)
		q=0;
	else
		if(regWrite == 1 && decOut1b==1)
		begin
			q=d;
		end
	end
endmodule


module register32bit(input clk, input reset, input writeLow, input writeHigh, input decOut1b, input [31:0] writeData, output  [31:0] outR);

	D_ff_reg d0(clk, reset, writeLow, decOut1b, writeData[0], outR[0]);
	D_ff_reg d1(clk, reset, writeLow, decOut1b, writeData[1], outR[1]);
	D_ff_reg d2(clk, reset, writeLow, decOut1b, writeData[2], outR[2]);
	D_ff_reg d3(clk, reset, writeLow, decOut1b, writeData[3], outR[3]);
	D_ff_reg d4(clk, reset, writeLow, decOut1b, writeData[4], outR[4]);
	D_ff_reg d5(clk, reset, writeLow, decOut1b, writeData[5], outR[5]);
	D_ff_reg d6(clk, reset, writeLow, decOut1b, writeData[6], outR[6]);
	D_ff_reg d7(clk, reset, writeLow, decOut1b, writeData[7], outR[7]);
	D_ff_reg d8(clk, reset, writeLow, decOut1b, writeData[8], outR[8]);
	D_ff_reg d9(clk, reset, writeLow, decOut1b, writeData[9], outR[9]);
	D_ff_reg d10(clk, reset, writeLow, decOut1b, writeData[10], outR[10]);
	D_ff_reg d11(clk, reset, writeLow, decOut1b, writeData[11], outR[11]);
	D_ff_reg d12(clk, reset, writeLow, decOut1b, writeData[12], outR[12]);
	D_ff_reg d13(clk, reset, writeLow, decOut1b, writeData[13], outR[13]);
	D_ff_reg d14(clk, reset, writeLow, decOut1b, writeData[14], outR[14]);
	D_ff_reg d15(clk, reset, writeLow, decOut1b, writeData[15], outR[15]);
	D_ff_reg d16(clk, reset, writeHigh, decOut1b, writeData[16], outR[16]);
	D_ff_reg d17(clk, reset, writeHigh, decOut1b, writeData[17], outR[17]);
	D_ff_reg d18(clk, reset, writeHigh, decOut1b, writeData[18], outR[18]);
	D_ff_reg d19(clk, reset, writeHigh, decOut1b, writeData[19], outR[19]);
	D_ff_reg d20(clk, reset, writeHigh, decOut1b, writeData[20], outR[20]);
	D_ff_reg d21(clk, reset, writeHigh, decOut1b, writeData[21], outR[21]);
	D_ff_reg d22(clk, reset, writeHigh, decOut1b, writeData[22], outR[22]);
	D_ff_reg d23(clk, reset, writeHigh, decOut1b, writeData[23], outR[23]);
	D_ff_reg d24(clk, reset, writeHigh, decOut1b, writeData[24], outR[24]);
	D_ff_reg d25(clk, reset, writeHigh, decOut1b, writeData[25], outR[25]);
	D_ff_reg d26(clk, reset, writeHigh, decOut1b, writeData[26], outR[26]);
	D_ff_reg d27(clk, reset, writeHigh, decOut1b, writeData[27], outR[27]);
	D_ff_reg d28(clk, reset, writeHigh, decOut1b, writeData[28], outR[28]);
	D_ff_reg d29(clk, reset, writeHigh, decOut1b, writeData[29], outR[29]);
	D_ff_reg d30(clk, reset, writeHigh, decOut1b, writeData[30], outR[30]);
	D_ff_reg d31(clk, reset, writeHigh, decOut1b, writeData[31], outR[31]);

endmodule

module registerSet(input clk, input reset, input writeLow, input writeHigh, input [31:0] decOut1,
	input [31:0] decOut2, input [31:0] writeData32,input [31:0] writeData16,
	output [31:0] outR0, output [31:0] outR1, output [31:0] outR2, output [31:0] outR3,
	output [31:0] outR4, output [31:0] outR5, output [31:0] outR6, output [31:0] outR7,
	output [31:0] outR8, output [31:0] outR9, output [31:0] outR10, output [31:0] outR11,
	output [31:0] outR12, output [31:0] outR13, output [31:0] outR14, output [31:0] outR15,
	output [31:0] outR16, output [31:0] outR17, output [31:0] outR18, output [31:0] outR19,
	output [31:0] outR20, output [31:0] outR21, output [31:0] outR22, output [31:0] outR23,
	output [31:0] outR24, output [31:0] outR25, output [31:0] outR26, output [31:0] outR27,
	output [31:0] outR28, output [31:0] outR29, output [31:0] outR30, output [31:0] outR31);

	register32bit register0(clk, reset, writeLow, writeHigh, decOut1[0] | decOut2[0], ({32{decOut1[0]}} &  writeData32) | ({32{decOut2[0]}} &  writeData16), outR0);
	register32bit register1(clk, reset, writeLow, writeHigh, decOut1[1] | decOut2[1], ({32{decOut1[1]}} &  writeData32) | ({32{decOut2[1]}} &  writeData16), outR1);
	register32bit register2(clk, reset, writeLow, writeHigh, decOut1[2] | decOut2[2], ({32{decOut1[2]}} &  writeData32) | ({32{decOut2[2]}} &  writeData16), outR2);
	register32bit register3(clk, reset, writeLow, writeHigh, decOut1[3] | decOut2[3], ({32{decOut1[3]}} &  writeData32) | ({32{decOut2[3]}} &  writeData16), outR3);
	register32bit register4(clk, reset, writeLow, writeHigh, decOut1[4] | decOut2[4], ({32{decOut1[4]}} &  writeData32) | ({32{decOut2[4]}} &  writeData16), outR4);
	register32bit register5(clk, reset, writeLow, writeHigh, decOut1[5] | decOut2[5], ({32{decOut1[5]}} &  writeData32) | ({32{decOut2[5]}} &  writeData16), outR5);
	register32bit register6(clk, reset, writeLow, writeHigh, decOut1[6] | decOut2[6], ({32{decOut1[6]}} &  writeData32) | ({32{decOut2[6]}} &  writeData16), outR6);
	register32bit register7(clk, reset, writeLow, writeHigh, decOut1[7] | decOut2[7], ({32{decOut1[7]}} &  writeData32) | ({32{decOut2[7]}} &  writeData16), outR7);
	register32bit register8(clk, reset, writeLow, writeHigh, decOut1[8] | decOut2[8], ({32{decOut1[8]}} &  writeData32) | ({32{decOut2[8]}} &  writeData16), outR8);
	register32bit register9(clk, reset, writeLow, writeHigh, decOut1[9] | decOut2[9], ({32{decOut1[9]}} &  writeData32) | ({32{decOut2[9]}} &  writeData16), outR9);
	register32bit register10(clk, reset, writeLow, writeHigh, decOut1[10] | decOut2[10], ({32{decOut1[10]}} &  writeData32) | ({32{decOut2[10]}} &  writeData16), outR10);
	register32bit register11(clk, reset, writeLow, writeHigh, decOut1[11] | decOut2[11], ({32{decOut1[11]}} &  writeData32) | ({32{decOut2[11]}} &  writeData16), outR11);
	register32bit register12(clk, reset, writeLow, writeHigh, decOut1[12] | decOut2[12], ({32{decOut1[12]}} &  writeData32) | ({32{decOut2[12]}} &  writeData16), outR12);
	register32bit register13(clk, reset, writeLow, writeHigh, decOut1[13] | decOut2[13], ({32{decOut1[13]}} &  writeData32) | ({32{decOut2[13]}} &  writeData16), outR13);
	register32bit register14(clk, reset, writeLow, writeHigh, decOut1[14] | decOut2[14], ({32{decOut1[14]}} &  writeData32) | ({32{decOut2[14]}} &  writeData16), outR14);
	register32bit register15(clk, reset, writeLow, writeHigh, decOut1[15] | decOut2[15], ({32{decOut1[15]}} &  writeData32) | ({32{decOut2[15]}} &  writeData16), outR15);
	register32bit register16(clk, reset, writeLow, writeHigh, decOut1[16] | decOut2[16], ({32{decOut1[16]}} &  writeData32) | ({32{decOut2[16]}} &  writeData16), outR16);
	register32bit register17(clk, reset, writeLow, writeHigh, decOut1[17] | decOut2[17], ({32{decOut1[17]}} &  writeData32) | ({32{decOut2[17]}} &  writeData16), outR17);
	register32bit register18(clk, reset, writeLow, writeHigh, decOut1[18] | decOut2[18], ({32{decOut1[18]}} &  writeData32) | ({32{decOut2[18]}} &  writeData16), outR18);
	register32bit register19(clk, reset, writeLow, writeHigh, decOut1[19] | decOut2[19], ({32{decOut1[19]}} &  writeData32) | ({32{decOut2[19]}} &  writeData16), outR19);
	register32bit register20(clk, reset, writeLow, writeHigh, decOut1[20] | decOut2[20], ({32{decOut1[20]}} &  writeData32) | ({32{decOut2[20]}} &  writeData16), outR20);
	register32bit register21(clk, reset, writeLow, writeHigh, decOut1[21] | decOut2[21], ({32{decOut1[21]}} &  writeData32) | ({32{decOut2[21]}} &  writeData16), outR21);
	register32bit register22(clk, reset, writeLow, writeHigh, decOut1[22] | decOut2[22], ({32{decOut1[22]}} &  writeData32) | ({32{decOut2[22]}} &  writeData16), outR22);
	register32bit register23(clk, reset, writeLow, writeHigh, decOut1[23] | decOut2[23], ({32{decOut1[23]}} &  writeData32) | ({32{decOut2[23]}} &  writeData16), outR23);
	register32bit register24(clk, reset, writeLow, writeHigh, decOut1[24] | decOut2[24], ({32{decOut1[24]}} &  writeData32) | ({32{decOut2[24]}} &  writeData16), outR24);
	register32bit register25(clk, reset, writeLow, writeHigh, decOut1[25] | decOut2[25], ({32{decOut1[25]}} &  writeData32) | ({32{decOut2[25]}} &  writeData16), outR25);
	register32bit register26(clk, reset, writeLow, writeHigh, decOut1[26] | decOut2[26], ({32{decOut1[26]}} &  writeData32) | ({32{decOut2[26]}} &  writeData16), outR26);
	register32bit register27(clk, reset, writeLow, writeHigh, decOut1[27] | decOut2[27], ({32{decOut1[27]}} &  writeData32) | ({32{decOut2[27]}} &  writeData16), outR27);
	register32bit register28(clk, reset, writeLow, writeHigh, decOut1[28] | decOut2[28], ({32{decOut1[28]}} &  writeData32) | ({32{decOut2[28]}} &  writeData16), outR28);
	register32bit register29(clk, reset, writeLow, writeHigh, decOut1[29] | decOut2[29], ({32{decOut1[29]}} &  writeData32) | ({32{decOut2[29]}} &  writeData16), outR29);
	register32bit register30(clk, reset, writeLow, writeHigh, decOut1[30] | decOut2[30], ({32{decOut1[30]}} &  writeData32) | ({32{decOut2[30]}} &  writeData16), outR30);
	register32bit register31(clk, reset, writeLow, writeHigh, decOut1[31] | decOut2[31], ({32{decOut1[31]}} &  writeData32) | ({32{decOut2[31]}} &  writeData16), outR31);


endmodule

//1.Change this decoder from 4to 16 to 5 to 32

module decoder5to32(input [4:0] destReg, output reg [31:0] decOut);
	always @(destReg)
		case(destReg)
			5'd0: decOut=32'b0000_0000_0000_0000_0000_0000_0000_0001;
			5'd1: decOut=32'b0000_0000_0000_0000_0000_0000_0000_0010;
			5'd2: decOut=32'b0000_0000_0000_0000_0000_0000_0000_0100;
			5'd3: decOut=32'b0000_0000_0000_0000_0000_0000_0000_1000;
			5'd4: decOut=32'b0000_0000_0000_0000_0000_0000_0001_0000;
			5'd5: decOut=32'b0000_0000_0000_0000_0000_0000_0010_0000;
			5'd6: decOut=32'b0000_0000_0000_0000_0000_0000_0100_0000;
			5'd7: decOut=32'b0000_0000_0000_0000_0000_0000_1000_0000;
			5'd8: decOut=32'b0000_0000_0000_0000_0000_0001_0000_0000;
			5'd9: decOut=32'b0000_0000_0000_0000_0000_0010_0000_0000;
			5'd10: decOut=32'b0000_0000_0000_0000_0000_0100_0000_0000;
			5'd11: decOut=32'b0000_0000_0000_0000_0000_1000_0000_0000;
		   5'd12: decOut=32'b0000_0000_0000_0000_0001_0000_0000_0000;
			5'd13: decOut=32'b0000_0000_0000_0000_0010_0000_0000_0000;
			5'd14: decOut=32'b0000_0000_0000_0000_0100_0000_0000_0000;
			5'd15: decOut=32'b0000_0000_0000_0000_1000_0000_0000_0000;
			5'd16: decOut=32'b0000_0000_0000_0001_0000_0000_0000_0000;
			5'd17: decOut=32'b0000_0000_0000_0010_0000_0000_0000_0000;
			5'd18: decOut=32'b0000_0000_0000_0100_0000_0000_0000_0000;
			5'd19: decOut=32'b0000_0000_0000_1000_0000_0000_0000_0000;
			5'd20: decOut=32'b0000_0000_0001_0000_0000_0000_0000_0000;
			5'd21: decOut=32'b0000_0000_0010_0000_0000_0000_0000_0000;
			5'd22: decOut=32'b0000_0000_0100_0000_0000_0000_0000_0000;
			5'd23: decOut=32'b0000_0000_1000_0000_0000_0000_0000_0000;
			5'd24: decOut=32'b0000_0001_0000_0000_0000_0000_0000_0000;
			5'd25: decOut=32'b0000_0010_0000_0000_0000_0000_0000_0000;
			5'd26: decOut=32'b0000_0100_0000_0000_0000_0000_0000_0000;
			5'd27: decOut=32'b0000_1000_0000_0000_0000_0000_0000_0000;
		   5'd28: decOut=32'b0001_0000_0000_0000_0000_0000_0000_0000;
			5'd29: decOut=32'b0010_0000_0000_0000_0000_0000_0000_0000;
			5'd30: decOut=32'b0100_0000_0000_0000_0000_0000_0000_0000;
			5'd31: decOut=32'b1000_0000_0000_0000_0000_0000_0000_0000;
		endcase
endmodule

//2. Change this mux from 16to1 to 32to1
module mux32to1(input [31:0] outR0, input [31:0] outR1, input [31:0] outR2, input [31:0] outR3,
	input [31:0] outR4, input [31:0] outR5, input [31:0] outR6, input [31:0] outR7,
	input [31:0] outR8, input [31:0] outR9, input [31:0] outR10, input [31:0] outR11,
	input [31:0] outR12, input [31:0] outR13, input [31:0] outR14, input [31:0] outR15,
	input [31:0] outR16, input [31:0] outR17, input [31:0] outR18, input [31:0] outR19,
	input [31:0] outR20, input [31:0] outR21, input [31:0] outR22, input [31:0] outR23,
	input [31:0] outR24, input [31:0] outR25, input [31:0] outR26, input [31:0] outR27,
	input [31:0] outR28, input [31:0] outR29, input [31:0] outR30, input [31:0] outR31,
	input [4:0] Sel, output reg [31:0] outBus);

	always@(outR0,outR1,outR2,outR3,outR4,outR5,outR6,outR7,outR8,outR9,outR10,outR11,outR12,outR13,outR14,outR15,
	outR16, outR17, outR18,  outR19, outR20,  outR21,  outR22,  outR23, outR24,  outR25,  outR26,  outR27,
	outR28,  outR29,  outR30, outR31,Sel)
		case(Sel)
			5'd0:outBus=outR0;
			5'd1:outBus=outR1;
			5'd2:outBus=outR2;
			5'd3:outBus=outR3;
			5'd4:outBus=outR4;
			5'd5:outBus=outR5;
			5'd6:outBus=outR6;
			5'd7:outBus=outR7;
			5'd8:outBus=outR8;
			5'd9:outBus=outR9;
			5'd10:outBus=outR10;
			5'd11:outBus=outR11;
			5'd12:outBus=outR12;
			5'd13:outBus=outR13;
			5'd14:outBus=outR14;
			5'd15:outBus=outR15;
			5'd16:outBus=outR16;
			5'd17:outBus=outR17;
			5'd18:outBus=outR18;
			5'd19:outBus=outR19;
			5'd20:outBus=outR20;
			5'd21:outBus=outR21;
			5'd22:outBus=outR22;
			5'd23:outBus=outR23;
			5'd24:outBus=outR24;
			5'd25:outBus=outR25;
			5'd26:outBus=outR26;
			5'd27:outBus=outR27;
			5'd28:outBus=outR28;
			5'd29:outBus=outR29;
			5'd30:outBus=outR30;
			5'd31:outBus=outR31;
		endcase
endmodule
//4. Change this very important module
module registerFile(input clk, input reset, input regWrite32, input regWrite16, input [4:0] rs32, input [4:0] rt32,input [4:0] rd32,input [4:0] rd16,
input [4:0] rs16, input [4:0] rt16,input [31:0] writeData32,input [31:0] writeData16,
 output [31:0] rs32Out, output [31:0] rt32Out,output [31:0] rs16Out, output [31:0] rt16Out);
	wire [31:0] decOut1,decOut2;
	wire [31:0] outR0, outR1, outR2, outR3, outR4, outR5, outR6, outR7, outR8, outR9, outR10, outR11, outR12, outR13, outR14, outR15;
	wire [31:0] outR16, outR17, outR18, outR19, outR20, outR21, outR22, outR23, outR24, outR25, outR26, outR27, outR28, outR29, outR30, outR31;

	//3.Change the decoder,registerSet and mux in this file to suit the above modules
	decoder5to32 d1(rd32[4:0],decOut1);
	decoder5to32 d2(rd16[4:0],decOut2);
	registerSet rSet(clk,reset,regWrite32| regWrite16,regWrite32| regWrite16, decOut1,decOut2 ,  writeData32,writeData16,
	outR0,   outR1, outR2,  outR3, outR4,   outR5,  outR6,  outR7, outR8,  outR9,  outR10,  outR11,
	 outR12, outR13,  outR14,  outR15, outR16,  outR17,  outR18,  outR19, outR20,  outR21, outR22,  outR23,
	 outR24, outR25,  outR26,  outR27, outR28, outR29,  outR30,  outR31);
	 mux32to1 m0(outR0,outR1,outR2, outR3,
	 outR4,  outR5,  outR6,  outR7,outR8,  outR9,  outR10,  outR11,outR12,  outR13,  outR14,  outR15,
	 outR16,  outR17,  outR18,  outR19,outR20,  outR21,  outR22,  outR23, outR24,  outR25,  outR26,  outR27,
	 outR28,  outR29,  outR30,  outR31,
	 rs32,  rs32Out);
	 mux32to1 m1(outR0,outR1,outR2, outR3,
	 outR4,  outR5,  outR6,  outR7,outR8,  outR9,  outR10,  outR11,outR12,  outR13,  outR14,  outR15,
	 outR16,  outR17,  outR18,  outR19,outR20,  outR21,  outR22,  outR23, outR24,  outR25,  outR26,  outR27,
	 outR28,  outR29,  outR30,  outR31,
	 rt32,  rt32Out);
	 mux32to1 m2(outR0,outR1,outR2, outR3,
	 outR4,  outR5,  outR6,  outR7,outR8,  outR9,  outR10,  outR11,outR12,  outR13,  outR14,  outR15,
	 outR16,  outR17,  outR18,  outR19,outR20,  outR21,  outR22,  outR23, outR24,  outR25,  outR26,  outR27,
	 outR28,  outR29,  outR30,  outR31,
	 rs16,  rs16Out);
	 mux32to1 m3(outR0,outR1,outR2, outR3,
	 outR4,  outR5,  outR6,  outR7,outR8,  outR9,  outR10,  outR11,outR12,  outR13,  outR14,  outR15,
	 outR16,  outR17,  outR18,  outR19,outR20,  outR21,  outR22,  outR23, outR24,  outR25,  outR26,  outR27,
	 outR28,  outR29,  outR30,  outR31,
	 rt16,  rt16Out);


endmodule


module signExt12to32(input [11:0] in, output reg [31:0] signExtin);
	always@(in)
		signExtin={{20{in[11]}},in};
endmodule

module signExt8to32(input [7:0] in, output reg [31:0] signExtin);
	always@(in)
		signExtin={{24{in[7]}},in};
endmodule

module zeroExt5to32(input [4:0] in, output reg [31:0] zeroExtin);
	always@(in)
		zeroExtin={27'b0,in};
endmodule

module adder32bit(input [31:0] in1, input [31:0] in2, output reg [31:0] adder_out);
	always@(in1 or in2)
	begin
		adder_out = in1 + in2;
	end
endmodule

module ALU(input signed [31:0] aluIn1, input signed [31:0] aluIn2, input [2:0] aluOp, output reg [31:0] aluOut);
	always@(aluIn1 or aluIn2 or aluOp)
	begin
		case(aluOp)
			3'd0: aluOut = aluIn1 + aluIn2;
			3'd1:	aluOut = aluIn1 >> aluIn2;
			3'd2: aluOut = aluIn1 >>> aluIn2;
			3'd3: aluOut = aluIn1 & aluIn2;
		endcase
	end
endmodule

module mux2to1_32bits(input [31:0] in0, input [31:0] in1, input sel, output reg [31:0] muxOut);
    always@(in0, in1, sel)
		begin
			case(sel)
				1'b0: muxOut=in0;
				1'b1: muxOut=in1;
			endcase
		end
endmodule

module mux4to1_32bits(input [31:0] in0, input [31:0] in1, input [31:0] in2, input [31:0] in3, input [1:0] sel, output reg [31:0] muxOut);
    always@(in0, in1, in2, in3, sel)
		begin
			case(sel)
				2'd0: muxOut=in0;
				2'd1: muxOut=in1;
				2'd2: muxOut=in2;
				2'd3: muxOut=in3;
			endcase
		end
endmodule

module D_ff(input clk, input reset, input regWrite, input d, output reg q);
	always@(negedge clk)
		begin
			if(reset)
				q=0;
			else
				if(regWrite == 1) begin q=d; end
		end
endmodule

module register32bit_PC(input clk, input reset, input regWrite, input [31:0] writeData, output  [31:0] outR);
	D_ff d0(clk,reset,regWrite,writeData[0],outR[0]);
	D_ff d1(clk,reset,regWrite,writeData[1],outR[1]);
	D_ff d2(clk,reset,regWrite,writeData[2],outR[2]);
	D_ff d3(clk,reset,regWrite,writeData[3],outR[3]);
	D_ff d4(clk,reset,regWrite,writeData[4],outR[4]);
	D_ff d5(clk,reset,regWrite,writeData[5],outR[5]);
	D_ff d6(clk,reset,regWrite,writeData[6],outR[6]);
	D_ff d7(clk,reset,regWrite,writeData[7],outR[7]);
	D_ff d8(clk,reset,regWrite,writeData[8],outR[8]);
	D_ff d9(clk,reset,regWrite,writeData[9],outR[9]);
	D_ff d10(clk,reset,regWrite,writeData[10],outR[10]);
	D_ff d11(clk,reset,regWrite,writeData[11],outR[11]);
	D_ff d12(clk,reset,regWrite,writeData[12],outR[12]);
	D_ff d13(clk,reset,regWrite,writeData[13],outR[13]);
	D_ff d14(clk,reset,regWrite,writeData[14],outR[14]);
	D_ff d15(clk,reset,regWrite,writeData[15],outR[15]);
	D_ff d16(clk,reset,regWrite,writeData[16],outR[16]);
	D_ff d17(clk,reset,regWrite,writeData[17],outR[17]);
	D_ff d18(clk,reset,regWrite,writeData[18],outR[18]);
	D_ff d19(clk,reset,regWrite,writeData[19],outR[19]);
	D_ff d20(clk,reset,regWrite,writeData[20],outR[20]);
	D_ff d21(clk,reset,regWrite,writeData[21],outR[21]);
	D_ff d22(clk,reset,regWrite,writeData[22],outR[22]);
	D_ff d23(clk,reset,regWrite,writeData[23],outR[23]);
	D_ff d24(clk,reset,regWrite,writeData[24],outR[24]);
	D_ff d25(clk,reset,regWrite,writeData[25],outR[25]);
	D_ff d26(clk,reset,regWrite,writeData[26],outR[26]);
	D_ff d27(clk,reset,regWrite,writeData[27],outR[27]);
	D_ff d28(clk,reset,regWrite,writeData[28],outR[28]);
	D_ff d29(clk,reset,regWrite,writeData[29],outR[29]);
	D_ff d30(clk,reset,regWrite,writeData[30],outR[30]);
	D_ff d31(clk,reset,regWrite,writeData[31],outR[31]);
endmodule

module register_DM(input clk, input reset, input regWrite, input [15:0] d_in, output [15:0] q_out);
	D_ff dIM0 (clk, reset, regWrite, d_in[0], q_out[0]);
	D_ff dIM1 (clk, reset, regWrite, d_in[1], q_out[1]);
	D_ff dIM2 (clk, reset, regWrite, d_in[2], q_out[2]);
	D_ff dIM3 (clk, reset, regWrite, d_in[3], q_out[3]);
	D_ff dIM4 (clk, reset, regWrite, d_in[4], q_out[4]);
	D_ff dIM5 (clk, reset, regWrite, d_in[5], q_out[5]);
	D_ff dIM6 (clk, reset, regWrite, d_in[6], q_out[6]);
	D_ff dIM7 (clk, reset, regWrite, d_in[7], q_out[7]);
	D_ff dIM8 (clk, reset, regWrite, d_in[8], q_out[8]);
	D_ff dIM9 (clk, reset, regWrite, d_in[9], q_out[9]);
	D_ff dIM10 (clk, reset, regWrite, d_in[10], q_out[10]);
	D_ff dIM11 (clk, reset, regWrite, d_in[11], q_out[11]);
	D_ff dIM12 (clk, reset, regWrite, d_in[12], q_out[12]);
	D_ff dIM13 (clk, reset, regWrite, d_in[13], q_out[13]);
	D_ff dIM14 (clk, reset, regWrite, d_in[14], q_out[14]);
	D_ff dIM15 (clk, reset, regWrite, d_in[15], q_out[15]);
endmodule

// make regfileDM
module DM(input clk, input reset, input [31:0] pc_32bits,input [31:0] pc_16bits,
					input DMwrite,input [31:0] writeValue,output [31:0] Mem_32);
	wire [15:0] Qout0, Qout1, Qout2, Qout3, Qout4, Qout5, Qout6, Qout7,
					Qout8, Qout9, Qout10, Qout11, Qout12, Qout13, Qout14, Qout15,
					Qout16, Qout17, Qout18, Qout19, Qout20, Qout21, Qout22, Qout23,
					Qout24, Qout25, Qout26, Qout27, Qout28, Qout29, Qout30, Qout31;
	wire [31:0] decOut;
	decoder5to32 d1(pc_16bits[4:0],decOut);
	register_DM rDM0 (clk, reset,DMwrite & decOut[0], writeValue[15:0], Qout0); // c.addi $1, 1B
	register_DM rDM1 (clk, reset,DMwrite & (decOut[0] | decOut[1]), (({16{decOut[0]}}&writeValue[31:16])|({16{decOut[1]}}&writeValue[15:0])), Qout1); 
	register_DM rDM2 (clk, reset,DMwrite & (decOut[1] | decOut[2]), (({16{decOut[1]}}&writeValue[31:16])|({16{decOut[2]}}&writeValue[15:0])), Qout2);
	register_DM rDM3 (clk, reset,DMwrite & (decOut[2] | decOut[3]), (({16{decOut[2]}}&writeValue[31:16])|({16{decOut[3]}}&writeValue[15:0])), Qout3); 
	register_DM rDM4 (clk, reset,DMwrite & (decOut[3] | decOut[4]), (({16{decOut[3]}}&writeValue[31:16])|({16{decOut[4]}}&writeValue[15:0])), Qout4);
	register_DM rDM5 (clk, reset,DMwrite & (decOut[4] | decOut[5]), (({16{decOut[4]}}&writeValue[31:16])|({16{decOut[5]}}&writeValue[15:0])), Qout5); 
	register_DM rDM6 (clk, reset,DMwrite & (decOut[5] | decOut[6]), (({16{decOut[5]}}&writeValue[31:16])|({16{decOut[6]}}&writeValue[15:0])), Qout6); 
	register_DM rDM7 (clk, reset,DMwrite & (decOut[6] | decOut[7]), (({16{decOut[6]}}&writeValue[31:16])|({16{decOut[7]}}&writeValue[15:0])), Qout7); 
	register_DM rDM8 (clk, reset,DMwrite & (decOut[7] | decOut[8]), (({16{decOut[7]}}&writeValue[31:16])|({16{decOut[8]}}&writeValue[15:0])), Qout8);
	register_DM rDM9 (clk, reset,DMwrite & (decOut[8] | decOut[9]), (({16{decOut[8]}}&writeValue[31:16])|({16{decOut[9]}}&writeValue[15:0])), Qout9); 
	register_DM rDM10 (clk, reset,DMwrite & (decOut[9] | decOut[10]),(({16{decOut[9]}}&writeValue[31:16])|({16{decOut[10]}}&writeValue[15:0])), Qout10);
	register_DM rDM11 (clk, reset,DMwrite & (decOut[10] | decOut[11]),(({16{decOut[10]}}&writeValue[31:16])|({16{decOut[11]}}&writeValue[15:0])), Qout11); 
	register_DM rDM12 (clk, reset,DMwrite & (decOut[11] | decOut[12]),(({16{decOut[11]}}&writeValue[31:16])|({16{decOut[12]}}&writeValue[15:0])), Qout12);
	register_DM rDM13 (clk, reset,DMwrite & (decOut[12] | decOut[13]),(({16{decOut[12]}}&writeValue[31:16])|({16{decOut[13]}}&writeValue[15:0])), Qout13); 
	register_DM rDM14 (clk, reset,DMwrite & (decOut[13] | decOut[14]),(({16{decOut[13]}}&writeValue[31:16])|({16{decOut[14]}}&writeValue[15:0])), Qout14);
	register_DM rDM15 (clk, reset,DMwrite & (decOut[14] | decOut[15]),(({16{decOut[14]}}&writeValue[31:16])|({16{decOut[15]}}&writeValue[15:0])), Qout15);
	register_DM rDM16 (clk, reset,DMwrite & (decOut[15] | decOut[16]),(({16{decOut[15]}}&writeValue[31:16])|({16{decOut[16]}}&writeValue[15:0])), Qout16);
	register_DM rDM17 (clk, reset,DMwrite & (decOut[16] | decOut[17]),(({16{decOut[16]}}&writeValue[31:16])|({16{decOut[17]}}&writeValue[15:0])), Qout17);
	register_DM rDM18 (clk, reset,DMwrite & (decOut[17] | decOut[18]),(({16{decOut[17]}}&writeValue[31:16])|({16{decOut[18]}}&writeValue[15:0])), Qout18);
	register_DM rDM19 (clk, reset,DMwrite & (decOut[18] | decOut[19]),(({16{decOut[18]}}&writeValue[31:16])|({16{decOut[19]}}&writeValue[15:0])), Qout19);
	register_DM rDM20 (clk, reset,DMwrite & (decOut[19] | decOut[20]),(({16{decOut[19]}}&writeValue[31:16])|({16{decOut[20]}}&writeValue[15:0])), Qout20);
	register_DM rDM21 (clk, reset,DMwrite & (decOut[20] | decOut[21]),(({16{decOut[20]}}&writeValue[31:16])|({16{decOut[21]}}&writeValue[15:0])), Qout21);
	register_DM rDM22 (clk, reset,DMwrite & (decOut[21] | decOut[22]),(({16{decOut[21]}}&writeValue[31:16])|({16{decOut[22]}}&writeValue[15:0])), Qout22);
	register_DM rDM23 (clk, reset,DMwrite & (decOut[22] | decOut[23]),(({16{decOut[22]}}&writeValue[31:16])|({16{decOut[23]}}&writeValue[15:0])), Qout23);
	register_DM rDM24 (clk, reset,DMwrite & (decOut[23] | decOut[24]),(({16{decOut[23]}}&writeValue[31:16])|({16{decOut[24]}}&writeValue[15:0])), Qout24);
	register_DM rDM25 (clk, reset,DMwrite & (decOut[24] | decOut[25]),(({16{decOut[24]}}&writeValue[31:16])|({16{decOut[25]}}&writeValue[15:0])), Qout25);
	register_DM rDM26 (clk, reset,DMwrite & (decOut[25] | decOut[26]),(({16{decOut[25]}}&writeValue[31:16])|({16{decOut[26]}}&writeValue[15:0])), Qout26);
	register_DM rDM27 (clk, reset,DMwrite & (decOut[26] | decOut[27]),(({16{decOut[26]}}&writeValue[31:16])|({16{decOut[27]}}&writeValue[15:0])), Qout27);
	register_DM rDM28 (clk, reset,DMwrite & (decOut[27] | decOut[28]),(({16{decOut[27]}}&writeValue[31:16])|({16{decOut[28]}}&writeValue[15:0])), Qout28);
	register_DM rDM29 (clk, reset,DMwrite & (decOut[28] | decOut[29]),(({16{decOut[28]}}&writeValue[31:16])|({16{decOut[29]}}&writeValue[15:0])), Qout29);
	register_DM rDM30 (clk, reset,DMwrite & (decOut[29] | decOut[30]),(({16{decOut[29]}}&writeValue[31:16])|({16{decOut[30]}}&writeValue[15:0])), Qout30);
	register_DM rDM31 (clk, reset,DMwrite & (decOut[30]), (({16{decOut[30]}}&writeValue[31:16])|({16{decOut[31]}}&writeValue[15:0])), Qout31);
	mux32to1_IM_32bits mIM1 (Qout0,Qout1,Qout2,Qout3,Qout4,Qout5,Qout6,Qout7,Qout8,Qout9,Qout10,Qout11,Qout12,Qout13,Qout14,Qout15,
		Qout16,Qout17,Qout18,Qout19,Qout20,Qout21,Qout22,Qout23,Qout24,Qout25,Qout26,Qout27,Qout28,Qout29,Qout30,Qout31,
		pc_32bits[4:0],Mem_32);


endmodule


module register32bit_Pipeline(input clk, input reset, input regWrite, input [31:0] writeData, output  [31:0] outR);
	D_ff d0(clk,reset,regWrite,writeData[0],outR[0]);
	D_ff d1(clk,reset,regWrite,writeData[1],outR[1]);
	D_ff d2(clk,reset,regWrite,writeData[2],outR[2]);
	D_ff d3(clk,reset,regWrite,writeData[3],outR[3]);
	D_ff d4(clk,reset,regWrite,writeData[4],outR[4]);
	D_ff d5(clk,reset,regWrite,writeData[5],outR[5]);
	D_ff d6(clk,reset,regWrite,writeData[6],outR[6]);
	D_ff d7(clk,reset,regWrite,writeData[7],outR[7]);
	D_ff d8(clk,reset,regWrite,writeData[8],outR[8]);
	D_ff d9(clk,reset,regWrite,writeData[9],outR[9]);
	D_ff d10(clk,reset,regWrite,writeData[10],outR[10]);
	D_ff d11(clk,reset,regWrite,writeData[11],outR[11]);
	D_ff d12(clk,reset,regWrite,writeData[12],outR[12]);
	D_ff d13(clk,reset,regWrite,writeData[13],outR[13]);
	D_ff d14(clk,reset,regWrite,writeData[14],outR[14]);
	D_ff d15(clk,reset,regWrite,writeData[15],outR[15]);
	D_ff d16(clk,reset,regWrite,writeData[16],outR[16]);
	D_ff d17(clk,reset,regWrite,writeData[17],outR[17]);
	D_ff d18(clk,reset,regWrite,writeData[18],outR[18]);
	D_ff d19(clk,reset,regWrite,writeData[19],outR[19]);
	D_ff d20(clk,reset,regWrite,writeData[20],outR[20]);
	D_ff d21(clk,reset,regWrite,writeData[21],outR[21]);
	D_ff d22(clk,reset,regWrite,writeData[22],outR[22]);
	D_ff d23(clk,reset,regWrite,writeData[23],outR[23]);
	D_ff d24(clk,reset,regWrite,writeData[24],outR[24]);
	D_ff d25(clk,reset,regWrite,writeData[25],outR[25]);
	D_ff d26(clk,reset,regWrite,writeData[26],outR[26]);
	D_ff d27(clk,reset,regWrite,writeData[27],outR[27]);
	D_ff d28(clk,reset,regWrite,writeData[28],outR[28]);
	D_ff d29(clk,reset,regWrite,writeData[29],outR[29]);
	D_ff d30(clk,reset,regWrite,writeData[30],outR[30]);
	D_ff d31(clk,reset,regWrite,writeData[31],outR[31]);
endmodule

module ctrlCkt(input [6:0] opcode_32, input [2:0] funct3_32,input [1:0] opcode_16,
	output reg [2:0] aluOp,output reg  aluSrcA, output reg [1:0] aluSrcB, output reg [1:0] toReg, output reg regWrite32,output reg regWrite16,
	output reg jump,output reg DMwrite);

	always @ (opcode_32, funct3_32)
		begin
			aluOp = 3'b000;aluSrcA=1'b0; aluSrcB = 2'b00; toReg = 2'b00; regWrite32 = 1'b0;
			if(opcode_32[1:0] == 2'b11)
				begin
					case(opcode_32[6:2])
						// srli or addi or andi
						5'b00100:
							case(funct3_32)
								// srli (funct7 not needed)
								3'b101:
									begin
										aluSrcA=1'b1;
										aluSrcB = 2'b01;
										aluOp = 3'b001;
										toReg = 2'b00;
										regWrite32 = 1'b1;
								//		jump = 1'b1;
								//		DMwrite=1'b0;
									end
								// addi
								3'b000:
									begin
										aluSrcA = 1'b1;
										aluSrcB = 2'b10;
										aluOp = 3'b000;
										toReg = 2'b00;
										regWrite32 = 1'b1;
										//jump = 1'b1;
								//		Dmwrite=1'b0;
									end
								//andi
								3'b110:
									begin
										aluSrcA = 1'b1;
										aluSrcB = 2'b10;
										aluOp = 3'b011;
										toReg = 2'b00;
										regWrite32 = 1'b1;
									//	jump = 1'b1;
								//		Dmwrite=1'b0;
									end
							endcase
						// sra
						5'b01100:
							begin
								aluSrcA = 1'b1;
								aluSrcB = 2'b00;
								aluOp = 3'b010;
								toReg = 2'b00;
								regWrite32 = 1'b1;
								//jump = 1'b1;
								//DMwrite=1'b0;
							end
						// lw
						5'b00000:
							begin
								aluSrcA = 1'b1;
								aluSrcB = 2'b10;
								aluOp = 3'b000;
								toReg = 2'b01;
								regWrite32 = 1'b1;
								//jump = 1'b1;
								//DMwrite=1'b0;
							end
						// AUIPC
						5'b00101:
							begin
								aluSrcA = 1'b0;
								aluSrcB = 2'b11;
								aluOp = 3'b000;
								toReg = 2'b00;
								regWrite32 = 1'b1;
								//jump = 1'b1;
								//DMwrite=1'b0;
							end


					endcase
				end
			end
	always@(opcode_16)
		begin
			regWrite16 =1'b0; jump = 1'b1;DMwrite=1'b0;
			case(opcode_16[1:0])
					// c.mv
					2'b10:
						begin

							regWrite16 = 1'b1;
							jump = 1'b1;
							DMwrite=1'b0;
						end
					// c.bnez
					2'b01:
						begin
							regWrite16 = 1'b0;
							jump = 1'b0;
							DMwrite=1'b0;
						end
					// c.sw
					2'b00:
						begin
							regWrite16 = 1'b0;
							jump = 1'b1;
							DMwrite=1'b1;
						end
			endcase
		end

endmodule

module ForwardingUnit(input WB_RegWrite_32, input MEM_RegWrite_32, input [4:0] MEM_WriteRegister_32,
 input [4:0] WB_WriteRegister_32, input [4:0] EX_rs_32, input [4:0] EX_rt_32, output [1:0] ForwardA_32,
 output [1:0] ForwardB_32, input WB_RegWrite_16, input MEM_RegWrite_16, input [4:0] MEM_WriteRegister_16,
 input [4:0] WB_WriteRegister_16, input [4:0] EX_rs_16, input [4:0] EX_rt_16,
 output [1:0] ForwardA_16, output [1:0] ForwardB_16 );
			wire x_32, b_32, y_32, c_32, x_16, b_16, y_16, c_16;
			wire x_32_t, b_32_t, y_32_t, c_32_t, x_16_t, b_16_t, y_16_t, c_16_t;

			comparator5bit c1(MEM_WriteRegister_32, EX_rs_32,b_32);
			assign x_32 = MEM_RegWrite_32 & b_32;

			comparator5bit c2(WB_WriteRegister_32, EX_rs_32,d_32);
			assign y_32 = WB_RegWrite_32 & d_32;


			comparator5bit c3(MEM_WriteRegister_16, EX_rs_16,b_16);
			assign x_16 = MEM_RegWrite_16 & b_16;

			comparator5bit c4(WB_WriteRegister_16, EX_rs_16,d_16);
			assign y_16 = WB_RegWrite_16 & d_16;



			comparator5bit c5(MEM_WriteRegister_32, EX_rt_32,b_32_t);
			assign x_32_t = MEM_RegWrite_32 & b_32_t;

			comparator5bit c6(WB_WriteRegister_32, EX_rt_32,d_32_t);
			assign y_32_t = WB_RegWrite_32 & d_32_t;


			comparator5bit c7(MEM_WriteRegister_16, EX_rt_16,b_16_t);
			assign x_16_t = MEM_RegWrite_16 & b_16_t;

			comparator5bit c8(WB_WriteRegister_16, EX_rt_16,d_16_t);
			assign y_16_t = WB_RegWrite_16 & d_16_t;

			assign ForwardA_32[1] = x_32;
			assign ForwardA_32[0] = y_32 & ~x_32;
			assign ForwardA_16[1] = x_16;
			assign ForwardA_16[0] = y_16 & ~x_16;


			assign ForwardB_32[1] = x_32_t;
			assign ForwardB_32[0] = y_32_t & ~x_32_t;
			assign ForwardB_16[1] = x_16_t;
			assign ForwardB_16[0] = y_16_t & ~x_16_t;

endmodule

module WB_forward(input [31:0] ReadData1_32, input [31:0] ReadData2_32, input [4:0] rs_32,input [4:0] rt_32,input [4:0] WriteRegister_32,
 input [31:0] WriteData_32, input RegWrite_32, output [31:0] ReadData1Out_32, output [31:0] ReadData2Out_32,
 input [31:0] ReadData1_16, input [31:0] ReadData2_16, input [4:0] rs_16,input [4:0] rt_16,input [4:0] WriteRegister_16, input [31:0] WriteData_16,
 input RegWrite_16, output [31:0] ReadData1Out_16, output [31:0] ReadData2Out_16);
reg ReadSourceRs_32,ReadSourceRt_32,ReadSourceRs_16,ReadSourceRt_16;
always @(rs_32 | rt_32 | WriteRegister_32 | WriteData_32 | RegWrite_32)
begin
 if ((RegWrite_32 == 1)&&(WriteRegister_32 != 0)&&(WriteRegister_32==rs_32))
  ReadSourceRs_32 = 1'b1; //Forwarding WriteData to ReadData1
  else
  ReadSourceRs_32 = 1'b0;
  if ((RegWrite_32==1)&&(WriteRegister_32 != 0)&&(WriteRegister_32==rt_32))
  ReadSourceRt_32 = 1'b1; //Forwarding WriteData to ReadData2
  else
  ReadSourceRt_32 = 1'b0;
end

mux2to1_32bits m1( ReadData1_32,WriteData_32, ReadSourceRs_32,ReadData1Out_32);
mux2to1_32bits m2( ReadData2_32,WriteData_32, ReadSourceRt_32,ReadData2Out_32);

always @(rs_16 | rt_16 | WriteRegister_16 | WriteData_16 | RegWrite_16)
begin
 if ((RegWrite_16 == 1)&&(WriteRegister_16 != 0)&&(WriteRegister_16==rs_16))
  ReadSourceRs_16 = 1'b1; //Forwarding WriteData to ReadData1
  else
  ReadSourceRs_16 = 1'b0;
  if ((RegWrite_16==1)&&(WriteRegister_16 != 0)&&(WriteRegister_16==rt_16))
  ReadSourceRt_16 = 1'b1; //Forwarding WriteData to ReadData2
  else
  ReadSourceRt_16 = 1'b0;
end

mux2to1_32bits m3( ReadData1_16,WriteData_16, ReadSourceRs_16,ReadData1Out_16);
mux2to1_32bits m4( ReadData2_16,WriteData_16, ReadSourceRt_16,ReadData2Out_16);

endmodule



module StallControl(input EX_MemRead, input [4:0] EX_rd, input [4:0] ID_rs, input [4:0] ID_rt,input [6:0] ID_Op,
 output reg PC_WriteEn, output reg IFID_WriteEn,output reg Stall_flush);
always@ (EX_MemRead | EX_rd | ID_rs | ID_rt)
begin
 if ((EX_MemRead==1)&&((EX_rd==ID_rs)||(EX_rd==ID_rt))&&(ID_Op!= 7'b0000011))
  begin
  PC_WriteEn=1'b0;
  IFID_WriteEn=1'b0;
  Stall_flush =1'b1;
  end
  else
  begin
  PC_WriteEn=1'b1;
  IFID_WriteEn=1'b1;
  Stall_flush =1'b0;
  end
end
endmodule


module flush_IF(input [31:0] pc, input [31:0] IR_32, input [15:0] IR_16, input flush,
					output [31:0] IF_pc, output [31:0] IF_IR_32, output [31:0] IF_IR_16);
	wire notflush;
	assign notflush = ~flush;
	assign IF_pc = pc & {32{~flush}};
	assign IF_IR_32 = IR_32 & {32{~flush}};
	assign IF_IR_16 = IR_16 & {32{~flush}};

endmodule


module flush_ID(input DMwrite,input toReg, input [31:0] pc,input AluSrcA,input [2:0] AluOp,input [1:0] AluSrcB,
					input RegWrite_16,input RegWrite_32,input [31:0] regRs_32,input [31:0] regRt_32,input [31:0] regRs_16,
					input [31:0] regRt_16,input [31:0] concat_16,input [31:0] shamt,input [31:0] concat_32,
					input [31:0] sext,input [31:0] regRd_32,input [31:0] regRd_16, input flush,
					output ID_DMwrite,output ID_toReg, output [31:0] ID_pc,output ID_AluSrcA,output [2:0] ID_AluOp,
					output [1:0] ID_AluSrcB, output ID_RegWrite_16,output ID_RegWrite_32,
					output [31:0] ID_regRs_32,output [31:0] ID_regRt_32,output [31:0] ID_regRs_16,
					output [31:0] ID_regRt_16,output [31:0] ID_concat_16,output [31:0] ID_shamt,output [31:0] ID_concat_32,
					output [31:0] ID_sext,output [31:0] ID_regRd_32,output [31:0] ID_regRd_16);
	wire notflush;
	assign notflush = ~flush;
	assign ID_DMwrite = DMwrite & ~flush;
	assign ID_toReg = toReg & ~flush;
	assign ID_pc = pc & {32{~flush}};
	assign ID_RegWrite_32 = RegWrite_32 & ~flush;
	assign ID_AluSrcA = AluSrcA & ~flush;
	assign ID_AluOp = AluOp & {3{~flush}};
	assign ID_AluSrcB = AluSrcB & {2{~flush}};
	assign ID_RegWrite_16 = RegWrite_16 & ~flush;
	assign ID_regRs_32 = regRs_32 & {32{~flush}};
	assign ID_regRs_16 = regRs_16 & {32{~flush}};
	assign ID_regRt_32 = regRt_32 & {32{~flush}};
	assign ID_regRt_16 = regRt_16 & {32{~flush}};
	assign ID_concat_16 = concat_16 & {32{~flush}};
	assign ID_shamt = shamt & {32{~flush}};
	assign ID_concat_32 = concat_32 & {32{~flush}};
	assign ID_regRd_32 = regRd_32 & {32{~flush}};
	assign ID_regRd_16 = regRd_16 & {32{~flush}};
	assign ID_sext = sext & {32{~flush}};

endmodule


//For branch instruction
module comparator32bit(input [31:0] in1,input [31:0] in2,output reg val);
always@(in1,in2)
begin
	if(in1==in2)
		begin
		val=1'b1;
	end
	else
		begin
		val=1'b0;
	end
end

endmodule

module comparator5bit(input [4:0] in1,input [4:0] in2,output reg val);
always@(in1,in2)
begin
	if(in1==in2)
		begin
		val=1'b1;
	end
	else
		begin
		val=1'b0;
	end
end

endmodule



module ProjectName(input clk,input reset);
	wire pcWrite;
	wire [31:0] pc_in,pc_out,updated_PC,pc_trans;
	wire [31:0] IR_32bits;
	wire [15:0] IR_16bits;
	wire [31:0] jump_addr;
	wire flag,jump,IFIDwrite;
	// IF requirements met
	wire [31:0] ID_pc,IR32bits_ID,IR16bits_ID;
	wire regWrite32,regWrite16;
	//assign regWrite32=1'b1;
	//assign regWrite16=1'b1;
	wire [4:0] rd32,rd16,rs32,rs16,rt32;
	reg [4:0] rt16;
	wire [31:0] writeData32,writeData16;
	wire [31:0] rs32Out,rt32Out,rt16Out,rs16Out;
	wire [2:0] aluOp;
	wire aluSrcA,DMwrite;
	wire [1:0] aluSrcB, toReg;
	wire [31:0] shamt,signExt32,concat32,concat16,sext16bnez;
	wire IDEXwrite;
	wire [31:0] EX_pc,EX_DMwrite,EX_toReg,EX_regWrite32,EX_AluSrcA,EX_AluOp,EX_AluSrcB,EX_regWrite16,EX_regrs1;
	wire [31:0] EX_regrt1,EX_regrs2,EX_regrt2,EX_concat16,EX_shamt,EX_sext,EX_concat32,EX_rd32,EX_rd16,EX_rs32,EX_rt32,EX_rs16,EX_rt16;
	wire EXMEMwrite;
	wire [31:0] MEM_DMwrite,MEM_toReg,MEM_regWrite32,MEM_regWrite16;
	wire [31:0] MEM_rd32,MEM_rd16,MEM_AluOut,MEM_AdderOut;
	//IF cycle
	assign IFIDwrite=1'b1;
	
	wire [31:0] IF_pc,IF_IR_32, IF_IR_16;
	wire flush;

	flush_IF fl(updated_PC, IR_32bits, IR_16bits, flush,
						IF_pc,IF_IR_32, IF_IR_16);

	register32bit_PC PC(clk,reset,pcWrite,pc_in, pc_out);
	IM instruction_memory(clk,reset,pc_out[4:0],IR_32bits,IR_16bits);
	adder32bit adder_PC(pc_out, 32'd3,updated_PC);
	mux2to1_32bits mux1(updated_PC, jump_addr, flag1,pc_trans );
	mux2to1_32bits mux2(pc_trans, updated_PC, jump, pc_in);


	register32bit_Pipeline IFIDpcreg(clk,reset,IFIDwrite, IF_pc, ID_pc);
	register32bit_Pipeline IFIDIR32reg(clk,reset,IFIDwrite, IF_IR_32,IR32bits_ID);
	register32bit_Pipeline IFIDIR16reg(clk,reset,IFIDwrite, {16'b0,IF_IR_16},IR16bits_ID);



	//ID cycle
	always@(IR16bits_ID,rt16)
	begin
	if(IR16bits_ID[1:0]==2'b00)
	begin
	rt16={2'b0,IR16bits_ID[4:2]};
	end
	else
	begin
	rt16=IR16bits_ID[6:2];
	end
	end
	registerFile regfile(clk, reset, WB_regWrite32[0], WB_regWrite16[0], IR32bits_ID[19:15], IR32bits_ID[24:20], WB_rd32[4:0],WB_rd16[4:0],
	{2'b0,IR16bits_ID[9:7]}, rt16,writeData32,writeData16,
	rs32Out, rt32Out, rs16Out, rt16Out);
	assign rd32=IR32bits_ID[11:7];
	assign rd16=IR16bits_ID[11:7];
	assign rs32=IR32bits_ID[19:15];
	assign rt32=IR32bits_ID[24:20];
	assign rs16={2'b0,IR16bits_ID[9:7]};
	wire [31:0] ReadData1Out_32,ReadData2Out_32, ReadData1Out_16,ReadData2Out_16;
	WB_forward wbforward(rs32Out, rt32Out, rs32,rt32,WB_rd32[4:0],
								writeData32, WB_regWrite32[0], ReadData1Out_32, ReadData2Out_32,
								rs16Out, rt16Out, rs16,rt16,WB_rd16[4:0], writeData16,
								WB_regWrite16[0], ReadData1Out_16, ReadData2Out_16);


	ctrlCkt cntrl(IR32bits_ID[6:0], IR32bits_ID[14:12],IR16bits_ID[1:0],
	aluOp,aluSrcA, aluSrcB, toReg,
	regWrite32,regWrite16,
	jump,DMwrite);

	zeroExt5to32 zext(IR32bits_ID[24:20], shamt);
	signExt12to32 sext1(IR32bits_ID[31:20], signExt32);
	signExt8to32 sext2({IR16bits_ID[12],IR16bits_ID[6:5],IR16bits_ID[2],IR16bits_ID[11:10],IR16bits_ID[4:3]}, sext16bnez);
	assign concat32={IR32bits_ID[31:12],12'd0};
	assign concat16={25'd0,IR16bits_ID[5],IR16bits_ID[12:10],IR16bits_ID[6],2'b0};
	wire flag1;
	adder32bit adder_branch(ID_pc, sext16bnez,jump_addr);
	comparator32bit comp32(ReadData1Out_16,32'b0,flag1);
	assign flag=~flag1;
	//wire [31:0] EX_pc,EX_DMwrite,EX_toReg,EX_regWrite32,Ex_AluSrcA,EX_AluOp,EX_AluSrcB,EX_regWrite16,EX_regrs1;
	//wire [31:0] EX_regrt1,EX_regrs2,EX_regrt2,EX_concat16,EX_shamt,EX_sext,EX_concat32,EX_rd32,EX_rd16;
	wire flush2;
	StallControl sc(EX_toReg, EX_rd32[4:0], rs32, rt32,IR32bits_ID[6:0],
	 pcWrite, IDEXwrite,flush2);
	assign flush=flush2|((~jump)&flag1);
	 wire ID_DMwrite,ID_toReg,ID_AluSrcA,ID_RegWrite_16,ID_RegWrite_32;
    wire [31:0] FlID_pc;
    wire [2:0] ID_AluOp;
   wire [1:0] ID_AluSrcB;  
    wire [31:0] ID_regRs_32,ID_regRt_32,ID_regRs_16,ID_regRt_16,ID_concat_16;
    wire [31:0] ID_shamt,ID_concat_32,ID_sext,ID_regRd_32,ID_regRd_16;
 
	 flush_ID flid(DMwrite,toReg, ID_pc,aluSrcA,aluOp,aluSrcB,
	 					regWrite16,regWrite32,ReadData1Out_32,ReadData2Out_32,ReadData1Out_16,
	 					ReadData2Out_16,concat16,shamt,concat32,
	 					signExt32,{27'd0,rd32},{27'd0,rd16}, flush,
	 					ID_DMwrite,ID_toReg, FlID_pc,ID_AluSrcA,ID_AluOp,
	 					ID_AluSrcB,ID_RegWrite_16,ID_RegWrite_32,
	 					ID_regRs_32,ID_regRt_32,ID_regRs_16,
	 					ID_regRt_16,ID_concat_16,ID_shamt, ID_concat_32,
	 					ID_sext,ID_regRd_32,ID_regRd_16);

	//assign IDEXwrite=IFID_WriteEn;
	register32bit_Pipeline IDEXpcreg(clk,reset,IDEXwrite, FlID_pc, EX_pc);
	register32bit_Pipeline IDEXDMwrite(clk,reset,IDEXwrite, {31'd0,ID_DMwrite},EX_DMwrite);
	register32bit_Pipeline IDEXtoReg(clk,reset,IDEXwrite,{30'd0,ID_toReg},EX_toReg);
	register32bit_Pipeline IDEXregWrite32(clk,reset,IDEXwrite,{31'd0,ID_RegWrite_32},EX_regWrite32);
	register32bit_Pipeline IDEXregWrite16(clk,reset,IDEXwrite,{31'd0,ID_RegWrite_16},EX_regWrite16);

	register32bit_Pipeline IDEXALUSrcA(clk,reset,IDEXwrite,{31'd0,ID_AluSrcA},EX_AluSrcA);
	register32bit_Pipeline IDEXAluOp(clk,reset,IDEXwrite,{29'd0,ID_AluOp},EX_AluOp);
	register32bit_Pipeline IDEXALUSrcB(clk,reset,IDEXwrite,{30'd0,ID_AluSrcB},EX_AluSrcB);

	register32bit_Pipeline IDEXregrs1(clk,reset,IDEXwrite,ID_regRs_32,EX_regrs1);
	register32bit_Pipeline IDEXregrt1(clk,reset,IDEXwrite,ID_regRt_32,EX_regrt1);
	register32bit_Pipeline IDEXregrt2(clk,reset,IDEXwrite,ID_regRt_16,EX_regrt2);
	register32bit_Pipeline IDEXregrs2(clk,reset,IDEXwrite,ID_regRs_16,EX_regrs2);

	register32bit_Pipeline IDEXconcat16(clk,reset,IDEXwrite,ID_concat_16,EX_concat16);
	register32bit_Pipeline IDEXshamt(clk,reset,IDEXwrite,ID_shamt,EX_shamt);
	register32bit_Pipeline IDEXsext(clk,reset,IDEXwrite,ID_sext,EX_sext);
	register32bit_Pipeline IDEXconcat32(clk,reset,IDEXwrite,ID_concat_32,EX_concat32);


	register32bit_Pipeline IDEXRD32(clk,reset,IDEXwrite,ID_regRd_32,EX_rd32);
	register32bit_Pipeline IDEXRD16(clk,reset,IDEXwrite,ID_regRd_16,EX_rd16);
	register32bit_Pipeline IDEXRS32(clk,reset,IDEXwrite,{27'd0,rs32},EX_rs32);
	register32bit_Pipeline IDEXRS16(clk,reset,IDEXwrite,{27'd0,rs16},EX_rs16);
	register32bit_Pipeline IDEXRT32(clk,reset,IDEXwrite,{27'd0,rt32},EX_rt32);
	register32bit_Pipeline IDEXRT16(clk,reset,IDEXwrite,{27'd0,rt16},EX_rt16);



	//EX cycle
	wire [31:0] MEM_regrt2,mux3Input,mux4Input,Adder32Input,EX_regrt2_for;
	wire [31:0] AluAInput,AluBInput;
	wire [31:0] AluOut,AdderOut;
	mux2to1_32bits mux3(EX_pc, mux3Input, EX_AluSrcA[0],AluAInput );
	mux4to1_32bits mux4(mux4Input, EX_shamt, EX_sext, EX_concat32, EX_AluSrcB[1:0], AluBInput);
	ALU alu(AluAInput, AluBInput, EX_AluOp[2:0],AluOut);
	adder32bit adder_EX( Adder32Input, EX_concat16,AdderOut);
	wire [1:0] ForwardA_32,ForwardB_32,ForwardA_16,ForwardB_16;



	ForwardingUnit forward(WB_regWrite32[0],MEM_regWrite32[0], MEM_rd32[4:0],
						WB_rd32[4:0], EX_rs32[4:0],EX_rt32[4:0],  ForwardA_32,
						ForwardB_32, WB_regWrite16[0], MEM_regWrite16[0], MEM_rd16[4:0],
						WB_rd16[4:0], EX_rs16, EX_rt16,
						ForwardA_16, ForwardB_16 );


	mux4to1_32bits mux5(EX_regrs1, writeData32, MEM_AluOut, 32'b0, ForwardA_32, mux3Input);
	mux4to1_32bits mux6(EX_regrt1, writeData32, MEM_AluOut, 32'b0, ForwardB_32, mux4Input);
	mux4to1_32bits mux7(EX_regrs2, writeData16, MEM_regrt2, 32'b0, ForwardA_16, Adder32Input);
	mux4to1_32bits mux8(EX_regrt2, writeData16, MEM_regrt2, 32'b0, ForwardB_16, EX_regrt2_for);



	//EX pipeline

	assign EXMEMwrite=1'b1;
	register32bit_Pipeline EXMEMDMwrite(clk,reset,EXMEMwrite, EX_DMwrite,MEM_DMwrite);
	register32bit_Pipeline EXMEMtoReg(clk,reset,EXMEMwrite,EX_toReg,MEM_toReg);
	register32bit_Pipeline EXMEMregWrite32(clk,reset,EXMEMwrite,EX_regWrite32,MEM_regWrite32);
	register32bit_Pipeline EXMEMregWrite16(clk,reset,EXMEMwrite,EX_regWrite16,MEM_regWrite16);
	register32bit_Pipeline EXMEMregrt2(clk,reset,EXMEMwrite,EX_regrt2_for,MEM_regrt2);
	register32bit_Pipeline EXMEMRD32(clk,reset,EXMEMwrite,EX_rd32,MEM_rd32);
	register32bit_Pipeline EXMEMRD16(clk,reset,EXMEMwrite,EX_rd16,MEM_rd16);
	register32bit_Pipeline EXMEMRALUOUT(clk,reset,EXMEMwrite,AluOut,MEM_AluOut);
	register32bit_Pipeline EXMEMADDEROUT(clk,reset,EXMEMwrite,AdderOut,MEM_AdderOut);

	//MEM cycle

	 //MAke DM according to cache and change accordingly.
	 wire [31:0] Mem_32;
	 DM DataMem(clk,reset,MEM_AluOut,MEM_AdderOut,
					MEM_DMwrite[0],MEM_regrt2,Mem_32);
	wire MEMWBwrite;
	assign MEMWBwrite=1'b1;
	wire [31:0] WB_toReg,WB_regWrite32,WB_regWrite16;
	wire [31:0] WB_regrt2,WB_rd32,WB_rd16,WB_AluOut,WB_Mem_32;
	register32bit_Pipeline MEMWBtoReg(clk,reset,MEMWBwrite,MEM_toReg,WB_toReg);
	register32bit_Pipeline MEMWBregWrite32(clk,reset,MEMWBwrite,MEM_regWrite32,WB_regWrite32);
	register32bit_Pipeline MEMWBregWrite16(clk,reset,MEMWBwrite,MEM_regWrite16,WB_regWrite16);
	register32bit_Pipeline MEMWBregrt2(clk,reset,MEMWBwrite,MEM_regrt2,WB_regrt2);
	register32bit_Pipeline MEMWBRD32(clk,reset,MEMWBwrite,MEM_rd32,WB_rd32);
	register32bit_Pipeline MEMWBRD16(clk,reset,MEMWBwrite,MEM_rd16,WB_rd16);
	register32bit_Pipeline MEMWBRALUOUT(clk,reset,MEMWBwrite,MEM_AluOut,WB_AluOut);
	register32bit_Pipeline MEMWBRMEMORY(clk,reset,MEMWBwrite,Mem_32,WB_Mem_32);

	//WB cycle
	mux2to1_32bits mux9(WB_AluOut, WB_Mem_32, WB_toReg[0],writeData32 );
	assign writeData16=WB_regrt2;

endmodule

module testbench;
	reg clk;
	reg reset;
	ProjectName pn(clk,reset);

	always
	#5 clk=~clk;
 
	initial
	begin
		clk=0; reset=1;
		#5  reset=0;
		#160 $finish;
	end
endmodule
