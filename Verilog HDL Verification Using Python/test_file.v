// Testbench
// test_file.v
`include "add.v"

module test_file;
parameter i =1;   
integer read_file,write_file,value_r;
reg clk;
reg [15:0] A;
reg [15:0] B;
wire [16:0] Sum; 

add aa1(A,B,Sum);

initial begin
    clk = 1;
    A = 0;
    B = 0;
    read_file  = $fopen("in_vec.txt","r");
    write_file = $fopen("out_vec.txt","w");
end

always # 1 clk = ~clk;

initial begin
     @ (posedge clk);
    while (!$feof(read_file)) 
    begin
      @ (posedge clk);
      value_r = $fscanf(read_file,"%h %h\n",A,B);
    end
     @ (posedge clk);
    $fclose(read_file);
    $fclose(write_file);
    #1 $finish;
end

always @ (negedge clk)
 begin
$fwrite(write_file,"%0d %0d %0d\n",A,B,Sum);
 end

//initial $monitor($time, " %d + %d = %d",A,B,Sum);
/*
initial  
begin
    $fdisplay(write_file, "\nThis is Run number: %d\n", i);
    $fdisplay(write_file, "_____________________________\n");
end
*/
endmodule
