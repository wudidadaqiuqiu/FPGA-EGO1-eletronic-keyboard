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
