module test_graycode;

reg clk,rst;
wire A,Acomp,B,Bcomp,C,Ccomp,D,Dcomp;

graycode DUT(A,B,C,D,Acomp,Bcomp,Ccomp,Dcomp,clk,rst);

always #10 clk = ~clk;

initial
 begin
  $dumpfile("graycode.vcd");
  $dumpvars(0,test_graycode);
  $monitor ($time," %b%b%b%b", A, B, C, D);
  clk = 0;
  rst = 1;
  #2; rst = 0;
  repeat(20) @(posedge clk);
  $finish;
 end 

endmodule