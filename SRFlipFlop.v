module SRFlipFlop(Q,Qcomp,rst,S,R,clk);

input S,R,rst,clk;
output reg Q,Qcomp;

/*wire a,b;

nand(a,S,clk);
nand(b,R,clk);
nand(Q,a,Qcomp);
nand(Qcomp,b,Q);*/

always @(posedge clk)
begin
 if(rst == 1)
   begin
     Q = 0;
     Qcomp = 0;
   end
 else
   begin
     Q = S|(~R&Q);
     Qcomp = ~S&(R|Qcomp);
   end
end

endmodule

