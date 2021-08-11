module graycode(A,B,C,D,Acomp,Bcomp,Ccomp,Dcomp,clk,rst);

input clk,rst;
output A,B,C,D,Acomp,Bcomp,Ccomp,Dcomp;

wire SA,RA,SB1,SB2,SB3,SB,RB1,RB2,RB3,RB,SC1,SC2,SC,RC1,RC2,RC,SD1,SD2,SD,RD;

and(SA,Bcomp,C,Dcomp);
and(RA,Bcomp,Ccomp,Dcomp);
and(SB1,Acomp,Ccomp,Dcomp);
and(SB2,Acomp,C,D);
and(SB3,A,Ccomp,D);
or(SB,SB1,SB2,SB3);
and(RB1,A,Ccomp,Dcomp);
and(RB2,Acomp,Ccomp,D);
and(RB3,Acomp,C,Dcomp);
or(RB,RB1,RB2,RB3);
and(SC1,Acomp,Bcomp,D);
and(SC2,A,B,D);
or(SC,SC1,SC2);
and(RC1,A,Bcomp,D);
and(RC2,A,B,Dcomp);
or(RC,RC1,RC2);
and(SD1,Acomp,B,Ccomp);
and(SD2,A,Bcomp,C);
or(SD,SD1,SD2);
and(RD,B,C);

SRFlipFlop SRA(A,Acomp,rst,SA,RA,clk);
SRFlipFlop SRB(B,Bcomp,rst,SB,RB,clk);
SRFlipFlop SRC(C,Ccomp,rst,SC,RC,clk);
SRFlipFlop SRD(D,Dcomp,rst,SD,RD,clk);

endmodule

module SRFlipFlop(Q,Qcomp,rst,S,R,clk);

input S,R,rst,clk;
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
   Q = S|(~R&Q);
   Qcomp = ~Q;
end

endmodule
