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



parameter OBJ_WIDTH = 56, MAX_LEN = 16;
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


module basic_graph #(parameter OBJ_WIDTH = 56, parameter MAX_LEN = 16)(
    input wire vga_clk,
    input wire rst,
    input wire [9:0] pix_x,
    input wire [9:0] pix_y,
    input wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed,
    input wire [5:0] obj_arr_len,
    output reg [11:0] pix_data //输出像素点色彩信息
);
    parameter 
            ENUML = 55,
            ENUMR = 55 - 4 + 1,
            XL= 55-4,
            XR = 55-4-10+1,
            YL = XR - 1,
            YR = XR - 10,
            WIDTHL = YR - 1,
            WIDTHR = YR - 10,
            HEIGHTL = WIDTHR - 1,
            HEIGHTR = WIDTHR - 10,
            COLORL = HEIGHTR - 1,
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
    function is_in_rectangle;
    input [19:0] pos;
    input [55:0] obj;
    begin
        is_in_rectangle = (pos[19:10] >= obj[XL: XR] && pos[19:10] < obj[XL:XR] + obj[WIDTHL:WIDTHR]
                        && pos[9:0] >= obj[YL: YR] && pos[9:0] < obj[YL:YR] + obj[HEIGHTL:HEIGHTR]);
    end
    endfunction

    function is_in_circle;
    input [19:0] pos;
    input [55:0] obj;

    reg signed [31:0] dis_sq;
    reg signed [31:0] r_2;
    reg signed [31:0] tempx, tempy;
    begin
        tempx = (pos[POSXL:POSXR] - obj[XL:XR]);
        tempy = (pos[POSYL:POSYR] - obj[YL:YR]);
        dis_sq = tempx * tempx + tempy * tempy;
        r_2 = obj[WIDTHL:WIDTHR] * obj[WIDTHL:WIDTHR];
        is_in_circle = (dis_sq <= r_2);
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
    
    always@(posedge vga_clk or negedge rst) begin
        if(rst == 1'b0) begin
            pix_data <= `BLACK;
            
        end else if (!is_in_screen({pix_x, pix_y}))
            pix_data <= `BLACK;
        else if (is_in_circle({pix_x, pix_y}, obj_arr[2])) 
            pix_data <= obj_arr[2][COLORL:COLORR];
        else begin
            pix_data <= `BLACK;
        end
    end

endmodule


module painter #(parameter OBJ_WIDTH = 56, parameter MAX_LEN = 16)(
    input wire clk,
    input wire rst,
    input wire sw,
    output wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed,
    output wire [5:0] arr_len,
    output wire [15:0] test_pin
);
    // 内部存储对象的数组
    reg [OBJ_WIDTH-1:0] obj_arr [0:MAX_LEN-1];
    reg [55:0] obj_reg = { 4'd0, 10'd100, 10'd100, 10'd100, 10'd100, `GREEN};
    
    reg [5:0] len = 0;

    assign test_pin[6:0] = len;

    // 打包多维数组为一维数组
    // generate 在综合时运行
    genvar i;
    generate
        for (i = 0; i < MAX_LEN; i = i + 1) begin
            assign obj_arr_packed[(i+1)*OBJ_WIDTH-1: OBJ_WIDTH * i] = obj_arr[i];
        end
    endgenerate

    always @(negedge sw) begin
        if (!rst) begin
            add_obj({ 4'd0, 10'd100, 10'd100, 10'd100, 10'd100, `GREEN});
        end else
            add_obj({ 4'd0, 10'd200, 10'd200, 10'd100, 10'd100, `WHITE});
    end
    
    integer j;
    always@(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
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