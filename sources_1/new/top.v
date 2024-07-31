module top (
    input wire clk,   //100Mhz时钟
    input wire rst,   //复位键
    // output wire [0:7] led,   //LED灯
    output wire hsync,vsync,  //VGA行和场信号
    output reg [3:0] red,green,blue  //输出像素
    // output wire [0:7] seg_cs,seg_data0   //数码管显示模块
);

wire clk25,clr,vidon;
wire [9:0] hc,vc;    //当前行和场的值

clkdiv U1(.clk(clk),    //时钟模块，参数25MHz分频，用于屏幕的刷新
        .clk25(clk25));

vga U2(.clk25(clk25),   //vga信号输出模块
        .hsync(hsync),
        .vsync(vsync),
        .hc(hc),
        .vc(vc),
        .vidon(vidon));

always @(posedge clk25) begin
    if (vidon == 1) begin
        red = 4'b0000;
        green = 4'b1111;   //食物为绿色
        blue = 4'b0000;
    end else begin
        red = 0;   //这里三个置零起到消隐作用
        blue = 0;
        green = 0;
    end
end
endmodule


module vga_test(
    input wire clk,   //100Mhz时钟
    input wire rst,   //复位键
    input wire [15:0] switchs,
    input wire but,
    // output wire [0:7] led,   //LED灯
    output wire hsync,vsync,  //VGA行和场信号
    output wire [3:0] red,green,blue,  //输出像素
    output wire [15:0] led
);

wire vga_clk;
wire [9:0] pix_x, pix_y;
wire [11:0] pix_data;

vga_driver vga(
    .clk(clk),
    .rst(rst),
    .pix_data(pix_data),
    .vga_clk(vga_clk),
    .hsync(hsync),
    .vsync(vsync),
    .rgb({red, green, blue}),
    .pix_x(pix_x),
    .pix_y(pix_y)
);



parameter OBJ_WIDTH = 66, MAX_LEN = 16;
wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed;

wire butf;
wire [5:0] obj_arr_len;
fliter u1(.clk(clk), .rst(rst), .data(but), .df(butf));

basic_graph graph(.vga_clk(vga_clk), .rst(rst), .pix_x(pix_x), .pix_y(pix_y), 
                    .obj_arr_packed(obj_arr_packed), 
                    .obj_arr_len(obj_arr_len), .pix_data(pix_data));
painter #(.OBJ_WIDTH(OBJ_WIDTH), .MAX_LEN(MAX_LEN)) u2(
        .clk(clk), .rst(rst), .sw(butf), 
        .obj_arr_packed(obj_arr_packed), .arr_len(obj_arr_len), .test_pin(led));

endmodule



module logo_graph (
    input wire vga_clk,
    input wire rst,
    input wire [9:0] pix_x,
    input wire [9:0] pix_y,
    output reg [11:0] pix_data //输出像素点色彩信息
 );

    reg [19:0]      rom_addr;
    reg rom_ena = 1'b1;
    wire [11:0]      douta;

    logo_rom u1 (
        .clka(vga_clk),    // input wire clka
        .ena(rom_ena),      // input wire ena
        .addra(rom_addr),  // input wire [19 : 0] addra
        .douta(douta)  // output wire [11 : 0] douta
    );

    wire            logo_area;  
    reg [9:0] logo_x = 10'd0, logo_y = 10'd0;
    parameter [9:0] logo_width = 10'd100;
    parameter [9:0] logo_height = 10'd91;

    assign logo_area = ((pix_y >= logo_y) & (pix_y < logo_y + logo_height) & 
                        (pix_x >= logo_x) & (pix_x < logo_x + logo_width)) ? 1'b1 : 1'b0;

    parameter BLACK = 12'h000,
            WHITE = 12'hfff,
            RED = 12'hf00,
            GREEN = 12'h0f0,
            BLUE = 12'H00F,
            YELLOW = 12'HFF0,
            FUCHSINE = 12'HF0F,
            CYAN = 12'H0FF,
            GREY = 12'H888,
            DARK_RED = 12'H800,
            DARK_GREEN = 12'H080,
            DARK_BLUE = 12'H008;
    
    
    always@(posedge vga_clk or negedge rst) begin
        if(rst == 1'b0)
            pix_data <= 12'd0;
        else if (pix_x >= 0 && pix_x < 640 && pix_y >= 0 && pix_y < 480) begin
            if (logo_area == 1'b1) begin
               rom_addr <= rom_addr + 20'd1;
               pix_data <= douta;
            end else begin
               rom_addr <= rom_addr;
               pix_data <= 20'd0;
            end
            if (pix_x >= logo_x + logo_width && pix_y >= logo_y + logo_height)
                rom_addr <= 20'd0;
        end else begin
            pix_data <= BLACK;
            // rom_addr <= 20'd0;
            // if (pix_y == 0)
            //     rom_addr <= 20'd0;
        end
    end
endmodule

`define BLACK       12'h000
`define WHITE       12'hfff
`define RED         12'hf00
`define GREEN       12'h0f0
`define BLUE        12'H00F
`define YELLOW      12'HFF0
`define FUCHSINE    12'HF0F
`define CYAN        12'H0FF
`define GREY        12'H888
`define DARK_RED    12'H800
`define DARK_GREEN  12'H080
`define DARK_BLUE   12'H008

`define NONE_ENUM 4'd0
`define RECTANGLE_ENUM 4'd1
`define CIRCLE_ENUM 4'd2
`define ROUNDRECT_ENUM 4'd3

module basic_graph #(parameter OBJ_WIDTH = 66, parameter MAX_LEN = 16, parameter LEN_BITS = 6)(
    input wire vga_clk,
    input wire rst,
    input wire [9:0] pix_x,
    input wire [9:0] pix_y,
    input wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed,
    input wire [LEN_BITS-1:0] obj_arr_len,
    output reg [11:0] pix_data //输出像素点色彩信息
);
    parameter 
            ENUML = 65,
            ENUMR = 65 - 4 + 1,
            XL= ENUMR-1,
            XR = ENUMR-10,
            YL = XR - 1,
            YR = XR - 10,
            WIDTHL = YR - 1,
            WIDTHR = YR - 10,
            HEIGHTL = WIDTHR - 1,
            HEIGHTR = WIDTHR - 10,
            RADIUSL = HEIGHTR - 1,
            RADIUSR = HEIGHTR - 10,
            COLORL = RADIUSR - 1,
            COLORR = 0,
            POSXL = 19,
            POSXR = 10,
            POSYL = 9,
            POSYR = 0,
            SCREEN_WIDTH = 640,
            SCREEN_HEIGHT = 480;

    function is_in_screen;
    input [19:0] pos;
    begin
        is_in_screen = (pos[POSXL:POSXR] >= 0 && pos[POSXL:POSXR] <= SCREEN_WIDTH &&
                        pos[POSYL:POSYR] >= 0 && pos[POSYL:POSYR] <= SCREEN_HEIGHT);
    end
    endfunction
    function is_obj_in_rectangle;
    input [19:0] pos;
    input [OBJ_WIDTH-1:0] obj;
    begin
        is_obj_in_rectangle = (pos[19:10] >= obj[XL: XR] && pos[19:10] < obj[XL:XR] + obj[WIDTHL:WIDTHR]
                        && pos[9:0] >= obj[YL: YR] && pos[9:0] < obj[YL:YR] + obj[HEIGHTL:HEIGHTR]);
    end
    endfunction

    function is_obj_in_circle;
    input [19:0] pos;
    input [OBJ_WIDTH-1:0] obj;

    reg signed [31:0] dis_sq;
    reg signed [31:0] r_2;
    reg signed [31:0] tempx, tempy;
    begin
        tempx = (pos[POSXL:POSXR] - obj[XL:XR]);
        tempy = (pos[POSYL:POSYR] - obj[YL:YR]);
        dis_sq = tempx * tempx + tempy * tempy;
        r_2 = obj[RADIUSL:RADIUSR] * obj[RADIUSL:RADIUSR];
        is_obj_in_circle = (dis_sq < r_2);
    end
    endfunction

    function [9:0] int_to_10;
    input integer i;
        begin
            int_to_10 = i[9:0];
        end
    endfunction
    function is_obj_in_rounded_rectangle;
    input [19:0] pos;
    input [OBJ_WIDTH-1:0] obj;

    reg signed [31:0] X,Y,W,H,R;

    begin
        X = obj[XL: XR];
        Y = obj[YL: YR];
        W = obj[WIDTHL:WIDTHR];
        H = obj[HEIGHTL:HEIGHTR];
        R = obj[RADIUSL:RADIUSR];
        if (2 * R >= W || 2 * R >= H)
            is_obj_in_rounded_rectangle = 0;
        else begin
            is_obj_in_rounded_rectangle = (
                is_obj_in_rectangle(pos, {4'd0, int_to_10(X+R), int_to_10(Y), 
                                    int_to_10(W - 2*R), int_to_10(H), 10'd0, 12'd0}) ||
                is_obj_in_rectangle(pos, {4'd0, int_to_10(X), int_to_10(Y+R), 
                                    int_to_10(W), int_to_10(H - 2*R), 10'd0, 12'd0}) ||
                is_obj_in_circle(pos,    {4'd0, int_to_10(X+R), int_to_10(Y+R), 10'd0, 10'd0, int_to_10(R), 12'd0}) ||
                is_obj_in_circle(pos,    {4'd0, int_to_10(X+W-R), int_to_10(Y+R), 10'd0, 10'd0, int_to_10(R), 12'd0}) ||
                is_obj_in_circle(pos,    {4'd0, int_to_10(X+R), int_to_10(Y+H-R), 10'd0, 10'd0, int_to_10(R), 12'd0}) ||
                is_obj_in_circle(pos,    {4'd0, int_to_10(X+W-R), int_to_10(Y+H-R), 10'd0, 10'd0, int_to_10(R), 12'd0})
            ) ? 1 : 0;
        end
    end
    endfunction
    // 定义一个多维数组来存储对象
    wire [OBJ_WIDTH-1:0] obj_arr [0:MAX_LEN-1];
    
    genvar i;
    generate
        for (i = 0; i < MAX_LEN; i = i + 1) begin : unpack
            // 从一维数组中解包到多维数组
            assign obj_arr[i] = obj_arr_packed[(i+1)*OBJ_WIDTH-1: OBJ_WIDTH * i];
        end
    endgenerate
    
    integer j;
    always@(posedge vga_clk or negedge rst) begin
        if(rst == 1'b0) begin
            pix_data <= `BLACK;
            
        end else if (!is_in_screen({pix_x, pix_y})) begin
            pix_data <= `BLACK;
        end else begin  : loop
            for (j = 0; j < MAX_LEN; j = j + 1) begin
                // if (obj_arr[j][ENUML:ENUMR] == `NONE_ENUM) begin
                //     pix_data <= `BLACK;
                //     disable loop;
                // end
                // if (obj_arr[j][ENUML:ENUMR] == RECTANGLE_ENUM && is_obj_in_rectangle(
                //     {pix_x, pix_y}, obj[j]))
                case (obj_arr[j][ENUML:ENUMR])
                    `NONE_ENUM : begin
                        pix_data <= `BLACK;
                        disable loop;
                    end 
                    `RECTANGLE_ENUM : begin
                        if (is_obj_in_rectangle({pix_x, pix_y}, obj_arr[j])) begin
                            pix_data <= obj_arr[j][COLORL:COLORR];
                            disable loop;
                        end
                    end
                    `CIRCLE_ENUM : begin
                        if (is_obj_in_circle({pix_x, pix_y}, obj_arr[j])) begin
                            pix_data <= obj_arr[j][COLORL:COLORR];
                            disable loop;
                        end
                    end
                    `ROUNDRECT_ENUM : begin
                        if (is_obj_in_rounded_rectangle({pix_x, pix_y}, obj_arr[j])) begin
                            pix_data <= obj_arr[j][COLORL:COLORR];
                            disable loop;
                        end
                    end
                    default: begin
                        pix_data <= `BLACK;
                        disable loop;
                    end
                endcase
            end
        end
    end

endmodule


module painter #(parameter OBJ_WIDTH = 66, parameter MAX_LEN = 16, parameter LEN_BITS = 6)(
    input wire clk,
    input wire rst,
    input wire sw,
    input wire [25:0] alpha_table,
    output wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed,
    output wire [LEN_BITS-1:0] arr_len,
    output wire [15:0] test_pin
);
    // 内部存储对象的数组
    reg [OBJ_WIDTH-1:0] obj_arr [0:MAX_LEN-1];
    reg [OBJ_WIDTH-1:0] obj_reg = { `RECTANGLE_ENUM, 10'd100, 10'd100, 10'd100, 10'd100,10'd100, `GREEN};
    
    reg [LEN_BITS-1:0] len = 0;

    assign test_pin = obj_arr[1][65:62];

    // 打包多维数组为一维数组
    // generate 在综合时运行
    genvar i;
    generate
        for (i = 0; i < MAX_LEN; i = i + 1) begin
            assign obj_arr_packed[(i+1)*OBJ_WIDTH-1: OBJ_WIDTH * i] = obj_arr[i];
        end
    endgenerate

    // always @(negedge sw) begin
    //     if (!rst) begin
    //         obj_arr[1] = { `ROUNDRECT_ENUM, 10'd100, 10'd100, 10'd100, 10'd100, 10'd100, `GREEN};
    //         // add_obj({ 4'd0, 10'd100, 10'd100, 10'd100, 10'd100,10'd100, `GREEN});
    //     end else
    //         obj_arr[1] = { `ROUNDRECT_ENUM, 10'd100, 10'd100, 10'd200, 10'd100, 10'd10, `WHITE};
    //         // add_obj({ 4'd0, 10'd200, 10'd200, 10'd100, 10'd100,10'd100, `WHITE});
    // end
    
    integer j;
    always@(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            obj_arr[2] = { `ROUNDRECT_ENUM, 10'd100, 10'd100, 10'd200, 10'd100, 10'd10, `WHITE};
            obj_arr[1] = { `ROUNDRECT_ENUM, 10'd100, 10'd100, 10'd40, 10'd40, 10'd5, `GREEN};
            obj_arr[0] = { `CIRCLE_ENUM, 10'd200, 10'd200, 10'd50, 10'd50, 10'd50, `RED};
            obj_arr[3] = { `NONE_ENUM, 10'd150, 10'd150, 10'd20, 10'd10, 10'd10, `GREEN};
            
            // for (j = 0; j < MAX_LEN; j = j + 1) begin
            //     obj_arr[j] =  { 4'd0, 10'd200, 10'd200, 10'd100, 10'd100, `WHITE};
            // end
        end else begin
            // 
            // add_obj(obj_reg);
        end
    end

    task add_obj;
        input [OBJ_WIDTH-1:0] obj;
        begin
            if (len < MAX_LEN) begin
                obj_arr[len] <= obj;
                len <= len + 1;
            end else 
                len <= 0;
        end
    endtask
endmodule

module audio_and_vga (
    input clk,          //100MHZ
    input rst,
    // 
    output wire [15:0] led,
    // keyboard
    input PS2C,
    input PS2D,
    // sw button
    input wire [15:0] switchs,
    input wire but,
    // audio
    output sd,          // AUDIO_SD    
    output  audio_out,   // AUDIO_PWM
    // vga
    output wire hsync,vsync,  //VGA行和场信号
    output wire [3:0] red,green,blue  //输出像素
);
    wire    [20:0]  key_table;
    wire    [20:0]  updated_table;
    wire    [20:0]  tone;
    
    keyboard u1(.clk(clk), .rst(rst), .PS2C(PS2C), .PS2D(PS2D), 
            .alpha_table(key_table), .updated_table(updated_table));
    
    assign tone = (updated_table==21'b0_0000_0000_0000_0000_0001) ? 1:
                  (updated_table==21'b0_0000_0000_0000_0000_0010) ? 2:
                  (updated_table==21'b0_0000_0000_0000_0000_0100) ? 3:
                  (updated_table==21'b0_0000_0000_0000_0000_1000) ? 4:
                  (updated_table==21'b0_0000_0000_0000_0001_0000) ? 5:
                  (updated_table==21'b0_0000_0000_0000_0010_0000) ? 6:
                  (updated_table==21'b0_0000_0000_0000_0100_0000) ? 7:
                  (updated_table==21'b0_0000_0000_0000_1000_0000) ? 8: 
                  (updated_table==21'b0_0000_0000_0001_0000_0000) ? 9:
                  (updated_table==21'b0_0000_0000_0010_0000_0000) ? 10:
                  (updated_table==21'b0_0000_0000_0100_0000_0000) ? 11:
                  (updated_table==21'b0_0000_0000_1000_0000_0000) ? 12: 
                  (updated_table==21'b0_0000_0001_0000_0000_0000) ? 13:
                  (updated_table==21'b0_0000_0010_0000_0000_0000) ? 14:
                  (updated_table==21'b0_0000_0100_0000_0000_0000) ? 15:
                  (updated_table==21'b0_0000_1000_0000_0000_0000) ? 16:
                  (updated_table==21'b0_0001_0000_0000_0000_0000) ? 17:
                  (updated_table==21'b0_0010_0000_0000_0000_0000) ? 18:
                  (updated_table==21'b0_0100_0000_0000_0000_0000) ? 19:
                  (updated_table==21'b0_1000_0000_0000_0000_0000) ? 20:
                  (updated_table==21'b1_0000_0000_0000_0000_0000) ? 21:0;
    audio_port audio(
        .clk(clk),//100MHZ时钟
        .tone(tone),//音调指令接收
        .sd(sd),//低通滤波器使能
        .audio_out(audio_out)//音调输出
    );
endmodule

