//640*480
module vga (
    input wire clk25,
    output reg hsync,
    output reg vsync,
    output reg [9:0] hc,
    output reg [9:0] vc,
    output reg vidon
);

    parameter hpixels = 10'b1100100000;    //行像素点，800
    parameter vlines = 10'b1000001001;    //行数，521
    parameter hbp = 10'b0010010000;       //行显示后沿，144（128+16）
    parameter hfp = 10'b1100010000;       //行显示前沿784（128+16+640）
    parameter vbp = 10'b0000011111;       //场显示后延，31（2+29）
    parameter vfp = 10'b0111111111;       //场显示前沿，511（2+29+480）
    
    reg vsenable;

    always @(posedge clk25) begin
    if(hc == hpixels - 1)
    begin
        hc <= 0;
        vsenable <= 1;
    end
    else
    begin
        hc <= hc +1;
        vsenable <= 0;
    end 
    end

    always @(*) begin
    if(hc < 96)  //同步为96
        hsync = 0;
    else
        hsync = 1;
    end

    always @(posedge clk25) begin
    if(vsenable == 1)
    begin
        if(vc == vlines - 1)
            vc <= 0;
        else
            vc <= vc + 1;
    end
    else
        vc <= vc;   
    end

    always @(*) begin
    if(vc < 2)   //同步为2
        vsync = 0;
    else
        vsync = 1;
    end

    always @(*) begin
    if((hc < hfp)&&(hc >= hbp)&&(vc < vfp)&&(vc >= vbp))
        vidon = 1;
    else
        vidon = 0;
    end
endmodule

module vga_pix (
    input wire [9:0] hc,
    input wire [9:0] vc,
    output wire [9:0] pix_x,
    output wire [9:0] pix_y
);

    parameter hbp = 10'd144;       //行显示后沿，144（128+16）
    parameter hfp = 10'd784;       //行显示前沿784（128+16+640）
    parameter vbp = 10'b0000011111;       //场显示后延，31（2+29）
    parameter vfp = 10'b0111111111;       //场显示前沿，511（2+29+480）
    
    wire pix_data_req ; //像素点色彩信息请求信号
    //pix_data_req:像素点色彩信息请求信号,超前rgb_valid信号一个时钟周期
    assign pix_data_req = (((hc >= hbp - 1'b1)
                            && (hc < hfp - 1'b1))
                            &&((vc >= vbp)
                            && (vc < vfp)))
                            ? 1'b1 : 1'b0;

     //pix_x,pix_y:VGA有效显示区域像素点坐标
    assign pix_x = (pix_data_req == 1'b1)
            ? (hc - (hbp - 1'b1)) : 10'h3ff;
    assign pix_y = (pix_data_req == 1'b1)
            ? (vc - vbp) : 10'h3ff;

endmodule

module vga_graph (
    input wire vga_clk,
    input wire rst,
    input wire [9:0] pix_x,
    input wire [9:0] pix_y,
    output reg [11:0] pix_data //输出像素点色彩信息
);

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
    
    reg [47:0] color_index = {RED, GREEN, BLUE, YELLOW};
    
    always@(posedge vga_clk or negedge rst) begin
        if(rst == 1'b0)
            pix_data <= 12'd0;
        else if (pix_x >= 0 && pix_x < 640/2 && pix_y >= 0 && pix_y < 480/2)
            if (pix_x < 10 && pix_y < 10) 
               pix_data <= RED;
            else 
                pix_data <= GREY;
        else if (pix_x >= 0 && pix_x < 640/2 && pix_y >= 480/2 && pix_y < 480) 
            pix_data <= GREEN;
        else if (pix_x >= 640/2 && pix_x < 640 && pix_y >= 0 && pix_y < 480/2) 
            pix_data <= YELLOW;
        else if (pix_x >= 640/2 && pix_x < 640 && pix_y >= 480/2 && pix_y < 480) 
            pix_data <= BLUE;
        else
            pix_data <= 12'd0;
    end
endmodule

module vga_driver (
    input wire clk,
    input wire rst,
    input wire [11:0] pix_data,
    output wire vga_clk,
    output wire hsync,
    output wire vsync,
    output wire [11:0] rgb,
    output wire [9:0] pix_x,
    output wire [9:0] pix_y
);
    wire [9:0] hc;
    wire [9:0] vc;
    wire vidon;
    clkdiv vga_clk_div(.clk(clk), .clk25(vga_clk));
    vga vga_(.clk25(vga_clk), .hsync(hsync), .vsync(vsync), .hc(hc), .vc(vc), .vidon(vidon));
    vga_pix pix(.hc(hc), .vc(vc), .pix_x(pix_x), .pix_y(pix_y));
    
    assign rgb = (vidon == 1'b1) ? pix_data : 16'b0 ;
endmodule

module clkdiv (
    input wire clk,
    output wire clk25
);
    
    reg [21:0] q;
    always@(posedge clk)   begin
    if(q == 22'd4194303)
        q <= 0;
    else
        q <= q + 1;
    end
    assign clk25 = q[1];
endmodule