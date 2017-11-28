module TopLevel(input clk, input reset,input[31:0] PA, input[127:0] MemoryBlock, input[31:0] CPUOut, input MemRead, input MemWrite, output hit, output halthit0,
                  output halthit1, output halthit2, output halthit3,output[63:0] cacheData);

//Offset = PA[3:0]
//Index = PA[7:4]
//Halt tag = PA[11:8]
//Main tag = PA[31:12]

wire[1:0] wayIndex;
wire[3:0] wayIndexDecoderOut;//Selecting 1 our of 4 ways.
wire[15:0] setDecoderOut; //Selecting one out of 16 sets.
wire[3:0] offsetDecoderOut;//Selecting 1 out of 16 bytes in a block.
wire[1:0] placeOrReplaceIndex;//Index of Block to be placed or replaced.
wire[1:0] hitIndex;
wire[127:0] writeData; //Data to be written in cache block.
wire MemAccess; //Mem Access is 1 when either Memwrite or Memread is 1.
wire haltMainValidWrite; // Control Signal for writing in the halt, main and valid array when there is a miss.
wire[15:0] dataWrite; //To write in the Data Array

wire[63:0] haltArray0, haltArray1, haltArray2, haltArray3;  //Output of halt arrays of each way
          
wire[319:0] TagArray0, TagArray1, TagArray2, TagArray3;//Output of main arrays of each way

wire[127:0] dataArray0, dataArray1, dataArray2, dataArray3;//Output of data arrays of each way

wire[127:0] way0dataBlock0, way0dataBlock1, way0dataBlock2, way0dataBlock3, way0dataBlock4, way0dataBlock5, way0dataBlock6, way0dataBlock7, way0dataBlock8, way0dataBlock9, way0dataBlock10, way0dataBlock11, way0dataBlock12, way0dataBlock13, way0dataBlock14, way0dataBlock15, 
			way1dataBlock0, way1dataBlock1, way1dataBlock2, way1dataBlock3, way1dataBlock4, way1dataBlock5, way1dataBlock6, way1dataBlock7, way1dataBlock8, way1dataBlock9, way1dataBlock10, way1dataBlock11, way1dataBlock12, way1dataBlock13, way1dataBlock14, way1dataBlock15, 
			way2dataBlock0, way2dataBlock1, way2dataBlock2, way2dataBlock3, way2dataBlock4, way2dataBlock5, way2dataBlock6, way2dataBlock7, way2dataBlock8, way2dataBlock9, way2dataBlock10, way2dataBlock11, way2dataBlock12, way2dataBlock13, way2dataBlock14, way2dataBlock15, 
			way3dataBlock0, way3dataBlock1, way3dataBlock2, way3dataBlock3, way3dataBlock4, way3dataBlock5, way3dataBlock6, way3dataBlock7, way3dataBlock8, way3dataBlock9, way3dataBlock10, way3dataBlock11, way3dataBlock12, way3dataBlock13, way3dataBlock14, way3dataBlock15; 
			//Data blocks. 64 blocks, 16 in each way, total 4 ways.
            
wire[15:0] validArray0, validArray1, validArray2, validArray3;//Output of valid bits of each way

wire[1:0] outIndex0,outIndex1,outIndex2,outIndex3,outIndex4,outIndex5,outIndex6,outIndex7, outIndex8, outIndex9,outIndex10, outIndex11, outIndex12,outIndex13, outIndex14, outIndex15 ;
wire miss;

not(miss, hit);

or(MemAccess, MemRead, MemWrite);   //Given to replacement circuits so that counters are only incremented
                              //during a memory operation

and(haltMainValidWrite, MemAccess, miss); //Write into halt/main/valid arrays on miss and (MemRead or MemWrite)


           
decoder2to4 wayDecoder(wayIndex, wayIndexDecoderOut);                
decoder4to16 setDecoder(PA[7:4], setDecoderOut);
decoder2to4 offsetDecoder(PA[3:2], offsetDecoderOut);//used for writing in the cache line of 16Bytes.

//If hit, then use hit index for decoding (in case of write hit) 
//Otherwise use way index from corresponding replacement circuit

mux2to1_2bit wayDecoderInputMux( placeOrReplaceIndex, hitIndex, hit, wayIndex);


 //Need to multiplex the PlaceOrReplaceIndex of all 16 sets using index as selector
 
PlacementAndReplacementCircuit par0(clk, reset, setDecoderOut[0], hit, hitIndex, validArray0[0],   validArray1[0] , validArray2[0] , validArray3[0] , MemAccess, outIndex0);
PlacementAndReplacementCircuit par1(clk, reset, setDecoderOut[1], hit, hitIndex, validArray0[1],   validArray1[1] , validArray2[1] , validArray3[1] , MemAccess, outIndex1);
PlacementAndReplacementCircuit par2(clk, reset, setDecoderOut[2], hit, hitIndex, validArray0[2],   validArray1[2] , validArray2[2] , validArray3[2] , MemAccess, outIndex2);
PlacementAndReplacementCircuit par3(clk, reset, setDecoderOut[3], hit, hitIndex, validArray0[3],   validArray1[3] , validArray2[3] , validArray3[3] , MemAccess, outIndex3);
PlacementAndReplacementCircuit par4(clk, reset, setDecoderOut[4], hit, hitIndex, validArray0[4],   validArray1[4] , validArray2[4] , validArray3[4] , MemAccess, outIndex4);
PlacementAndReplacementCircuit par5(clk, reset, setDecoderOut[5], hit, hitIndex, validArray0[5],   validArray1[5] , validArray2[5] , validArray3[5] , MemAccess, outIndex5);
PlacementAndReplacementCircuit par6(clk, reset, setDecoderOut[6], hit, hitIndex, validArray0[6],   validArray1[6] , validArray2[6] , validArray3[6] , MemAccess, outIndex6);
PlacementAndReplacementCircuit par7(clk, reset, setDecoderOut[7], hit, hitIndex, validArray0[7],   validArray1[7] , validArray2[7] , validArray3[7] , MemAccess, outIndex7);
PlacementAndReplacementCircuit par8(clk, reset, setDecoderOut[8], hit, hitIndex, validArray0[8],   validArray1[8] , validArray2[8] , validArray3[8] , MemAccess, outIndex8);
PlacementAndReplacementCircuit par9(clk, reset, setDecoderOut[9], hit, hitIndex, validArray0[9],   validArray1[9] , validArray2[9] , validArray3[9] , MemAccess, outIndex9);
PlacementAndReplacementCircuit par10(clk, reset, setDecoderOut[10], hit, hitIndex, validArray0[10], validArray1[10], validArray2[10], validArray3[10], MemAccess, outIndex10);
PlacementAndReplacementCircuit par11(clk, reset, setDecoderOut[11], hit, hitIndex, validArray0[11], validArray1[11], validArray2[11], validArray3[11], MemAccess, outIndex11);
PlacementAndReplacementCircuit par12(clk, reset, setDecoderOut[12], hit, hitIndex, validArray0[12], validArray1[12], validArray2[12], validArray3[12], MemAccess, outIndex12);
PlacementAndReplacementCircuit par13(clk, reset, setDecoderOut[13], hit, hitIndex, validArray0[13], validArray1[13], validArray2[13], validArray3[13], MemAccess, outIndex13);
PlacementAndReplacementCircuit par14(clk, reset, setDecoderOut[14], hit, hitIndex, validArray0[14], validArray1[14], validArray2[14], validArray3[14], MemAccess, outIndex14);
PlacementAndReplacementCircuit par15(clk, reset, setDecoderOut[15], hit, hitIndex, validArray0[15], validArray1[15], validArray2[15], validArray3[15], MemAccess, outIndex15);


mux16to1_2bit PlacementAndReplacementMux(outIndex0, outIndex1,outIndex2, outIndex3,outIndex4, outIndex5, outIndex6, outIndex7,outIndex8, outIndex9,
outIndex10, outIndex11,outIndex12, outIndex13,outIndex14, outIndex15,PA[7:4], placeOrReplaceIndex);

Halt_Tag_Array halt_way0(clk, reset, setDecoderOut, wayIndexDecoderOut[0],PA[11:8], haltMainValidWrite, haltArray0);
Halt_Tag_Array halt_way1(clk, reset, setDecoderOut, wayIndexDecoderOut[1],PA[11:8], haltMainValidWrite, haltArray1);
Halt_Tag_Array halt_way2(clk, reset, setDecoderOut, wayIndexDecoderOut[2],PA[11:8], haltMainValidWrite, haltArray2);
Halt_Tag_Array halt_way3(clk, reset, setDecoderOut, wayIndexDecoderOut[3],PA[11:8], haltMainValidWrite, haltArray3);
                                            
Main_Tag_Array mainTag_way0(clk, reset, setDecoderOut, wayIndexDecoderOut[0],PA[31:12], haltMainValidWrite, TagArray0 );
Main_Tag_Array mainTag_way1(clk, reset, setDecoderOut, wayIndexDecoderOut[1],PA[31:12], haltMainValidWrite, TagArray1 );
Main_Tag_Array mainTag_way2(clk, reset, setDecoderOut, wayIndexDecoderOut[2],PA[31:12], haltMainValidWrite, TagArray2 );
Main_Tag_Array mainTag_way3(clk, reset, setDecoderOut, wayIndexDecoderOut[3],PA[31:12], haltMainValidWrite, TagArray3 );
                      
Valid_Array valid_way0(clk, reset, setDecoderOut, wayIndexDecoderOut[0],1'b1, haltMainValidWrite, validArray0 );
Valid_Array valid_way1(clk, reset, setDecoderOut, wayIndexDecoderOut[1],1'b1, haltMainValidWrite, validArray1 );
Valid_Array valid_way2(clk, reset, setDecoderOut, wayIndexDecoderOut[2],1'b1, haltMainValidWrite, validArray2 );
Valid_Array valid_way3(clk, reset, setDecoderOut, wayIndexDecoderOut[3],1'b1, haltMainValidWrite, validArray3 );
                       

 
 //Halt tag checking. 
Halt_Tag_Array_Comparator HC_Way0(haltArray0, PA[11:8], halthit0);   
Halt_Tag_Array_Comparator HC_Way1(haltArray1, PA[11:8], halthit1);   
Halt_Tag_Array_Comparator HC_Way2(haltArray2, PA[11:8], halthit2);   
Halt_Tag_Array_Comparator HC_Way3(haltArray3, PA[11:8], halthit3);    
                                

                                
//Main tag fetching
wire[19:0] main0, main1, main2, main3;     //Main tags of each way



mux16to1_20bit_halting way0_mainmux(TagArray0, PA[7:4], halthit0, main0);//IF halthit of any mux is 0 then return 0. Analogous to saving energy.
mux16to1_20bit_halting way1_mainmux(TagArray1, PA[7:4], halthit1, main1);
mux16to1_20bit_halting way2_mainmux(TagArray2, PA[7:4], halthit2, main2);
mux16to1_20bit_halting way3_mainmux(TagArray3, PA[7:4], halthit3, main3);
              
                                                                                                                                                     
                        
//Valid bit fetching
wire valid0, valid1, valid2, valid3;

mux16to1_1bit_halting way0_validmux(validArray0, PA[7:4], halthit0, valid0);//IF halthit of any mux is 0 then return 0. Analogous to saving energy.
mux16to1_1bit_halting way1_validmux(validArray1, PA[7:4], halthit1, valid1);
mux16to1_1bit_halting way2_validmux(validArray2, PA[7:4], halthit2, valid2);
mux16to1_1bit_halting way3_validmux(validArray3, PA[7:4], halthit3, valid3);

//Checking if any main tag matched out of 4.
wire mainhit0, mainhit1, mainhit2, mainhit3;

Main_Tag_Comparator way0_maincomp(main0, PA[31:12], halthit0, mainhit0);
Main_Tag_Comparator way1_maincomp(main1, PA[31:12], halthit1, mainhit1);
Main_Tag_Comparator way2_maincomp(main2, PA[31:12], halthit2, mainhit2);
Main_Tag_Comparator way3_maincomp(main3, PA[31:12], halthit3, mainhit3);
                                    
//Hit_i only if the block_i is valid and the Main_tag_i matched.
wire hit0, hit1, hit2, hit3;

and (hit0, mainhit0, valid0);
and (hit1, mainhit1, valid1);
and (hit2, mainhit2, valid2);
and (hit3, mainhit3, valid3);   

wire anyHit;
//If any hit.
or(anyHit, hit0, hit1, hit2, hit3);
//Hit only during memory access. Otherwise no point of hit.

		and(hit, anyHit, MemAccess);      

//Find index where hit came from, if there was one.
encoder4to2 hitIndexCalculator({hit3, hit2, hit1, hit0}, hitIndex);
                     


wire[3:0] writeTo4Bytes;   //Finding which byte to write in the block.

and(writeTo4Bytes[0], offsetDecoderOut[0], MemWrite);
and(writeTo4Bytes[1], offsetDecoderOut[1], MemWrite);
and(writeTo4Bytes[2], offsetDecoderOut[2], MemWrite);
and(writeTo4Bytes[3], offsetDecoderOut[3], MemWrite);

//Write data for block is obtained by multiplexing memory byte with MemAccess byte based on (offset decoder & write).
//If no write then data in the hit block same as that of memory block, else write CPUOut to the specific Byte.
mux2to1_32bit WriteData0(MemoryBlock[31:0], CPUOut, writeTo4Bytes[0], writeData[31:0]);                    
mux2to1_32bit WriteData1(MemoryBlock[63:32], CPUOut, writeTo4Bytes[1], writeData[63:32]);
mux2to1_32bit WriteData2(MemoryBlock[95:64], CPUOut, writeTo4Bytes[2], writeData[95:64]);
mux2to1_32bit WriteData3(MemoryBlock[127:96], CPUOut, writeTo4Bytes[3], writeData[127:96]);


//Either while replacing a byte or an entire block. If hit then write one specific byte else write whole block.

or(dataWrite[0], writeTo4Bytes[0], haltMainValidWrite);
or(dataWrite[1], writeTo4Bytes[0], haltMainValidWrite);
or(dataWrite[2], writeTo4Bytes[0], haltMainValidWrite);
or(dataWrite[3], writeTo4Bytes[0], haltMainValidWrite);

or(dataWrite[4], writeTo4Bytes[1], haltMainValidWrite);
or(dataWrite[5], writeTo4Bytes[1], haltMainValidWrite);
or(dataWrite[6], writeTo4Bytes[1], haltMainValidWrite);
or(dataWrite[7], writeTo4Bytes[1], haltMainValidWrite);

or(dataWrite[8], writeTo4Bytes[2], haltMainValidWrite);
or(dataWrite[9], writeTo4Bytes[2], haltMainValidWrite);
or(dataWrite[10], writeTo4Bytes[2], haltMainValidWrite);
or(dataWrite[11], writeTo4Bytes[2], haltMainValidWrite);

or(dataWrite[12], writeTo4Bytes[3], haltMainValidWrite);
or(dataWrite[13], writeTo4Bytes[3], haltMainValidWrite);
or(dataWrite[14], writeTo4Bytes[3], haltMainValidWrite);
or(dataWrite[15], writeTo4Bytes[3], haltMainValidWrite);



//Write tha data in the specific block determined by the setDecoderOut and wayIndexDecoderOut.
Data_Array way0_data(
                        clk,
                        reset,
                        setDecoderOut,
                        wayIndexDecoderOut[0],
                        writeData,
                        dataWrite,
                        way0dataBlock0, way0dataBlock1, way0dataBlock2, way0dataBlock3, way0dataBlock4, way0dataBlock5, way0dataBlock6, way0dataBlock7, way0dataBlock8, way0dataBlock9, way0dataBlock10, way0dataBlock11, way0dataBlock12,
                         way0dataBlock13, way0dataBlock14, way0dataBlock15);

Data_Array way1_data(
                        clk,
                        reset,
                        setDecoderOut,
                        wayIndexDecoderOut[1],
                        writeData,
                        dataWrite,
                        way1dataBlock0, way1dataBlock1, way1dataBlock2, way1dataBlock3, way1dataBlock4, way1dataBlock5, way1dataBlock6, way1dataBlock7, way1dataBlock8, way1dataBlock9, way1dataBlock10, way1dataBlock11,
                        way1dataBlock12, way1dataBlock13, way1dataBlock14, way1dataBlock15
                      );                      

Data_Array way2_data(
                        clk,
                        reset,
                        setDecoderOut,
                        wayIndexDecoderOut[2],
                        writeData,
                        dataWrite,
                        way2dataBlock0, way2dataBlock1, way2dataBlock2, way2dataBlock3, way2dataBlock4, way2dataBlock5, way2dataBlock6, way2dataBlock7, way2dataBlock8, way2dataBlock9, way2dataBlock10, way2dataBlock11, way2dataBlock12,
                         way2dataBlock13, way2dataBlock14, way2dataBlock15);

Data_Array way3_data(
                        clk,
                        reset,
                        setDecoderOut,
                        wayIndexDecoderOut[3],
                        writeData,
                        dataWrite,
                        way3dataBlock0, way3dataBlock1, way3dataBlock2, way3dataBlock3, way3dataBlock4, way3dataBlock5, way3dataBlock6, way3dataBlock7, way3dataBlock8, way3dataBlock9, way3dataBlock10, way3dataBlock11, way3dataBlock12, 
                        way3dataBlock13, way3dataBlock14, way3dataBlock15);  
                      
//Multiplex the data of each way to get the block of the required set

wire[127:0] way0data, way1data, way2data, way3data;

mux16to1_128bit_halting way0_datamux(
                                way0dataBlock0, way0dataBlock1, way0dataBlock2, way0dataBlock3, way0dataBlock4, way0dataBlock5, way0dataBlock6, way0dataBlock7, way0dataBlock8, way0dataBlock9, way0dataBlock10, way0dataBlock11, way0dataBlock12,
                                 way0dataBlock13, way0dataBlock14, way0dataBlock15,                                
                                halthit0,
                                PA[7:4],
                                way0data
                              );
mux16to1_128bit_halting way1_datamux(way1dataBlock0, way1dataBlock1, way1dataBlock2, way1dataBlock3, way1dataBlock4, way1dataBlock5, way1dataBlock6, way1dataBlock7, way1dataBlock8, way1dataBlock9, way1dataBlock10, way1dataBlock11, way1dataBlock12, way1dataBlock13, way1dataBlock14, way1dataBlock15,
                                halthit1,
                                PA[7:4],
                                way1data
                              );
mux16to1_128bit_halting way2_datamux(way2dataBlock0, way2dataBlock1, way2dataBlock2, way2dataBlock3, way2dataBlock4, way2dataBlock5, way2dataBlock6, way2dataBlock7, way2dataBlock8, way2dataBlock9, way2dataBlock10, way2dataBlock11, way2dataBlock12, way2dataBlock13, 
                              way2dataBlock14, way2dataBlock15, halthit2, PA[7:4], way2data );
                              
mux16to1_128bit_halting way3_datamux( way3dataBlock0, way3dataBlock1, way3dataBlock2, way3dataBlock3, way3dataBlock4, way3dataBlock5, way3dataBlock6, way3dataBlock7, way3dataBlock8, way3dataBlock9, way3dataBlock10, way3dataBlock11, way3dataBlock12, 
                              way3dataBlock13, way3dataBlock14, way3dataBlock15,halthit3,PA[7:4],way3data );                                                            

//Now choose the hit block using hitIndex

wire[127:0] cacheDataBlock;

mux4to1_128bit outBlock(  way0data, way1data, way2data, way3data, hitIndex, cacheDataBlock);

//Get the required DoubleWord from the block
DoubleWordReader getDoubleWord(cacheDataBlock, PA[3], cacheData);
 
wire writeBufferWrite;
wire[127:0] writeBufferBlock;
and(writeBufferWrite, MemWrite, hit);   //Only write to Write Buffer on cache hit

//Multiplex cache data and MemAccess byte data to determine write buffer write data

mux2to1_32bit WBWriteData0(cacheDataBlock[31:0], CPUOut, offsetDecoderOut[0], writeBufferBlock[31:0]);                    
mux2to1_32bit WBWriteData1(cacheDataBlock[63:32], CPUOut, offsetDecoderOut[1], writeBufferBlock[63:32]);
mux2to1_32bit WBWriteData2(cacheDataBlock[95:64], CPUOut, offsetDecoderOut[2], writeBufferBlock[95:64]);
mux2to1_32bit WBWriteData3(cacheDataBlock[127:96], CPUOut, offsetDecoderOut[3], writeBufferBlock[127:96]);
      
WriteBuffer wb(clk, reset, writeBufferWrite, writeBufferBlock, PA[31:4]);      
                                                    
endmodule                
module decoder2to4(input[1:0] in,output reg[3:0] out);

  //A 2 to 4 decoder which sets the corresponding bit in the 4 bit output to high
  
  //Used in LRU counter replacement strategy implementation
  //Also used in top level module
  
  
  always @(in)
        begin
            case(in)
              2'b00:  out = 4'b0001;
              2'b01:  out = 4'b0010;
              2'b10:  out = 4'b0100;
              2'b11:  out = 4'b1000;
            endcase
        end                  
                  
endmodule    
module decoder4to16(input[3:0] in, output reg[15:0] out);
         
      always @(in)
            begin
              case(in)
                  0:  out = 16'd1;
                  1:  out = 16'd2;
                  2:  out = 16'd4;
                  3:  out = 16'd8;
                  4:  out = 16'd16;
                  5:  out = 16'd32;
                  6:  out = 16'd64;
                  7:  out = 16'd128;
                  8:  out = 16'd256;
                  9:    out = 16'd512;
                  10:  out = 16'd1024;
                  11:  out = 16'd2048;
                  12:  out = 16'd4096;
                  13:  out = 16'd8192;
                  14:  out = 16'd16384;
                  15:  out = 16'd32768;

                  endcase
            end                  
                  
endmodule                  

module mux2to1_32bit (
                      input[31:0]      in1,
                      input[31:0]      in2,
                      input           sel,
                      output reg[31:0] out
                    );
         
  //A multiplexer that accepts 2 2-bit numbers and selects one of them
  
  //Used in LRU counter replacement strategy implementation         
         
  always @(in1 or in2 or sel)
        begin
            case(sel)
              1'b0: out = in1;
              1'b1: out = in2;
            endcase
        end         
                    
endmodule                    





module mux2to1_2bit (
                      input[1:0]      in1,
                      input[1:0]      in2,
                      input           sel,
                      output reg[1:0] out
                    );
         
  //A multiplexer that accepts 2 2-bit numbers and selects one of them
  
  //Used in LRU counter replacement strategy implementation         
         
  always @(in1 or in2 or sel)
        begin
            case(sel)
              1'b0: out = in1;
              1'b1: out = in2;
            endcase
        end         
                    
endmodule                    
module PlacementAndReplacementCircuit(input clk,input reset, input currentSetInUse, input hit,input[1:0] lineIndex, input valid0, input valid1,input valid2,input valid3, input MemAccess,output[1:0] outIndex);
                                      
  wire InvalidPresent;
  wire[1:0] invalidIndex;
  wire[1:0] replacementIndex;
 
  Placement_Circuit PC(valid0, valid1, valid2, valid3,InvalidPresent,invalidIndex);
  // find if there is any invalid block and its index present in the currentSetInUse.
  
  LRU_Counter RC(clk, reset, lineIndex, currentSetInUse, hit, MemAccess, replacementIndex);
  // find the index of block to replace(LRU).  Not always used.
    
  mux2to1_2bit mux1(replacementIndex, invalidIndex, InvalidPresent, outIndex);
  // if invalid block is present then returns its index (invalidIndex i.e Placement_Circuit) else
  // Least recently used block's index (replacementIndex i.e lru.v)
                                                                      
endmodule                                      

module LRU_Counter(input clk, input reset, input[1:0] lineIndex, input currentSetInUse, input hit, input MemAccess, output[1:0] outputIndex);
//currentSetInUseMemAccess: To avoid changing counters during non memory operations (Maybe not required since we are already using currentSetInUse)

  wire[1:0]   decoderInput;
  wire[3:0]   decoderOut;
  wire        dec0, dec1, dec2, dec3;
  wire        dec0a, dec1a, dec2a, dec3a;
  wire        load0, load1, load2, load3;
  wire[1:0]   val0, val1, val2, val3;
  wire[1:0]   selectedVal;


  
  mux2to1_2bit mux1(outputIndex, lineIndex, hit, decoderInput);
                    
  decoder2to4 d1(decoderInput, decoderOut );                    
                  
  counter c0(clk, reset, dec0a, load0, val0);  
  counter c1(clk, reset, dec1a, load1, val1);  
  counter c2(clk, reset, dec2a, load2, val2);  
  counter c3(clk, reset, dec3a, load3, val3);  
                     
  mux4to1_2bit mux2(val0,val1, val2, val3, decoderInput, selectedVal);
   
  comparator_lessthan_2bit comp0(selectedVal, val0, dec0);
  comparator_lessthan_2bit comp1(selectedVal, val1, dec1);   
  comparator_lessthan_2bit comp2(selectedVal, val2, dec2);
  comparator_lessthan_2bit comp3(selectedVal, val3, dec3);
 
  assign load0 = decoderOut[0] & currentSetInUse & MemAccess;
  assign load1 = decoderOut[1] & currentSetInUse & MemAccess;
  assign load2 = decoderOut[2] & currentSetInUse & MemAccess;
  assign load3 = decoderOut[3] & currentSetInUse & MemAccess;
  
  assign dec0a = ~decoderOut[0] & currentSetInUse & MemAccess & dec0;
  assign dec1a = ~decoderOut[1] & currentSetInUse & MemAccess & dec1;
  assign dec2a = ~decoderOut[2] & currentSetInUse & MemAccess & dec2;
  assign dec3a = ~decoderOut[3] & currentSetInUse & MemAccess & dec3;
 
  
  priority_encoder pe1(val0,  val1, val2, val3, outputIndex);
  
endmodule        

module Placement_Circuit(input  valid0,input valid1, input valid2, input valid3, output reg InvalidPresent, output reg[1:0] invalidIndex);
//checks for the presence of invalid block. if present the invalidPresent is 1 else 0. returns the index of invalid block as invalidIndex else 2'b00.
 always @(valid0 or valid1 or valid2 or valid3)
        begin
            if(valid0 == 0)
              begin
                  invalidIndex = 2'b00;
                  InvalidPresent=1'b1;
              end
            else if(valid1 == 0)
              begin
                  invalidIndex = 2'b01;
                  InvalidPresent=1'b1;
              end
            else if(valid2 == 0)
              begin
                  invalidIndex = 2'b10;
                  InvalidPresent=1'b1;
              end
            else if(valid3 == 0)
              begin
                  invalidIndex = 2'b11;
                  InvalidPresent=1'b1;
              end
            else
              begin   
                  invalidIndex = 2'b00;
                  InvalidPresent=1'b0;
              end
              
        end 
  
endmodule                                           

module counter(input clk, input reset, input dec, input load, output reg [1:0] val);

  reg[1:0] temp;

  always@(temp)
      begin
            val = temp;
      end

      
  always @(negedge clk)
  begin
    temp = val;
    if(reset == 1)
      begin
        temp = 2'b00;   
      end
    else if(load == 1)
      begin
        temp = 2'b11;  
      end
    else if(dec == 1 && temp != 0)  //temp!= 0 used in fifo replacement policy.
      begin
        temp = temp - 1;  
      end
  end
endmodule

module mux4to1_2bit(input[1:0] in1,input[1:0] in2,input[1:0] in3,input[1:0] in4,input[1:0] sel,output reg[1:0] out);
  
  //A 4 to 1 2-bit multiplexer
  
  //Used in LRU Counter replacement strategy implementation
           
        always @(in1 or in2 or in3 or in4 or sel)
              begin
                  case(sel)
                    2'b00:    out = in1;
                    2'b01:    out = in2;
                    2'b10:    out = in3;
                    2'b11:    out = in4;
                  endcase
              end                    
                    
endmodule                    
module comparator_lessthan_2bit( input[1:0] in1, input[1:0] in2,output reg out);
               
 //Uses in LRU implementation.                               
  always @(in1 or in2)
  begin
    if(in1 < in2)
      begin
        out = 1'b1;
      end
    else
      begin
        out = 1'b0;
      end
  end         
                                
endmodule                                
module priority_encoder(  
                          input[1:0]      in1,
                          input[1:0]      in2,
                          input[1:0]      in3,
                          input[1:0]      in4,
                          output reg[1:0] out
                        );                        
  //Takes 4 2-bit inputs and returns the index of the first one
  //which is zero
  
  //Used in the LRU counter implementation to find the line index
  //where replacement is to take place                        
         
  always @(in1 or in2 or in3 or in4)
  begin
    if(in1 == 2'b00)
      begin
        out = 2'b00;
      end
    else if(in2 == 2'b00)
      begin
        out = 2'b01;
      end
    else if(in3 == 2'b00)
      begin
        out = 2'b10;
      end
    else if(in4 == 2'b00)
      begin
        out = 2'b11;      //If first three aren't zero, the last one must be?????
      end
      else
            begin
                  out = 2'b00;
            end
  end                        
                        
endmodule                          
module mux16to1_2bit(input[1:0] in1,input[1:0] in2,input[1:0] in3,input[1:0] in4,input[1:0] in5,input[1:0] in6,input[1:0] in7,input[1:0] in8,input[1:0] in9,input[1:0] in10,input[1:0] in11,input[1:0] in12,input[1:0] in13,input[1:0] in14,input[1:0] in15,input[1:0] in16,input[3:0] sel,output reg[1:0] out);
//Used to select a byte from a given block
always @(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or in9 or in10 or in11 or in12 or in13 or in14 or in15 or in16 or sel)
          
      begin
        case(sel)
            0:        out = in1;
            1:        out = in2;
            2:        out = in3;
            3:        out = in4;
            4:        out = in5;
            5:        out = in6;
            6:        out = in7;
            7:        out = in8;
            8:        out = in9;
            9:        out = in10;
            10:        out = in11;
            11:        out = in12;
            12:        out = in13;
            13:        out = in14;
            14:        out = in15;
            15:        out = in16;
            endcase
      end

endmodule
module Halt_Tag_Array( input clk, input reset, input[15:0] setDecoderOut, input wayDecoderOut, input[3:0] writeData, input writeSignal, output [63:0] val);
  //Write signal is essentially (miss && (MemAccessread || MemAccessmiss))
  wire writeToWay;
  wire write0, write1, write2, write3, write4, write5, write6, write7,write8,write9,write10,write11,write12
  ,write13,write14,write15;
  
  and shouldWeWriteToThisWay(writeToWay, writeSignal, wayDecoderOut);
  
  and a0(write0, setDecoderOut[0], writeToWay);
  and a1(write1, setDecoderOut[1], writeToWay);
  and a2(write2, setDecoderOut[2], writeToWay);
  and a3(write3, setDecoderOut[3], writeToWay);
  and a4(write4, setDecoderOut[4], writeToWay);
  and a5(write5, setDecoderOut[5], writeToWay);
  and a6(write6, setDecoderOut[6], writeToWay);
  and a7(write7, setDecoderOut[7], writeToWay);
  and a8(write8, setDecoderOut[8], writeToWay);
  and a9(write9, setDecoderOut[9], writeToWay);
  and a10(write10, setDecoderOut[10], writeToWay);
  and a11(write11, setDecoderOut[11], writeToWay);
  and a12(write12, setDecoderOut[12], writeToWay);
  and a13(write13, setDecoderOut[13], writeToWay);
  and a14(write14, setDecoderOut[14], writeToWay);
  and a15(write15, setDecoderOut[15], writeToWay);


  
  // one array has 16 blocks in it.
  // one array represents one way.
  // will be initialised 4 times. since 4-way associative.
  // write comes from the decoding index.

  Halt_Register_Cache h0 (clk, reset, write0,  writeData, val[3:0]);                       
  Halt_Register_Cache h1 (clk, reset, write1,  writeData, val[7:4]);
  Halt_Register_Cache h2 (clk, reset, write2,  writeData, val[11:8]);
  Halt_Register_Cache h3 (clk, reset, write3,  writeData, val[15:12]);
  Halt_Register_Cache h4 (clk, reset, write4,  writeData, val[19:16]);
  Halt_Register_Cache h5 (clk, reset, write5,  writeData, val[23:20]);
  Halt_Register_Cache h6 (clk, reset, write6,  writeData, val[27:24]);
  Halt_Register_Cache h7 (clk, reset, write7,  writeData, val[31:28]);
  Halt_Register_Cache h8 (clk, reset, write8,  writeData, val[35:32]);
  Halt_Register_Cache h9 (clk, reset, write9,  writeData, val[39:36]);
  Halt_Register_Cache h10(clk, reset, write10, writeData, val[43:40]);
  Halt_Register_Cache h11(clk, reset, write11, writeData, val[47:44]);
  Halt_Register_Cache h12(clk, reset, write12, writeData, val[51:48]);
  Halt_Register_Cache h13(clk, reset, write13, writeData, val[55:52]);
  Halt_Register_Cache h14(clk, reset, write14, writeData, val[59:56]);
  Halt_Register_Cache h15(clk, reset, write15, writeData, val[63:60]);

                      
endmodule     
module Halt_Register_Cache(input clk, input reset, input writeSignal, input[3:0] writeData, output[3:0] val);

  // since only last four bits are being saved.
  D_FF_Cache d0(clk, reset, writeSignal, writeData[0], val[0]);                        
  D_FF_Cache d1(clk, reset, writeSignal, writeData[1], val[1]);
  D_FF_Cache d2(clk, reset, writeSignal, writeData[2], val[2]);
  D_FF_Cache d3(clk, reset, writeSignal, writeData[3], val[3]);       
  
endmodule                          
module D_FF_Cache(input clk, input reset, input writeSignal, input writeData, output reg q);

always @(negedge clk)
      begin
        if(reset == 1)
            q = 0;
        else if(writeSignal == 1)
            q = writeData;
      end
                  
endmodule                  
                    
module Main_Tag_Array( input clk, input reset, input[15:0] setDecoderOut, input wayDecoderOut, input[19:0] writeData, input writeSignal,  output [319:0] val);

  // code.

  wire writeToWay;
  wire write0, write1, write2, write3, write4, write5, write6, write7,write8,write9,write10,write11,write12
  ,write13,write14,write15;
  
  and shouldWeWriteToThisWay(writeToWay, writeSignal, wayDecoderOut);
  
  and a0(write0, setDecoderOut[0], writeToWay);
  and a1(write1, setDecoderOut[1], writeToWay);
  and a2(write2, setDecoderOut[2], writeToWay);
  and a3(write3, setDecoderOut[3], writeToWay);
  and a4(write4, setDecoderOut[4], writeToWay);
  and a5(write5, setDecoderOut[5], writeToWay);
  and a6(write6, setDecoderOut[6], writeToWay);
  and a7(write7, setDecoderOut[7], writeToWay);
  and a8(write8, setDecoderOut[8], writeToWay);
  and a9(write9, setDecoderOut[9], writeToWay);
  and a10(write10, setDecoderOut[10], writeToWay);
  and a11(write11, setDecoderOut[11], writeToWay);
  and a12(write12, setDecoderOut[12], writeToWay);
  and a13(write13, setDecoderOut[13], writeToWay);
  and a14(write14, setDecoderOut[14], writeToWay);
  and a15(write15, setDecoderOut[15], writeToWay);


  
  // one array has 16 blocks in it.
  // one array represents one way.
  // will be initialised 4 times. since 4-way associative.
  // write comes from the decoding index.

  Main_Tag_Register_Cache h0 (clk, reset, write0,  writeData, val[19:0]);                       
  Main_Tag_Register_Cache h1 (clk, reset, write1,  writeData, val[39:20]);
  Main_Tag_Register_Cache h2 (clk, reset, write2,  writeData, val[59:40]);
  Main_Tag_Register_Cache h3 (clk, reset, write3,  writeData, val[79:60]);
  Main_Tag_Register_Cache h4 (clk, reset, write4,  writeData, val[99:80]);
  Main_Tag_Register_Cache h5 (clk, reset, write5,  writeData, val[119:100]);
  Main_Tag_Register_Cache h6 (clk, reset, write6,  writeData, val[139:120]);
  Main_Tag_Register_Cache h7 (clk, reset, write7,  writeData, val[159:140]);
  Main_Tag_Register_Cache h8 (clk, reset, write8,  writeData, val[179:160]);
  Main_Tag_Register_Cache h9 (clk, reset, write9,  writeData, val[199:180]);
  Main_Tag_Register_Cache h10(clk, reset, write10, writeData, val[219:200]);
  Main_Tag_Register_Cache h11(clk, reset, write11, writeData, val[239:220]);
  Main_Tag_Register_Cache h12(clk, reset, write12, writeData, val[259:240]);
  Main_Tag_Register_Cache h13(clk, reset, write13, writeData, val[279:260]);
  Main_Tag_Register_Cache h14(clk, reset, write14, writeData, val[299:280]);
  Main_Tag_Register_Cache h15(clk, reset, write15, writeData, val[319:300]);

endmodule

module Main_Tag_Register_Cache( input clk,input reset, input writeSignal, input[19:0] writeData, output[19:0] val);
         
  D_FF_Cache d0(clk, reset, writeSignal, writeData[0], val[0]);                              
  D_FF_Cache d1(clk, reset, writeSignal, writeData[1], val[1]);
  D_FF_Cache d2(clk, reset, writeSignal, writeData[2], val[2]);
  D_FF_Cache d3(clk, reset, writeSignal, writeData[3], val[3]);
  D_FF_Cache d4(clk, reset, writeSignal, writeData[4], val[4]);
  D_FF_Cache d5(clk, reset, writeSignal, writeData[5], val[5]);
  D_FF_Cache d6(clk, reset, writeSignal, writeData[6], val[6]);
  D_FF_Cache d7(clk, reset, writeSignal, writeData[7], val[7]);                            
  D_FF_Cache d8(clk, reset, writeSignal, writeData[8], val[8]);                              
  D_FF_Cache d9(clk, reset, writeSignal, writeData[9], val[9]);
  D_FF_Cache d10(clk, reset, writeSignal, writeData[10], val[10]);
  D_FF_Cache d11(clk, reset, writeSignal, writeData[11], val[11]);                              
  D_FF_Cache d12(clk, reset, writeSignal, writeData[12], val[12]);
  D_FF_Cache d13(clk, reset, writeSignal, writeData[13], val[13]);
  D_FF_Cache d14(clk, reset, writeSignal, writeData[14], val[14]);
  D_FF_Cache d15(clk, reset, writeSignal, writeData[15], val[15]);                              
  D_FF_Cache d16(clk, reset, writeSignal, writeData[16], val[16]);
  D_FF_Cache d17(clk, reset, writeSignal, writeData[17], val[17]);
  D_FF_Cache d18(clk, reset, writeSignal, writeData[18], val[18]);
  D_FF_Cache d19(clk, reset, writeSignal, writeData[19], val[19]);
  
endmodule                              

module Valid_Array(input clk,input reset,input[15:0] setDecoderOut,input wayDecoderOut,input writeData, input writeSignal,output [15:0] val);

//Write signal is essentially (miss && (MemAccessread || MemAccesswrite))
  wire writeToWay;
  wire write0, write1, write2, write3, write4, write5, write6, write7,
  write8, write9, write10, write11, write12, write13, write14, write15;
  
  and shouldWeWriteHere(writeToWay, writeSignal, wayDecoderOut);
  
  and a0(write0, setDecoderOut[0], writeToWay);
  and a1(write1, setDecoderOut[1], writeToWay);
  and a2(write2, setDecoderOut[2], writeToWay);
  and a3(write3, setDecoderOut[3], writeToWay);
  and a4(write4, setDecoderOut[4], writeToWay);
  and a5(write5, setDecoderOut[5], writeToWay);
  and a6(write6, setDecoderOut[6], writeToWay);
  and a7(write7, setDecoderOut[7], writeToWay);
  and a8(write8, setDecoderOut[8], writeToWay);
  and a9(write9, setDecoderOut[9], writeToWay);
  and a10(write10, setDecoderOut[10], writeToWay);
  and a11(write11, setDecoderOut[11], writeToWay);
  and a12(write12, setDecoderOut[12], writeToWay);
  and a13(write13, setDecoderOut[13], writeToWay);
  and a14(write14, setDecoderOut[14], writeToWay);
  and a15(write15, setDecoderOut[15], writeToWay);
  
  D_FF_Cache v0(clk, reset, write0, writeData, val[0]);                       
  D_FF_Cache v1(clk, reset, write1, writeData, val[1]);
  D_FF_Cache v2(clk, reset, write2, writeData, val[2]);
  D_FF_Cache v3(clk, reset, write3, writeData, val[3]);
  D_FF_Cache v4(clk, reset, write4, writeData, val[4]);
  D_FF_Cache v5(clk, reset, write5, writeData, val[5]);
  D_FF_Cache v6(clk, reset, write6, writeData, val[6]);
  D_FF_Cache v7(clk, reset, write7, writeData, val[7]);
  D_FF_Cache v8(clk, reset, write8, writeData, val[8]);
  D_FF_Cache v9(clk, reset, write9, writeData, val[9]);
  D_FF_Cache v10(clk, reset, write10, writeData, val[10]);
  D_FF_Cache v11(clk, reset, write11, writeData, val[11]);
  D_FF_Cache v12(clk, reset, write12, writeData, val[12]);
  D_FF_Cache v13(clk, reset, write13, writeData, val[13]);
  D_FF_Cache v14(clk, reset, write14, writeData, val[14]);
  D_FF_Cache v15(clk, reset, write15, writeData, val[15]);
     


endmodule

module Halt_Tag_Array_Comparator(input [63:0] in ,input[3:0] haltTag,output haltHit);
                                
  wire hit0,hit1, hit2, hit3, hit4, hit5, hit6, hit7, hit8,hit9,hit10,hit11,hit12,hit13,hit14,hit15;
    

  Halt_Tag_Comparator hc0(in[3:0],   haltTag, hit0);                                
  Halt_Tag_Comparator hc1(in[7:4],   haltTag, hit1);                                
  Halt_Tag_Comparator hc2(in[11:8],   haltTag, hit2);                                
  Halt_Tag_Comparator hc3(in[15:12],   haltTag, hit3);
  Halt_Tag_Comparator hc4(in[19:16],   haltTag, hit4);
  Halt_Tag_Comparator hc5(in[23:20],   haltTag, hit5);
  Halt_Tag_Comparator hc6(in[27:24],   haltTag, hit6);
  Halt_Tag_Comparator hc7(in[31:28],   haltTag, hit7);
  Halt_Tag_Comparator hc8(in[35:32],   haltTag, hit8);
  Halt_Tag_Comparator hc9(in[39:36],   haltTag, hit9);
  Halt_Tag_Comparator hc10(in[43:40], haltTag, hit10);
  Halt_Tag_Comparator hc11(in[47:44], haltTag, hit11);
  Halt_Tag_Comparator hc12(in[51:48], haltTag, hit12);
  Halt_Tag_Comparator hc13(in[55:52], haltTag, hit13);
  Halt_Tag_Comparator hc14(in[59:56], haltTag, hit14);
  Halt_Tag_Comparator hc15(in[63:60], haltTag, hit15);
  
  or o0(haltHit, hit0,hit1, hit2, hit3, hit4, hit5, hit6, hit7, hit8,
       hit9,hit10,hit11,hit12,hit13,hit14,hit15);


endmodule                                
                                  
// will be same.
module Halt_Tag_Comparator(input[3:0] in1, input[3:0] in2, output reg out);

always @(in1 or in2)
      begin
        if(in1 == in2)
            begin
              out = 1;
            end
        else
            begin
              out = 0;
            end    
      end
                          
endmodule                          
module mux16to1_20bit_halting(input [319:0] in,input[3:0] sel,input halthit,output reg[19:0] out);
         
  always @(in or sel or halthit)
  begin
    if(halthit == 0) // special mux. if 4 bit hit miss then, don't activate this rack of memory.
      out = 0;
    else
            begin
                  case(sel)
                    0:        out =   in[19:0];  
                    1:        out =   in[39:20]; 
                    2:        out =   in[59:40]; 
                    3:        out =   in[79:60]; 
                    4:        out =   in[99:80]; 
                    5:        out =   in[119:100]; 
                    6:        out =   in[139:120]; 
                    7:        out =   in[159:140]; 
                    8:        out =   in[179:160];
                    9:        out =   in[199:180];
                    10:       out =   in[219:200];
                    11:       out =   in[239:220];
                    12:       out =   in[259:240];
                    13:       out =   in[279:260];
                    14:       out =   in[299:280];
                    15:       out =   in[319:300];

                  endcase
          end
  end         
                    
endmodule                    

module mux16to1_1bit_halting(input [15:0] in,input[3:0] sel,input haltHit, output reg out);
         
  always @(in or sel or haltHit)
  begin
    if(haltHit == 0)
      out = 0;
    else
            begin
                  case(sel)
                    0: out = in[0];
                    1: out = in[1];
                    2: out = in[2];
                    3: out = in[3];
                    4: out = in[4];
                    5: out = in[5];
                    6: out = in[6];
                    7: out = in[7];
                    8: out = in[8];
                    9: out = in[9];
                    10: out = in[10];
                    11: out = in[11];
                    12: out = in[12];
                    13: out = in[13];
                    14: out = in[14];
                    15: out = in[15];
                  endcase
            end
  end         
                    
endmodule                    

// will be same 
module Main_Tag_Comparator(input[19:0]in1,input[19:0]in2,input haltHit,output reg out);

always @(in1 or in2 or haltHit)
      begin
        if(haltHit == 0)
            begin
              out = 0;
            end
        else
            begin
              if(in1 == in2)
                  begin
                    out = 1;
                  end
              else
                  begin    
                    out = 0;
                  end 
            end
      end
                          
endmodule                          

module encoder4to2(input[3:0] in,output reg[1:0] out);

always @(in)
      begin
        case(in)
            4'b0001:    out = 2'b00;
            4'b0010:    out = 2'b01;
            4'b0100:    out = 2'b10;
            4'b1000:    out = 2'b11;
            default:    out = 2'b00;  //Miss case
        endcase
      end
                  
endmodule                  
                   

module Data_Array( input clk, input reset, input[15:0] setDecoderOut, input wayDecoderOut, input[127:0] writeData,  input[15:0] writeSignal,  output[127:0] val0,  output[127:0] val1, output[127:0] val2, output[127:0] val3,  output[127:0] val4,  output[127:0] val5, output[127:0] val6, output[127:0] val7, output[127:0] val8, output[127:0] val9, output[127:0] val10, output[127:0] val11, output[127:0] val12, output[127:0] val13, output[127:0] val14, output[127:0] val15);
//Here writesignal[i] is (miss && (MemRead || MemWrite)) || (Hit && MemWrite && offsetDecoderOutput[i])
wire[15:0] setAndWay;
//The write signals for each block in the way
wire[15:0] blockwrite0, blockwrite1,blockwrite2,blockwrite3,blockwrite4,blockwrite5,blockwrite6,blockwrite7,blockwrite8,blockwrite9,blockwrite10,blockwrite11,blockwrite12,blockwrite13,blockwrite14,blockwrite15;


// which of the 16 set will be in action.
// var_deciding_to_be_in_action, the real index bits but decoded form, one of the 4 bit of way thing.
and a0(setAndWay[0], setDecoderOut[0], wayDecoderOut);
and a1(setAndWay[1], setDecoderOut[1], wayDecoderOut);
and a2(setAndWay[2], setDecoderOut[2], wayDecoderOut);
and a3(setAndWay[3], setDecoderOut[3], wayDecoderOut);
and a4(setAndWay[4], setDecoderOut[4], wayDecoderOut);
and a5(setAndWay[5], setDecoderOut[5], wayDecoderOut);
and a6(setAndWay[6], setDecoderOut[6], wayDecoderOut);
and a7(setAndWay[7], setDecoderOut[7], wayDecoderOut);
and a8(setAndWay[8], setDecoderOut[8], wayDecoderOut);
and a9(setAndWay[9], setDecoderOut[9], wayDecoderOut);
and a10(setAndWay[10], setDecoderOut[10], wayDecoderOut);
and a11(setAndWay[11], setDecoderOut[11], wayDecoderOut);
and a12(setAndWay[12], setDecoderOut[12], wayDecoderOut);
and a13(setAndWay[13], setDecoderOut[13], wayDecoderOut);
and a14(setAndWay[14], setDecoderOut[14], wayDecoderOut);
and a15(setAndWay[15], setDecoderOut[15], wayDecoderOut);

// which block are we finally going to write (obb out of 16 blocks)
// is_the_set_in_use, writeSignal is related to offsetDecoderOut I hope at 3:56, it is silly.
// 
And_16_Array aa0(setAndWay[0], writeSignal, blockwrite0);
And_16_Array aa1(setAndWay[1], writeSignal, blockwrite1);
And_16_Array aa2(setAndWay[2], writeSignal, blockwrite2);
And_16_Array aa3(setAndWay[3], writeSignal, blockwrite3);
And_16_Array aa4(setAndWay[4], writeSignal, blockwrite4);
And_16_Array aa5(setAndWay[5], writeSignal, blockwrite5);
And_16_Array aa6(setAndWay[6], writeSignal, blockwrite6);
And_16_Array aa7(setAndWay[7], writeSignal, blockwrite7);
And_16_Array aa8(setAndWay[8], writeSignal, blockwrite8);
And_16_Array aa9(setAndWay[9], writeSignal, blockwrite9);
And_16_Array aa10(setAndWay[10], writeSignal, blockwrite10);
And_16_Array aa11(setAndWay[11], writeSignal, blockwrite11);
And_16_Array aa12(setAndWay[12], writeSignal, blockwrite12);
And_16_Array aa13(setAndWay[13], writeSignal, blockwrite13);
And_16_Array aa14(setAndWay[14], writeSignal, blockwrite14);
And_16_Array aa15(setAndWay[15], writeSignal, blockwrite15);




// 16 blocks in a set each of 16Bytes each i.e 128
Block_16Byte_Cache b0(clk, reset, blockwrite0,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val0
                          );

Block_16Byte_Cache b1(clk, reset, blockwrite1,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val1
                          );

Block_16Byte_Cache b2(clk, reset, blockwrite2,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val2
                          );
                          
Block_16Byte_Cache b3(clk, reset, blockwrite3,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val3
                          );                          
                          

Block_16Byte_Cache b4(clk, reset, blockwrite4,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val4
                          );                          



Block_16Byte_Cache b5(clk, reset, blockwrite5,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val5
                          );                          


Block_16Byte_Cache b6(clk, reset, blockwrite6,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val6
                          );                          


Block_16Byte_Cache b7(clk, reset, blockwrite7,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val7
                          );                          


Block_16Byte_Cache b8(clk, reset, blockwrite8,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val8
                          );                          


Block_16Byte_Cache b9(clk, reset, blockwrite9,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val9
                          );                         


Block_16Byte_Cache b10(clk, reset, blockwrite10,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val10
                          );                          


Block_16Byte_Cache b11(clk, reset, blockwrite11,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val11
                          );                          


Block_16Byte_Cache b12(clk, reset, blockwrite12,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val12
                          );                          


Block_16Byte_Cache b13(clk, reset, blockwrite13,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val13
                          );                          

Block_16Byte_Cache b14(clk, reset, blockwrite14,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val14
                          );                          


Block_16Byte_Cache b15(clk, reset, blockwrite15,  
                            writeData,    //Top level will multiplex mem byte with MemAccess byte
                            val15
                          );                          


                          
endmodule

module Block_16Byte_Cache(  input clk,input reset,input[15:0] writeSignal, input[127:0] writeData,output [127:0] val);
  //Top level will multiplex mem byte with MemAccess byte
  Byte_Register_Cache b0(clk,reset,writeSignal[0], writeData[7:0],  val[7:0]);         
  Byte_Register_Cache b1(clk,reset,writeSignal[1], writeData[15:8], val[15:8]);         
  Byte_Register_Cache b2(clk,reset,writeSignal[2], writeData[23:16],val[23:16]);         
  Byte_Register_Cache b3(clk,reset,writeSignal[3], writeData[31:24],val[31:24]);         
  Byte_Register_Cache b4(clk,reset,writeSignal[4], writeData[39:32],val[39:32]);         
  Byte_Register_Cache b5(clk,reset,writeSignal[5], writeData[47:40],val[47:40]);         
  Byte_Register_Cache b6(clk,reset,writeSignal[6], writeData[55:48],val[55:48]);         
  Byte_Register_Cache b7(clk,reset,writeSignal[7], writeData[63:56],val[63:56]);         
  Byte_Register_Cache b8(clk,reset,writeSignal[8], writeData[71:64],val[71:64]);         
  Byte_Register_Cache b9(clk,reset,writeSignal[9], writeData[79:72],val[79:72]);         
  Byte_Register_Cache b10(clk,reset,writeSignal[10], writeData[87:80],val[87:80]);         
  Byte_Register_Cache b11(clk,reset,writeSignal[11], writeData[95:88],val[95:88]);         
  Byte_Register_Cache b12(clk,reset,writeSignal[12], writeData[103:96],val[103:96]);         
  Byte_Register_Cache b13(clk,reset,writeSignal[13], writeData[111:104],val[111:104]);         
  Byte_Register_Cache b14(clk,reset,writeSignal[14], writeData[119:112],val[119:112]);         
  Byte_Register_Cache b15(clk,reset,writeSignal[15], writeData[127:120],val[127:120]);                                   
  
endmodule                          


module And_16_Array(input a,input[15:0] b,output[15:0] out);

and a0(out[0], b[0], a);
and a1(out[1], b[1], a);
and a2(out[2], b[2], a);
and a3(out[3], b[3], a);
and a4(out[4], b[4], a);
and a5(out[5], b[5], a);
and a6(out[6], b[6], a);
and a7(out[7], b[7], a);                    
and a8(out[8], b[8], a);
and a9(out[9], b[9], a);
and a10(out[10], b[10], a);
and a11(out[11], b[11], a);
and a12(out[12], b[12], a);
and a13(out[13], b[13], a);
and a14(out[14], b[14], a);
and a15(out[15], b[15], a);

endmodule                    
     
module Byte_Register_Cache(input  clk,input  reset,input  writeSignal,input[7:0]  writeData,output[7:0] val);
                          
  // write 8 bits simulatenoutsly : writeSignal same.
                          
  D_FF_Cache  d0( clk,  reset,  writeSignal,  writeData[0],  val[0]);
  D_FF_Cache  d1( clk,  reset,  writeSignal,  writeData[1],  val[1]);
  D_FF_Cache  d2( clk,  reset,  writeSignal,  writeData[2],  val[2]);
  D_FF_Cache  d3( clk,  reset,  writeSignal,  writeData[3],  val[3]);
  D_FF_Cache  d4( clk,  reset,  writeSignal,  writeData[4],  val[4]);
  D_FF_Cache  d5( clk,  reset,  writeSignal,  writeData[5],  val[5]);
  D_FF_Cache  d6( clk,  reset,  writeSignal,  writeData[6],  val[6]);
  D_FF_Cache  d7( clk,  reset,  writeSignal,  writeData[7],  val[7]);
                             
endmodule                          

module mux16to1_128bit_halting(input[127:0] in1, input[127:0] in2, input[127:0] in3, input[127:0] in4, input[127:0] in5, input[127:0] in6, input[127:0] in7, input[127:0] in8, input[127:0] in9, input[127:0] in10, input[127:0] in11, input[127:0] in12, input[127:0] in13, input[127:0] in14, input[127:0] in15, input[127:0] in16, input haltHit, input[3:0]   sel, output reg[127:0] out);
  //Selects one block from a way using index bits as selector
  //Can be halted using halt miss signal                                
  always @(in1 or in2 or in3 or in4 or in5 or in6 or in7 or in8 or 
  in9 or in10 or in11 or in12 or in13 or in14 or in15 or in16 or sel or haltHit)
  begin
    if(haltHit == 0)  //Way doesn't contain matching halt bits
    begin
      out = 0;  
    end
    else
    begin
      case(sel)
       0:    out = in1;
       1:    out = in2;
       2:    out = in3;
       3:    out = in4;
       4:    out = in5;
       5:    out = in6;
       6:    out = in7;
       7:    out = in8;
       8:    out = in9;
       9:    out = in10;
       10:    out = in11;
       11:    out = in12;
       12:    out = in13;
       13:    out = in14;
       14:    out = in15;
       15:    out = in16;

     endcase
    end                              
  end                              
endmodule                              
                
module mux4to1_128bit(  input[127:0] in1,input[127:0] in2,input[127:0] in3,input[127:0] in4,input[1:0]   sel,output reg[127:0] out);
  //Used to select between the outputs from the 4 different ways
  //Selector is the encoder output
                      
  always @(in1 or in2 or in3 or in4 or sel)
  begin
    case(sel)
      0:  out = in1;
      1:  out = in2;
      2:  out = in3;
      3:  out = in4;
    endcase
  end                      
                    
                      
endmodule                      

module DoubleWordReader(input[127:0] block,input index,output[63:0] DWord);
//Accepts a block and gives the required Dword determined by index 
 
mux2to1_64bit mux1( block[63:0],block[127:64],index,DWord);                    

endmodule                  

module mux2to1_64bit (input[63:0] in1,input[63:0] in2,input  sel,output reg[63:0] out);
         
  //A multiplexer that accepts 2 2-bit numbers and selects one of them
  
  //Used in LRU counter replacement strategy implementation         
         
  always @(in1 or in2 or sel)
        begin
            case(sel)
              1'b0: out = in1;
              1'b1: out = in2;
            endcase
        end         
                    
endmodule 
module mux4to1_32bit(
input[31:0] in1,input[31:0] in2,input[31:0] in3,input[31:0] in4, input[1:0] sel,output reg[31:0] out);
//Used to select a byte from a given block
always @(in1 or in2 or in3 or in4 or
          sel)
          
begin
  case(sel)
    0:        out = in1;
    1:        out = in2;
    2:        out = in3;
    3:        out = in4;

  endcase
end

endmodule



module WriteBuffer(input clk, input reset, input write, input[127:0] writeBlock, input[27:0] writeAddress);
//Write = Hit && MemWrite                  
 wire[127:0]   block0;            
 wire[127:0]   block1;             
 wire[127:0]   block2;             
 wire[127:0]   block3;

 wire[27:0] address0, address1, address2, address3;
 wire valid0, valid1, valid2, valid3;
 wire[1:0] wayIndex;
 wire[3:0] wayIndexDecoderOut, mergeIndexDecoderOut;
 wire[3:0] write_block;
 
 FIFO_Placement_And_Replacement FPR(clk, reset, write, wayIndex, valid0, valid1, valid2, valid3, wayIndex); 
 decoder2to4 wayDecoder(wayIndex, wayIndexDecoderOut);
 
 and(write_block[0], wayIndexDecoderOut[0], write);
 and(write_block[1], wayIndexDecoderOut[1], write);
 and(write_block[2], wayIndexDecoderOut[2], write);
 and(write_block[3], wayIndexDecoderOut[3], write);
 

 
 
 Block_16Byte_Cache b0(  
                            clk,
                            reset,
                            {16{write_block[0]}},  
                            writeBlock,    //Top level will multiplex mem byte with MemAccess byte
                            block0
                    );

 Block_16Byte_Cache b1(  
                            clk,
                            reset,
                            {16{write_block[1]}},  
                            writeBlock,    //Top level will multiplex mem byte with MemAccess byte
                                          block1
                                          );

 Block_16Byte_Cache b2(  
                            clk,
                            reset,
                            {16{write_block[2]}},  
                            writeBlock,    //Top level will multiplex mem byte with MemAccess byte
                                          block2);
                  
 Block_16Byte_Cache b3(  
                            clk,
                            reset,
                            {16{write_block[3]}},  
                            writeBlock,    //Top level will multiplex mem byte with MemAccess byte
                                          block3);                  
D_FF_Cache v0(clk, reset, write_block[0], 1'b1, valid0);
D_FF_Cache v1(clk, reset, write_block[1], 1'b1, valid1);
D_FF_Cache v2(clk, reset, write_block[2], 1'b1, valid2);
D_FF_Cache v3(clk, reset, write_block[3], 1'b1, valid3); 

AddressRegister_WB   a0(clk, reset, write_block[0], writeAddress, address0);
AddressRegister_WB   a1(clk, reset, write_block[1], writeAddress, address1);                                                    
AddressRegister_WB   a2(clk, reset, write_block[2], writeAddress, address2);
AddressRegister_WB   a3(clk, reset, write_block[3], writeAddress, address3);
                                                                 
endmodule                  
                 

                      
module priority_encoder_invalid(input valid0,input valid1,input valid2,input valid3,output  reg[1:0] invalidIndex);
                              
  always @(valid0 or valid1 or valid2 or valid3)
  begin
    if(valid0 == 0)
      begin
        invalidIndex = 2'b00;
      end
    else if(valid1 == 0)
      begin
        invalidIndex = 2'b01;
      end
    else if(valid2 == 0)
      begin
        invalidIndex = 2'b10;
      end
    else if(valid3 == 0)
      begin
        invalidIndex = 2'b11;
      end
    else
      begin   //None is valid, NAND output will be 0. 
        invalidIndex = 2'b00;
      end
      
  end                              
                              
endmodule                              

module FIFO_Placement_And_Replacement(input clk,input reset,input write,input[1:0] lineIndex,input valid0,input valid1,input valid2,input valid3,output[1:0] outIndex);

  wire invalidExists;
  wire[1:0] invalidIndex;
  wire[1:0] replacementIndex;
  
  FIFO_Replacement_WB RC(clk, reset, lineIndex, write, replacementIndex);
  FIFO_Placement_Circuit PC(valid0, valid1, valid2, valid3,invalidExists,invalidIndex);
  mux2to1_2bit mux1(replacementIndex, invalidIndex, invalidExists, outIndex);  //Choose invalid index if there is any invalid bit
                                    //Else choose replacement index  

endmodule

module FIFO_Replacement_WB(input clk,input reset,input [1:0] lineIndex,input write,output[1:0] outIndex);

wire dec0, dec1, dec2, dec3;
wire load0, load1, load2, load3;
wire[1:0] val0, val1, val2, val3;

counter c0(clk, reset, dec0, load0, val0 );

counter c1( clk, reset, dec1, load1, val1);

counter c2(clk, reset, dec2, load2, val2);

counter c3(clk, reset, dec3, load3, val3);
wire[3:0] decoderOut;    
wire[3:0] notDecoderOut;
          
decoder2to4 decoder1(lineIndex, decoderOut);
//Load the counter with decoder out = 0
and(load0, decoderOut[0], write);              
and(load1, decoderOut[1], write);
and(load2, decoderOut[2], write); //Decrement or load can only happen when there's a write to WB
and(load3, decoderOut[3], write);

not(notDecoderOut[0], decoderOut[0]);
not(notDecoderOut[1], decoderOut[1]);
not(notDecoderOut[2], decoderOut[2]);
not(notDecoderOut[3], decoderOut[3]);

and(dec0, notDecoderOut[0], write);
and(dec1, notDecoderOut[1], write);
and(dec2, notDecoderOut[2], write);   //Decrement the other nonzero counters
and(dec3, notDecoderOut[3], write);

priority_encoder pe(val0, val1, val2, val3, outIndex);


endmodule

module FIFO_Placement_Circuit( input valid0, input valid1, input valid2, input valid3, output isInvalid, output[1:0] invalidIndex );
                              
 nand n1(isInvalid, valid0, valid1, valid2, valid3);    //If any is zero, then output is 1         
priority_encoder_invalid pe1(valid0, valid1, valid2, valid3, invalidIndex);
                              
endmodule                                             
                    
module AddressRegister_WB(  input clk,  input reset,  input writeSignal,  input[27:0]  writeData,  output[27:0] val);
                          
  D_FF_Cache d0(clk, reset, writeSignal, writeData[0], val[0]);                          
  D_FF_Cache d1(clk, reset, writeSignal, writeData[1], val[1]);                          
  D_FF_Cache d2(clk, reset, writeSignal, writeData[2], val[2]);                          
  D_FF_Cache d3(clk, reset, writeSignal, writeData[3], val[3]);                          
  D_FF_Cache d4(clk, reset, writeSignal, writeData[4], val[4]);
  D_FF_Cache d5(clk, reset, writeSignal, writeData[5], val[5]);
  D_FF_Cache d6(clk, reset, writeSignal, writeData[6], val[6]);
  D_FF_Cache d7(clk, reset, writeSignal, writeData[7], val[7]);
  D_FF_Cache d8(clk, reset, writeSignal, writeData[8], val[8]);
  D_FF_Cache d9(clk, reset, writeSignal, writeData[9], val[9]);
  D_FF_Cache d10(clk, reset, writeSignal, writeData[10], val[10]);                          
  D_FF_Cache d11(clk, reset, writeSignal, writeData[11], val[11]);                          
  D_FF_Cache d12(clk, reset, writeSignal, writeData[12], val[12]);
  D_FF_Cache d13(clk, reset, writeSignal, writeData[13], val[13]);
  D_FF_Cache d14(clk, reset, writeSignal, writeData[14], val[14]);
  D_FF_Cache d15(clk, reset, writeSignal, writeData[15], val[15]);
  D_FF_Cache d16(clk, reset, writeSignal, writeData[16], val[16]);
  D_FF_Cache d17(clk, reset, writeSignal, writeData[17], val[17]);
  D_FF_Cache d18(clk, reset, writeSignal, writeData[18], val[18]);                          
  D_FF_Cache d19(clk, reset, writeSignal, writeData[19], val[19]);                          
  D_FF_Cache d20(clk, reset, writeSignal, writeData[20], val[20]);
  D_FF_Cache d21(clk, reset, writeSignal, writeData[21], val[21]);
  D_FF_Cache d22(clk, reset, writeSignal, writeData[22], val[22]);
  D_FF_Cache d23(clk, reset, writeSignal, writeData[23], val[23]);
  D_FF_Cache d24(clk, reset, writeSignal, writeData[24], val[24]);
  D_FF_Cache d25(clk, reset, writeSignal, writeData[25], val[25]);      
  D_FF_Cache d26(clk, reset, writeSignal, writeData[26], val[26]);
  D_FF_Cache d27(clk, reset, writeSignal, writeData[27], val[27]);
  
  
endmodule                          

module TestBench;
  
  reg clk, reset;
  reg[31:0] PA;
  reg[127:0] MemoryBlock;
  reg[31:0] CPUOut;
  reg MemRead, MemWrite;
  wire hit, halthit0, halthit1, halthit2, halthit3;
  wire[63:0] cacheData;
  reg[3:2] offset;
  reg[3:0] index;
  reg[23:0] tag;
  

  
  TopLevel test(clk,reset,PA,MemoryBlock,CPUOut,MemRead,MemWrite,hit,halthit0,halthit1,halthit2,halthit3,cacheData);  
  
  always
  begin
    #5 clk = ~clk;
  end
  
  always @(PA)
  begin
    offset = PA[3:2];
    index = PA[7:4];
    tag = PA[31:8];
  end
  
  initial
  begin
    clk = 0; reset = 1; PA = 0; MemoryBlock = 128'd200; CPUOut = 0; MemWrite = 0; MemRead = 0;
    #15 reset = 0;
    PA = 32'hff000020;    //Index = 2 halt tag = 0, Should go to way 0, set 2
    MemoryBlock = 128'hffffffff;
    CPUOut = 32'hff; MemWrite = 0; MemRead = 1;  //Read Miss followed by read hit.
    
	 #10
	 PA = 32'hff000024; //Index = 2, halt tag = 0. 
	 MemoryBlock = 128'hffffffff;
	 CPUOut = 32'hff; MemWrite = 0; MemRead = 1; //Read hit.(Halthit with all halt tag arrays since initially all are 0)
	 
	 #10
	 PA = 32'hff000028;
	 MemoryBlock = 128'hffffffff;
	 CPUOut = 32'hee; MemWrite = 1; MemRead = 0; //Write hit. Can observe the block and its address in the write buffer.
	 
	 #10
	 PA = 32'hff000128;		//Index = 2, halt = 1, should go to way 1 set 2.
	 MemoryBlock = 128'heeeeeeee;
	 CPUOut = 32'd0; MemWrite = 0; MemRead = 1;//Read Miss followed by read hit.
	 
	 #10
	 PA = 32'hff000120;		//Index = 2, halt = 1, halthit1 = 1.
	 MemoryBlock = 128'heeeeeeee;
	 CPUOut = 32'd0; MemWrite = 0; MemRead = 1;//Read Hit.
	 
	 #10
	 PA = 32'hff000124;		//Index = 2, halt = 1, halthit1 = 1.
	 MemoryBlock = 128'heeeeeeee;
	 CPUOut = 32'hff; MemWrite = 1; MemRead = 0;//Write Hit. Can observe the block in write buffer.
	 
	 #10
	 PA = 32'hff001124;		//Index = 2, halt = 1, halthit1 = 1, halthit2 = 1, but miss happening. goes to set 2 way 2.
	 MemoryBlock = 128'hcccccccc;
	 CPUOut = 32'hfff; MemWrite = 0; MemRead = 1;//Read miss followed by hit.
	 
	 #10
	 PA = 32'hff001124;	//Index = 2, halt = 1, halthit = 1, hit happening.
	 MemoryBlock = 128'hcccccccc;
	 CPUOut = 32'haa; MemWrite = 1; MemRead = 0; //Write hit. Can observe it in write buffer.
	 
	 #10
	 PA = 32'hff011124;	//Index = 2, halt = 1, halthit = 1, hit happening. set 2, way 3.
	 MemoryBlock = 128'h88888888;
	 CPUOut = 32'hdd; MemWrite = 0; MemRead = 1; //Read Miss followed by read Hit.
	 
	#10
	 PA = 32'hff111124;	//Index = 2, halt = 1, halthit = 1, hit happening. set 2, way 0. replace way0 block. Can see LRU functioning.
	 MemoryBlock = 128'h88888888;
	 CPUOut = 32'hdd; MemWrite = 0; MemRead = 1; //Read Miss followed by read hit.

	 #10
	 PA = 32'hff111134;	//Index = 3, halt = 1, halthit = 1, hit happening. set 3, way 0. replace way0 block. Can see LRU functioning.
	 MemoryBlock = 128'h88888888;
	 CPUOut = 32'hdd; MemWrite = 0; MemRead = 1; //Read Miss followed by read hit.
	 
	 	 #10
	 PA = 32'hff111130;	//Index = 3, halt = 1, halthit happening
	 MemoryBlock = 128'h88888888;
	 CPUOut = 32'h33; MemWrite = 1; MemRead = 0; //Write hit. Added in buffer.
	 
	 	 #10
	 PA = 32'hff011124;	//Index = 3, halt = 1, halthit = 1, halthit and hit happening.
	 MemoryBlock = 128'h88888888;
	 CPUOut = 32'hdd; MemWrite = 1; MemRead = 0; //Write hit. Can see fifo replacement in write buffer.
	 
	 
	 
	  #20 $finish;
  end
  
endmodule
