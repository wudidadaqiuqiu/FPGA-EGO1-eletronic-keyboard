module fliter(
    input wire clk,
    input wire rst,    
    input wire data,
    output reg df
);
    reg [7:0] f;
    always @(posedge clk) begin
        if (!rst) begin
            df <= 0;
        end else begin
            f[7]<=data;
            f[6:0]<=f[7:1];

            if(f==8'b11111111)
                df <= 1;
            else
                if(f == 8'b00000000)
                df <= 0;
        end
    end
endmodule