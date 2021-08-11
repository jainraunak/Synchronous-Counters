module test_SRFlipFlop;

reg S,R,clk,rst;
wire Q,Qcomp;

SRFlipFlop DUT(Q,Qcomp,rst,S,R,clk);

always #10 clk = ~clk;

initial
 begin
  $dumpfile("SRFlipFlop.vcd");
  $dumpvars(0,test_SRFlipFlop);
  $monitor ($time,"Q=%b,Qcomp=%b,S=%b,R=%b,clk = %b", Q, Qcomp, S, R, clk);
  clk = 0;
  S= 1; R= 0;
  rst = 1;
  #1; rst = 0;
  #10; S= 0; R= 1; 
  #22; S= 0; R= 0; 
  #26; S= 1; R=0; 
  repeat (2) @(posedge clk);
  $finish;
 end 

endmodule