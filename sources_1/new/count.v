`timescale 1ns/1ns

module counter (
    input wire clk,
    input wire rst,
    output reg flag
);
parameter NUM = 25'd25_000_000;
reg [24:0]cnt;

always @(posedge clk or negedge rst) begin 
if (!rst || cnt == NUM - 1)
cnt <= 25'd0;
else 
cnt <= cnt + 1'd1;
end

always @(posedge clk or negedge rst) begin 
if (!rst)
flag <= 1'b0;
else if (cnt == NUM -1)
flag <= 1'b1;
else 
flag <= 1'b0;
end

endmodule

//module div(
//    input wire clk,
//    input wire rst,
//    output reg clk_
//);

//reg flag;
//counter c(.clk(clk), .rst(rst), .flag(flag));

//always @ (posedge clk or negedge rst) begin
//if (!rst )
//clk_ <= 0;
//else if (flag == 1'b1)
//clk_ = ~clk_;
//else
//;
//end

//endmodule 