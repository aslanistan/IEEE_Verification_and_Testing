// DUT
// adder.v
module add(A,B,Z);
parameter N = 16;
input [N-1:0] A,B;
    output [N:0] Z;

assign Z = A+B-1;

endmodule