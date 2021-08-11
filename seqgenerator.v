module seqgenerator(A,B,Acomp,Bcomp,Y,X,clk,rst);

input clk,rst,X;
output A,B,Acomp,Bcomp,Y;
wire DA,DB;

and(DA,B,X);
and(DB,Acomp,Bcomp,X);
and(Y,A,X);

DFlipFlop DF1(A,Acomp,DA,clk,rst);
DFlipFlop DF2(B,Bcomp,DB,clk,rst);

endmodule

module DFlipFlop(Q,Qcomp,D,clk,rst);

input D,clk,rst;
output reg Q,Qcomp;

always @(clk | rst)
begin
   if(rst == 1)
     begin 
       Q = 0;
       Qcomp = 1;
     end
end

always @(posedge clk)
begin
   Q = D;
   Qcomp = ~Q;
end

endmodule