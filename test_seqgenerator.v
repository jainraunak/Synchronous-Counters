module test_seqgenerator;

reg clk,rst,X;
wire A,Acomp,B,Bcomp,Y;

seqgenerator DUT(A,B,Acomp,Bcomp,Y,X,clk,rst);

always #10 clk = ~clk;

initial
 begin
  $dumpfile("seqgenerator.vcd");
  $dumpvars(0,test_seqgenerator);
  $monitor ($time," A = %b, B = %b, Y = %b", A,B, Y);
  clk = 0;
  rst = 1;
  X = 1;
  #2; rst = 0;
  #30; X = 0;
  #30; X = 1;
  #30; X = 0;
  #30; X = 1;
  repeat(20) @(posedge clk);
  $finish;
 end 

endmodule