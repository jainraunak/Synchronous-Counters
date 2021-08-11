module test_ringcounter;

reg clk,rst;
wire Q0,Q0comp,Q1,Q1comp,Q2,Q2comp,Q3,Q3comp;

ringcounter DUT(Q0,Q1,Q2,Q3,Q0comp,Q1comp,Q2comp,Q3comp,clk,rst);

always #10 clk = ~clk;

initial
 begin
  $dumpfile("ringcounter.vcd");
  $dumpvars(0,test_ringcounter);
  $monitor ($time," %b%b%b%b", Q3, Q2, Q1, Q0);
  clk = 0;
  rst = 1;
  #2; rst = 0;
  repeat(20) @(posedge clk);
  $finish;
 end 

endmodule