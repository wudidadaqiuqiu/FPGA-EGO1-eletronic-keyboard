module top(
    input clk,          //100MHZ
    input rst,
    input PS2C,
    input PS2D,
    output sd,          // AUDIO_SD    
    output  audio_out   // AUDIO_PWM
    // output [0:3] seg_cs,
    // output [0:7] seg_data0,
    // output wire [15:0] led
    );
    wire    [4:0]   tone;
    wire    [20:0]  key_out;
    reg     [20:0]  new_key_out;
    reg     [20:0]  pre_key_out=21'b0;
    
    always@(posedge clk) begin
        pre_key_out <= key_out;
        if (pre_key_out < key_out) begin
            new_key_out <= (key_out - pre_key_out);
        end else if (pre_key_out > key_out) begin
            new_key_out <= key_out;
        end
    end

    assign tone = (new_key_out==21'b0_0000_0000_0000_0000_0001) ? 1:
                  (new_key_out==21'b0_0000_0000_0000_0000_0010) ? 2:
                  (new_key_out==21'b0_0000_0000_0000_0000_0100) ? 3:
                  (new_key_out==21'b0_0000_0000_0000_0000_1000) ? 4:
                  (new_key_out==21'b0_0000_0000_0000_0001_0000) ? 5:
                  (new_key_out==21'b0_0000_0000_0000_0010_0000) ? 6:
                  (new_key_out==21'b0_0000_0000_0000_0100_0000) ? 7:
                  (new_key_out==21'b0_0000_0000_0000_1000_0000) ? 8: 
                  (new_key_out==21'b0_0000_0000_0001_0000_0000) ? 9:
                  (new_key_out==21'b0_0000_0000_0010_0000_0000) ? 10:
                  (new_key_out==21'b0_0000_0000_0100_0000_0000) ? 11:
                  (new_key_out==21'b0_0000_0000_1000_0000_0000) ? 12: 
                  (new_key_out==21'b0_0000_0001_0000_0000_0000) ? 13:
                  (new_key_out==21'b0_0000_0010_0000_0000_0000) ? 14:
                  (new_key_out==21'b0_0000_0100_0000_0000_0000) ? 15:
                  (new_key_out==21'b0_0000_1000_0000_0000_0000) ? 16:
                  (new_key_out==21'b0_0001_0000_0000_0000_0000) ? 17:
                  (new_key_out==21'b0_0010_0000_0000_0000_0000) ? 18:
                  (new_key_out==21'b0_0100_0000_0000_0000_0000) ? 19:
                  (new_key_out==21'b0_1000_0000_0000_0000_0000) ? 20:
                  (new_key_out==21'b1_0000_0000_0000_0000_0000) ? 21:0
                  ;
    //assign led = {11'd0, new_key_out};
  
    
    keyboard_driver U1(.clk(clk), .rst(rst), .PS2C(PS2C), .PS2D(PS2D),
                        .alpha_table(key_out));
    audio_port U2(.clk(clk), .sd(sd), .SD(SD), .tone(tone), .audio_out(audio_out));
endmodule
