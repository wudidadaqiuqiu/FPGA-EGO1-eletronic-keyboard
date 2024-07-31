module keyboard_scan(
    input clk,
    input rst,
    input PS2C,
    input PS2D,
    output wire [15:0] xkey,
    output wire [21:0] data,
    output reg data_in
	);

    reg PS2Cf;
    reg PS2Df;
    reg [0:4] cnt;
    reg [0:7] smg;
    reg [3:0] num;
    reg [1:0] clk_25MHz;
    reg [7:0] ps2c_filter,ps2d_filter;
    reg [10:0] shift1,shift2;
    reg DIR = 1'b0;

    always @(posedge clk) begin  //25MHZ
		if(clk_25MHz >= 3) begin
			DIR <= 1'b1;
			clk_25MHz <= 0;
		end else begin
			clk_25MHz <= clk_25MHz + 1;
			DIR <= 1'b0;
		end
    end

    //filter for PS2 clock and data
    always @(posedge DIR) begin
        if(!rst) begin
            ps2c_filter <= 0;
            ps2d_filter <= 0;
            PS2Cf <= 1;
            PS2Df <= 1;
		end else begin
            ps2c_filter[7]<=PS2C;
            ps2c_filter[6:0]<=ps2c_filter[7:1];
            ps2d_filter[7]<=PS2D;
            ps2d_filter[6:0]<=ps2d_filter[7:1];
            if(ps2c_filter==8'b11111111)
                PS2Cf <= 1;
            else if(ps2c_filter == 8'b00000000)
                PS2Cf <= 0;
            if(ps2d_filter == 8'b11111111)
                PS2Df <= 1;
            else if(ps2d_filter == 8'b00000000)
                PS2Df <= 0;
		end
	end

    reg [3:0] count;
    always @(negedge PS2Cf or negedge rst) begin
		if(!rst) begin
			count <= 0;
		end else begin
			if (count >= 10 && PS2Df == 1'b1) begin
				count <= 0;
				data_in <= 1'b1;
			end else begin
				data_in <= 1'b0;
				count <= count + 1;
			end
		end 
    end

    always @(negedge PS2Cf or negedge rst) begin
		if(!rst) begin
			shift1 <= 0;
			shift2 <= 0;
		end else begin
			shift1 <= {PS2Df,shift1[10:1]};
			shift2 <= {shift1[0],shift2[10:1]};
		end 
    end

    
    
    assign xkey = {shift2[8:1],shift1[8:1]};
    assign data = {shift2, shift1};
    // assign data_in = (count >= 11) ? 1 : 0;
endmodule

module keyboard_driver (
    input clk,
    input rst,
    input PS2C,
    input PS2D,
    output reg [20:0] alpha_table
	);
    parameter [4:0] Q_INDEX =5'b00000,
                    W_INDEX =5'b00001,
                    E_INDEX =5'b00010,
                    R_INDEX =5'b00011,
                    T_INDEX =5'b00100,
                    Y_INDEX =5'b00101,
                    U_INDEX =5'b00110,
                            
                    A_INDEX =5'b00111,
                    S_INDEX =5'b01000,
                    D_INDEX =5'b01001,
                    F_INDEX =5'b01010,
                    G_INDEX =5'b01011,
                    H_INDEX =5'b01100,
                    J_INDEX =5'b01101,
                            
                    Z_INDEX =5'b01110,
                    X_INDEX =5'b01111,
                    C_INDEX =5'b10000,
                    V_INDEX =5'b10001,
                    B_INDEX =5'b10010,
                    N_INDEX =5'b10011,
                    M_INDEX =5'b10100;
                     
    wire [15:0] xkey;
    wire [21:0] ps_data;
    wire data_in;
    keyboard_scan scan(.clk(clk), .rst(rst), .PS2C(PS2C), .PS2D(PS2D), 
                        .xkey(xkey), .data(ps_data), .data_in(data_in));

    wire [7:0] now_key, pre_key;
    wire [10:0] now_frame, pre_frame;
    assign now_key = xkey[7:0];
    assign pre_key = xkey[15:8];
    assign now_frame = ps_data[10:0];
    assign pre_frame = ps_data[21:11];

    // 使用 clk 进入always
    always @(posedge clk) begin
		if (!rst) begin
			alpha_table <= 0;
		end else if (data_in) begin
			if (now_frame[10] == 1 && now_frame[0] == 0 && pre_frame[10] == 1 && pre_frame[0] == 0) begin
				if (pre_key == 8'hf0) begin
					// 松开全0
					alpha_table <= 0;
				end else begin
					case (now_key)
						8'h15: alpha_table[Q_INDEX] <= 1;
						8'h1d: alpha_table[W_INDEX] <= 1;
						8'h24: alpha_table[E_INDEX] <= 1;
						8'h2d: alpha_table[R_INDEX] <= 1;
						8'h2c: alpha_table[T_INDEX] <= 1;
						8'h35: alpha_table[Y_INDEX] <= 1;
						8'h3c: alpha_table[U_INDEX] <= 1;

						8'h1c: alpha_table[A_INDEX] <= 1;
						8'h1b: alpha_table[S_INDEX] <= 1;
						8'h23: alpha_table[D_INDEX] <= 1;
						8'h2b: alpha_table[F_INDEX] <= 1;
						8'h34: alpha_table[G_INDEX] <= 1;
						8'h33: alpha_table[H_INDEX] <= 1;
						8'h3b: alpha_table[J_INDEX] <= 1;

						8'h1a: alpha_table[Z_INDEX] <= 1;
						8'h22: alpha_table[X_INDEX] <= 1;
						8'h21: alpha_table[C_INDEX] <= 1;
						8'h2a: alpha_table[V_INDEX] <= 1;
						8'h32: alpha_table[B_INDEX] <= 1;
						8'h31: alpha_table[N_INDEX] <= 1;
						8'h3a: alpha_table[M_INDEX] <= 1;
					default begin

					end
					endcase
				end
			end
        end
    end
endmodule


// module test_keyboard2 (
//     input wire clk,
//     input wire rst,
//     input wire PS2C,
//     input wire PS2D,
//     output [0:7] seg_cs,
//     output [0:7] seg_data0,
//     output wire [15:0] led
//    // output wire pin_test
// );
//     // assign test_pin = {PS2D, PS2C};
//     wire [20:0] alpha_table;
//     keyboard_driver u1(.clk(clk), .rst(rst), .PS2C(PS2C), .PS2D(PS2D), .alpha_table(alpha_table));

//     assign led[3:0] = alpha_table;
//     //assign pin_test = PS2D;
// endmodule

module key_process (
	input wire clk,
	input wire rst,
	input wire [20:0] key_out,
	output reg [20:0] updated_key
	);
	reg [20:0] pre_key_out=21'b0;
	always@(posedge clk) begin
		if (!rst) begin
			pre_key_out <= key_out;
			updated_key <= 0;			
		end else begin
			pre_key_out <= key_out;
			if (pre_key_out < key_out) begin
				updated_key <= (key_out - pre_key_out);
			end else if (pre_key_out > key_out) begin
				updated_key <= key_out;
			end
		end
    end
endmodule

module keyboard (
	input clk,
    input rst,
    input PS2C,
    input PS2D,
    output wire [20:0] alpha_table,
	output wire [20:0] updated_key
);
	keyboard_driver driver(.clk(clk), .rst(rst), .PS2C(PS2C), .PS2D(PS2D), .alpha_table(alpha_table));
	key_process process(.clk(clk), .rst(rst))
endmodule