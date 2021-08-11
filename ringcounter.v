module ringcounter(Q0,Q1,Q2,Q3,Q0comp,Q1comp,Q2comp,Q3comp,clk,rst);

input clk,rst;
output Q0,Q1,Q2,Q3,Q0comp,Q1comp,Q2comp,Q3comp;
wire D0,D1,D2,D3,a,b;

assign a = 1;
assign b = 0;

buf(D0,Q1);
buf(D1,Q2);
buf(D2,Q3);
xor(D3,Q0,Q1);

DFlipFlop DQ0(Q0,Q0comp,D0,clk,rst,a,b);
DFlipFlop DQ1(Q1,Q1comp,D1,clk,rst,b,a);
DFlipFlop DQ2(Q2,Q2comp,D2,clk,rst,b,a);
DFlipFlop DQ3(Q3,Q3comp,D3,clk,rst,a,b);

endmodule

module DFlipFlop(Q,Qcomp,D,clk,rst,a,b);

input D,clk,rst,a,b;
output reg Q,Qcomp;

always @(clk | rst)
begin
   if(rst == 1)
     begin 
       Q = a;
       Qcomp = b;
     end
end

always @(posedge clk)
begin
   Q = D;
   Qcomp = ~Q;
end

endmodule