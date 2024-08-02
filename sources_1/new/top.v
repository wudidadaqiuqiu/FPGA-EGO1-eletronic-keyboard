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

`define AZIMO  512'h00000000000000000000070007000F000F800D800D80198019C018C01FC030E030E0306060606070F8F800000000000000000000000000000000000000000000
`define BZIMO  512'h000000000000000000007F8039E038E038E038E038E039C03F8038E03860387038703870387038E07FC000000000000000000000000000000000000000000000
`define CZIMO  512'h0000000000000000000007E01CE03870383030307000700070007000700070007030383038601CE00F8000000000000000000000000000000000000000000000
`define DZIMO  512'h00000000000000000000FF0039C038E038E03870387038703870387038703870387038E038E039C0FF0000000000000000000000000000000000000000000000
`define EZIMO  512'h00000000000000000000FFE070E0703070307000718071807F807180718071807000703070307060FFE000000000000000000000000000000000000000000000
`define FZIMO  512'h00000000000000000000FFE070E0703070307000718071807F807180718071807000700070007000FC0000000000000000000000000000000000000000000000
`define GZIMO  512'h000000000000000000000F801CC0386038603060700070007000700073F870E070E038E038E01CE00F8000000000000000000000000000000000000000000000
`define HZIMO  512'h00000000000000000000F8F87070707070707070707070707FF07070707070707070707070707070F8F800000000000000000000000000000000000000000000
`define IZIMO  512'h000000000000000000003FE0070007000700070007000700070007000700070007000700070007003FE000000000000000000000000000000000000000000000
`define JZIMO  512'h000000000000000000001FF0038003800380038003800380038003800380038003800380038003800380738077003E0000000000000000000000000000000000
`define KZIMO  512'h00000000000000000000FBE071C07380730076007C007E007E007F0073007380718071C070C070E0F9F000000000000000000000000000000000000000000000
`define LZIMO  512'h00000000000000000000FC0070007000700070007000700070007000700070007000703070307060FFE000000000000000000000000000000000000000000000
`define MZIMO  512'h00000000000000000000F0F071E071E079E079E07BE07BE07BE07FE07FE07EE06EE06EE06EE06CE0F1F000000000000000000000000000000000000000000000
`define NZIMO  512'h0000000000000000000079F838603C603C603E603E6037603760336033E031E031E031E030E030E0FC6000000000000000000000000000000000000000000000
`define OZIMO  512'h000000000000000000000F801DC038E0386070707070707070707070707070707070386038E01DC00F8000000000000000000000000000000000000000000000
`define PZIMO  512'h00000000000000000000FF8070E07070707070707070707071E07F80700070007000700070007000FC0000000000000000000000000000000000000000000000
`define QZIMO  512'h000000000000000000000F801DC038E0386070707070707070707070707070707F703B603BE01DC00F8001F000E0000000000000000000000000000000000000
`define RZIMO  512'h00000000000000000000FFC070E0707070707070707070E07F8073007380718071C070E070E07070F87800000000000000000000000000000000000000000000
`define SZIMO  512'h000000000000000000001FE038E070607060700078003E001F8007E001E000F060706070707038E00FC000000000000000000000000000000000000000000000
`define TZIMO  512'h000000000000000000007FF06730C718C718070007000700070007000700070007000700070007001FC000000000000000000000000000000000000000000000
`define UZIMO  512'h000000000000000000007CF038603860386038603860386038603860386038603860386038601CC00F8000000000000000000000000000000000000000000000
`define VZIMO  512'h00000000000000000000F8F0706030C030C038C038C0198019801D801D800F000F000F000E000600060000000000000000000000000000000000000000000000
`define WZIMO  512'h00000000000000000000FFF867306330733073303760376037E037E03DE03DC01DC01DC019C01980198000000000000000000000000000000000000000000000
`define XZIMO  512'h000000000000000000007DF038C018C01CC00D800F8007000600070007000F800D8019C018C030E079F000000000000000000000000000000000000000000000
`define YZIMO  512'h00000000000000000000F8F870303060386018C01CC01F800F800F000700070007000700070007001FC000000000000000000000000000000000000000000000
`define ZZIMO  512'h000000000000000000003FF0386070E060C001C0018003000300060006000C001C001830383030607FE000000000000000000000000000000000000000000000

`define ALPHA_TABLE_SIZE 21
`define ALPHA_TABLE_TOTAL_BITS (`ALPHA_TABLE_SIZE * 512)
`define ALPHA_TABLE {`QZIMO, `WZIMO, `EZIMO, `RZIMO, `TZIMO, `YZIMO, `UZIMO,    `AZIMO, `SZIMO, `DZIMO, `FZIMO, `GZIMO, `HZIMO, `JZIMO,    `ZZIMO, `XZIMO, `CZIMO, `VZIMO, `BZIMO, `NZIMO, `MZIMO}

`define __ 5'd31
`define DO_1 5'd0
`define RE_2 5'd1
`define MI_3 5'd2
`define FA_4 5'd3
`define SO_5 5'd4
`define LA_6 5'd5
`define XI_7 5'd6

`define DO1 5'd7
`define RE2 5'd8
`define MI3 5'd9
`define FA4 5'd10
`define SO5 5'd11
`define LA6 5'd12
`define XI7 5'd13

`define _DO1 5'd14
`define _RE2 5'd15
`define _MI3 5'd16
`define _FA4 5'd17
`define _SO5 5'd18
`define _LA6 5'd19
`define _XI7 5'd20


module vga_test(
    input wire clk,   //100Mhz时钟
    input wire rst,   //复位键
    input wire [15:0] switchs,
    input wire but,
    // output wire [0:7] led,   //LED灯
    output wire hsync,vsync,  //VGA行和场信号
    output wire [3:0] red,green,blue,  //输出像素
    output wire [15:0] led,
    input wire [20:0] key_alpha_table,
    input wire [20:0] updated_table
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



    parameter OBJ_WIDTH = 66, MAX_LEN = 23;
    wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed;

    wire butf;
    wire [5:0] obj_arr_len;
    fliter u1(.clk(clk), .rst(rst), .data(but), .df(butf));

    wire [12-1:0] song_pix, obj_pix;
    wire use_obj_pix;
    basic_graph #(.OBJ_WIDTH(OBJ_WIDTH), .MAX_LEN(MAX_LEN)) graph(
        .vga_clk(vga_clk), .clk(clk), .rst(rst), .pix_x(pix_x), .pix_y(pix_y), 
        .obj_arr_packed(obj_arr_packed), 
        .obj_arr_len(obj_arr_len), .pix_data(pix_data), .song_pix(song_pix), 
        .obj_pix(obj_pix), .use_obj_pix(use_obj_pix));

    
    // painter #(.OBJ_WIDTH(OBJ_WIDTH), .MAX_LEN(MAX_LEN)) u2(
    //         .clk(clk), .rst(rst), .sw(butf),
    //         .key_alpha_table(key_alpha_table),
    //         .updated_table(updated_table),
    //         .obj_arr_packed(obj_arr_packed), .arr_len(obj_arr_len), .test_pin(led));
    obj_manage #(.OBJ_WIDTH(OBJ_WIDTH), .MAX_LEN(MAX_LEN)) obj_manager(
        .vga_clk(vga_clk), .clk(clk), .rst(rst), 
        .key_alpha_table(key_alpha_table),
        .pix_x(pix_x), .pix_y(pix_y), .obj_pix(obj_pix), .use_obj_pix(use_obj_pix));

    song_change subtitle(.clk(clk), .rst(rst), .pix_x(pix_x), .pix_y(pix_y), .song_pix(song_pix));
endmodule




module basic_graph #(parameter OBJ_WIDTH = 66, parameter MAX_LEN = 21, parameter LEN_BITS = 6)(
    input wire vga_clk,
    input wire clk,
    input wire rst,
    input wire [9:0] pix_x,
    input wire [9:0] pix_y,
    input wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed,
    input wire [LEN_BITS-1:0] obj_arr_len,
    output wire [11:0] pix_data, //输出像素点色彩信息
    input wire [12-1:0] song_pix,
    input wire [12-1:0] obj_pix,
    input wire use_obj_pix
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


    wire [511:0] ALPHA_TABLE [0:21-1];
    assign ALPHA_TABLE[0] = `QZIMO;
    assign ALPHA_TABLE[1] = `WZIMO;
    assign ALPHA_TABLE[2] = `EZIMO;
    assign ALPHA_TABLE[3] = `RZIMO;
    assign ALPHA_TABLE[4] = `TZIMO;
    assign ALPHA_TABLE[5] = `YZIMO;
    assign ALPHA_TABLE[6] = `UZIMO;
    assign ALPHA_TABLE[7] = `AZIMO;
    assign ALPHA_TABLE[8] = `SZIMO;
    assign ALPHA_TABLE[9] = `DZIMO;
    assign ALPHA_TABLE[10] = `FZIMO;
    assign ALPHA_TABLE[11] = `GZIMO;
    assign ALPHA_TABLE[12] = `HZIMO;
    assign ALPHA_TABLE[13] = `JZIMO;
    assign ALPHA_TABLE[14] = `ZZIMO;
    assign ALPHA_TABLE[15] = `XZIMO;
    assign ALPHA_TABLE[16] = `CZIMO;
    assign ALPHA_TABLE[17] = `VZIMO;
    assign ALPHA_TABLE[18] = `BZIMO;
    assign ALPHA_TABLE[19] = `NZIMO;
    assign ALPHA_TABLE[20] = `MZIMO;

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

        reg [19:0] dis_sq;
        // reg [31:0] r_2;
        reg [19:0] tempx, tempy;
        begin
            tempx = (pos[POSXL:POSXR] > obj[XL:XR]) ? (pos[POSXL:POSXR] - obj[XL:XR]) : (obj[XL:XR] - pos[POSXL:POSXR]);
            tempy = (pos[POSYL:POSYR] > obj[YL:YR]) ? (pos[POSYL:POSYR] - obj[YL:YR]) : (obj[YL:YR] - pos[POSYL:POSYR]);
            dis_sq = tempx * tempx + tempy * tempy;
            // r_2 = ;
            is_obj_in_circle = (dis_sq < obj[RADIUSL:RADIUSR] * obj[RADIUSL:RADIUSR] * 20'd1);
        end
    endfunction

    function is_obj_in_rounded_rectangle;
        input [19:0] pos;
        input [OBJ_WIDTH-1:0] obj;

        reg [9:0] X,Y,W,H,R;
        
        begin
            X = obj[XL: XR];
            Y = obj[YL: YR];
            W = obj[WIDTHL:WIDTHR];
            H = obj[HEIGHTL:HEIGHTR];
            R = obj[RADIUSL:RADIUSR];
            if (32'd2 * R >= 32'd1 * W || 32'd2 * R >= 32'd1 * H)
                is_obj_in_rounded_rectangle = 0;
            else begin
                is_obj_in_rounded_rectangle = (
                    is_obj_in_rectangle(pos, {4'd0, (X+R), (Y), 
                                        (W - 3'd2*R), (H), 10'd0, 12'd0}) ||
                    is_obj_in_rectangle(pos, {4'd0, (X), (Y+R), 
                                        (W), (H - 3'd2*R), 10'd0, 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+R), (Y+R), 10'd0, 10'd0, (R), 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+W-R), (Y+R), 10'd0, 10'd0, (R), 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+R), (Y+H-R), 10'd0, 10'd0, (R), 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+W-R), (Y+H-R), 10'd0, 10'd0, (R), 12'd0})
                ) ? 1 : 0;
            end
        end
    endfunction


    // 定义一个多维数组来存储对象
    wire [OBJ_WIDTH-1:0] obj_arr [0:MAX_LEN-1];

    // 从一维数组中解包到多维数组
    genvar i;
    generate
        for (i = 0; i < MAX_LEN; i = i + 1) begin : unpack
            assign obj_arr[i] = obj_arr_packed[(i+1)*OBJ_WIDTH-1: OBJ_WIDTH * i];
        end
    endgenerate

    // reg is_in_upgreen
    // pix_data 赋值
    // integer j;
    assign pix_data = 
        (!rst) ? `BLACK : (
            (!is_in_screen({pix_x, pix_y})) ? `BLACK : (
                (pix_y < 120) ? 
                    song_pix : obj_pix
            )
        );

    // always@(posedge vga_clk or negedge rst) begin
    //     if(rst == 1'b0) begin
    //         pix_data <= `BLACK;
    //     end else if (!is_in_screen({pix_x, pix_y})) begin
    //         pix_data <= `BLACK;
    //     end else if (pix_y < 120) begin
    //         if (is_obj_in_rectangle({pix_x, pix_y}, {4'd0, 10'd320, 10'd0, 10'd2, 10'd50, 10'd0,`WHITE})) begin
    //             pix_data <= `GREEN;
    //         end else begin
    //             pix_data <= song_pix;
    //         end
    //     end else begin : loop // obj
    //         pix_data <= obj_pix;
            // pix_data <= obj_pix;
            // for (j = 0; j < MAX_LEN; j = j + 1) begin
            //     if (obj_arr[j][ENUML:ENUMR] == `NONE_ENUM) begin
            //         pix_data <= `BLACK;
            //         disable loop;
            //     end else if (obj_arr[j][ENUML:ENUMR] == `ROUNDRECT_ENUM) begin
            //         if (is_obj_in_rounded_rectangle({pix_x, pix_y}, obj_arr[j])) begin
            //             if (((pix_x) < 10'd16 + obj_arr[j][XL:XR] + 10'd15) && ((pix_y) < 10'd32 + obj_arr[j][YL:YR] + 10'd4) && 
            //                 ((pix_x) >= obj_arr[j][XL:XR] + 10'd15) && ((pix_y) >= obj_arr[j][YL:YR] + 10'd4)) begin // 字模方块内
            //                 if ((ALPHA_TABLE[j] << ((pix_x - obj_arr[j][XL:XR] - 10'd15) + (pix_y - obj_arr[j][YL:YR] - 10'd4) * 10'd16)) >> 511) begin
            //                     pix_data <= `BLACK;
            //                 end else begin // 填充
            //                     // pix_data <= `BLACK;
            //                     pix_data <= obj_arr[j][COLORL:COLORR];
            //                     // pix_data <= douta;
            //                 end
            //                 // pix_data <= obj_arr[j][COLORL:COLORR];
            //             end else begin // 填充
            //                 // pix_data <= `BLACK;
            //                 pix_data <= obj_arr[j][COLORL:COLORR];
            //                 // pix_data <= douta;
            //             end
            //             disable loop;
            //         // end else if (is_obj_in_rectangle({pix_x + 10'd1, pix_y}, obj_arr[j])) begin
            //             // rom_addr <= (pix_y - obj_arr[j][YL:YR]) * 16'd16;
            //         end
            //     end else begin
            //         pix_data <= `BLACK;
            //         disable loop;
            //     end
            // end

            
        // end
    // end

endmodule


module painter #(parameter OBJ_WIDTH = 66, parameter MAX_LEN = 21, parameter LEN_BITS = 6)(
    input wire clk,
    input wire rst,
    input wire sw,
    input wire [20:0] key_alpha_table,
    input wire [20:0] updated_table,
    output wire [(OBJ_WIDTH * MAX_LEN)-1:0] obj_arr_packed,
    output wire [LEN_BITS-1:0] arr_len,
    output wire [15:0] test_pin
    );
    parameter [9:0] KEYBOARD_X = 80, KEYBOARD_Y = 120, KEY_WIDTH = 45, 
                KEY_HEIGHT = 40, KEY_D1 = 10, KEY_D2 = 20+40,
                KEY_D3 = 30, KEY_D4 = 40, KEY_D5 = 120;

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

    parameter [OBJ_WIDTH-1:0] NONE = {`NONE_ENUM, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, `WHITE};
    
    parameter [OBJ_WIDTH-1:0] 
        Q_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        W_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + (KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        E_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd2*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        R_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd3*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        T_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd4*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        Y_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd5*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        U_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd6*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        
        A_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        S_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + (KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        D_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd2*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        F_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd3*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        G_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd4*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        H_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd5*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        J_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd6*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        
        Z_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        X_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + (KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        C_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd2*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        V_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd3*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        B_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd4*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        N_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd5*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        M_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd6*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE};

    
    // 内部存储对象的数组
    reg [OBJ_WIDTH-1:0] obj_arr [0:MAX_LEN-1];
    reg [LEN_BITS-1:0] len = 0;
    assign test_pin = obj_arr[1][65:62];

    // obj_arr 管理
    integer i1;
    always @(posedge clk or negedge rst) begin
        if(rst == 1'b0) begin
            obj_arr[0] <= Q_OBJ;
            obj_arr[1] <= W_OBJ;
            obj_arr[2] <= E_OBJ;
            obj_arr[3] <= R_OBJ;
            obj_arr[4] <= T_OBJ;
            obj_arr[5] <= Y_OBJ;
            obj_arr[6] <= U_OBJ;

            obj_arr[7] <= A_OBJ;
            obj_arr[8] <= S_OBJ;
            obj_arr[9] <= D_OBJ;
            obj_arr[10] <= F_OBJ;
            obj_arr[11] <= G_OBJ;
            obj_arr[12] <= H_OBJ;
            obj_arr[13] <= J_OBJ;

            obj_arr[14] <= Z_OBJ;
            obj_arr[15] <= X_OBJ;
            obj_arr[16] <= C_OBJ;
            obj_arr[17] <= V_OBJ;
            obj_arr[18] <= B_OBJ;
            obj_arr[19] <= N_OBJ;
            obj_arr[20] <= M_OBJ;
            obj_arr[21] <= NONE;
        end else if (!key_alpha_table) begin 
            for (i1 = 0; i1 < MAX_LEN; i1 = i1 + 1) begin
                obj_arr[i1][COLORL:COLORR] <= `WHITE;
            end
        end else begin
            for (i1 = 0; i1 < 21; i1 = i1 + 1) begin
                if ((key_alpha_table >> i1) % 2) begin
                    obj_arr[i1][COLORL:COLORR] <= `GREY;
                end
            end
            // obj_arr[updated_table/2][COLORL:COLORR] <= `GREY;
        end
    end

    // 打包多维数组为一维数组
    // generate 在综合时运行
    genvar i;
    generate
        for (i = 0; i < MAX_LEN; i = i + 1) begin
            assign obj_arr_packed[(i+1)*OBJ_WIDTH-1: OBJ_WIDTH * i] = obj_arr[i];
        end
    endgenerate

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
    wire    [4:0]  tone;
    
    keyboard u1(.clk(clk), .rst(rst), .PS2C(PS2C), .PS2D(PS2D), 
            .key_alpha_table(key_table), .updated_table(updated_table));
    
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

    vga_test test(
        .clk(clk),   //100Mhz时钟
        .rst(rst),   //复位键
        .switchs(switchs),  //拨码开关
        .but(but),
        .hsync(hsync),
        .vsync(vsync),  //VGA行和场信号
        .red(red),
        .green(green),
        .blue(blue),  //输出像素
        .led(led),
        .key_alpha_table(key_table),
        .updated_table(updated_table)
    );
endmodule

module obj_manage #(parameter OBJ_WIDTH = 66, parameter MAX_LEN = 21, parameter LEN_BITS = 6)(
    input wire vga_clk,
    input wire clk, 
    input wire rst,
    input wire [20:0] key_alpha_table,
    input wire [10-1:0] pix_x,
    input wire [10-1:0] pix_y,
    output reg [12-1:0] obj_pix,
    output reg use_obj_pix
    );
    parameter [9:0] KEYBOARD_X = 80, KEYBOARD_Y = 120, KEY_WIDTH = 45, 
            KEY_HEIGHT = 40, KEY_D1 = 10, KEY_D2 = 20+40,
            KEY_D3 = 30, KEY_D4 = 40, KEY_D5 = 120;

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

    parameter [OBJ_WIDTH-1:0] NONE = {`NONE_ENUM, 10'd0, 10'd0, 10'd0, 10'd0, 10'd0, `WHITE};
    
    parameter [OBJ_WIDTH-1:0]
        Q_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        W_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + (KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        E_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd2*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        R_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd3*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        T_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd4*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        Y_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd5*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        U_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd6*(KEY_WIDTH + KEY_D1)), (KEYBOARD_Y), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        
        A_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        S_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + (KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        D_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd2*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        F_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd3*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        G_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd4*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        H_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd5*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        J_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 3'd6*(KEY_WIDTH + KEY_D1) + KEY_D3), (KEYBOARD_Y + KEY_D2), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        
        Z_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        X_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + (KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        C_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd2*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        V_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd3*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        B_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd4*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        N_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd5*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE},
        M_OBJ = { `ROUNDRECT_ENUM, (KEYBOARD_X + 10'd6*(KEY_WIDTH + KEY_D1) + KEY_D4), (KEYBOARD_Y + KEY_D5), (KEY_WIDTH), (KEY_HEIGHT), 10'd5, `WHITE};

    parameter [0:`ALPHA_TABLE_TOTAL_BITS-1] ALPHA_TABLE_ = `ALPHA_TABLE;
    wire [511:0] alpha_table [0:21-1];
    genvar i2;
    generate
        for (i2 = 0; i2 < `ALPHA_TABLE_SIZE; i2 = i2 + 1) begin
            assign alpha_table[i2] = ALPHA_TABLE_[512*i2:(i2+1)*512-1];
        end
    endgenerate

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

        reg [19:0] dis_sq;
        // reg [31:0] r_2;
        reg [19:0] tempx, tempy;
        begin
            tempx = (pos[POSXL:POSXR] > obj[XL:XR]) ? (pos[POSXL:POSXR] - obj[XL:XR]) : (obj[XL:XR] - pos[POSXL:POSXR]);
            tempy = (pos[POSYL:POSYR] > obj[YL:YR]) ? (pos[POSYL:POSYR] - obj[YL:YR]) : (obj[YL:YR] - pos[POSYL:POSYR]);
            dis_sq = tempx * tempx + tempy * tempy;
            // r_2 = ;
            is_obj_in_circle = (dis_sq < obj[RADIUSL:RADIUSR] * obj[RADIUSL:RADIUSR] * 20'd1);
        end
    endfunction

    function is_obj_in_rounded_rectangle;
        input [19:0] pos;
        input [OBJ_WIDTH-1:0] obj;

        reg [9:0] X,Y,W,H,R;
        
        begin
            X = obj[XL: XR];
            Y = obj[YL: YR];
            W = obj[WIDTHL:WIDTHR];
            H = obj[HEIGHTL:HEIGHTR];
            R = obj[RADIUSL:RADIUSR];
            if (32'd2 * R >= 32'd1 * W || 32'd2 * R >= 32'd1 * H)
                is_obj_in_rounded_rectangle = 0;
            else begin
                is_obj_in_rounded_rectangle = (
                    is_obj_in_rectangle(pos, {4'd0, (X+R), (Y), 
                                        (W - 3'd2*R), (H), 10'd0, 12'd0}) ||
                    is_obj_in_rectangle(pos, {4'd0, (X), (Y+R), 
                                        (W), (H - 3'd2*R), 10'd0, 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+R), (Y+R), 10'd0, 10'd0, (R), 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+W-R), (Y+R), 10'd0, 10'd0, (R), 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+R), (Y+H-R), 10'd0, 10'd0, (R), 12'd0}) ||
                    is_obj_in_circle(pos,    {4'd0, (X+W-R), (Y+H-R), 10'd0, 10'd0, (R), 12'd0})
                ) ? 1 : 0;
            end
        end
    endfunction

    // 内部存储对象的数组
    reg [OBJ_WIDTH-1:0] obj_arr [0:MAX_LEN-1];
    
    // obj_arr 管理
    integer i1;
    always @(posedge vga_clk or negedge rst) begin
        if(rst == 1'b0) begin
            obj_arr[0] <= Q_OBJ;
            obj_arr[1] <= W_OBJ;
            obj_arr[2] <= E_OBJ;
            obj_arr[3] <= R_OBJ;
            obj_arr[4] <= T_OBJ;
            obj_arr[5] <= Y_OBJ;
            obj_arr[6] <= U_OBJ;

            obj_arr[7] <= A_OBJ;
            obj_arr[8] <= S_OBJ;
            obj_arr[9] <= D_OBJ;
            obj_arr[10] <= F_OBJ;
            obj_arr[11] <= G_OBJ;
            obj_arr[12] <= H_OBJ;
            obj_arr[13] <= J_OBJ;

            obj_arr[14] <= Z_OBJ;
            obj_arr[15] <= X_OBJ;
            obj_arr[16] <= C_OBJ;
            obj_arr[17] <= V_OBJ;
            obj_arr[18] <= B_OBJ;
            obj_arr[19] <= N_OBJ;
            obj_arr[20] <= M_OBJ;
            obj_arr[21] <= NONE;
        end else if (!key_alpha_table) begin 
            for (i1 = 0; i1 < MAX_LEN; i1 = i1 + 1) begin
                obj_arr[i1][COLORL:COLORR] <= `WHITE;
            end
        end else begin
            for (i1 = 0; i1 < 21; i1 = i1 + 1) begin
                if ((key_alpha_table >> i1) % 2) begin
                    obj_arr[i1][COLORL:COLORR] <= `GREY;
                end
            end
            // obj_arr[updated_table/2][COLORL:COLORR] <= `GREY;
        end
    end
    
    integer j;
    always @(posedge vga_clk) begin
        if (!is_in_screen({pix_x, pix_y})) begin
            obj_pix <= `BLACK;
            // use_obj_pix = 0;
        end else if (pix_y < 120) begin
            obj_pix <= `BLACK;
            // use_obj_pix = 0;
        end else begin  : loop
            for (j = 0; j < MAX_LEN; j = j + 1) begin
                if (obj_arr[j][ENUML:ENUMR] == `NONE_ENUM) begin
                    obj_pix <= `BLACK;
                    // use_obj_pix = 0;
                    disable loop;
                end else if (obj_arr[j][ENUML:ENUMR] == `ROUNDRECT_ENUM) begin
                    if (is_obj_in_rounded_rectangle({pix_x, pix_y}, obj_arr[j])) begin
                        if (((pix_x) < 10'd16 + obj_arr[j][XL:XR] + 10'd15) && ((pix_y) < 10'd32 + obj_arr[j][YL:YR] + 10'd4) && 
                            ((pix_x) >= obj_arr[j][XL:XR] + 10'd15) && ((pix_y) >= obj_arr[j][YL:YR] + 10'd4)) begin // 字模方块内
                            if ((alpha_table[j] << ((pix_x - obj_arr[j][XL:XR] - 10'd15) + (pix_y - obj_arr[j][YL:YR] - 10'd4) * 10'd16)) >> 511) begin
                                obj_pix <= `BLACK;
                                // use_obj_pix = 0;
                            end else begin // 填充
                                obj_pix <= obj_arr[j][COLORL:COLORR];
                                // use_obj_pix = 1;
                            end
                        end else begin // 填充
                            obj_pix <= obj_arr[j][COLORL:COLORR];
                            // use_obj_pix = 1;
                        end
                        disable loop;
                    end
                    // not disable
                end else begin
                    obj_pix <= `BLACK;
                    // use_obj_pix = 0;
                    disable loop;
                end
            end
        end
    end

endmodule
module song_change(
    input wire clk,
    input wire rst,
    input wire [10-1:0] pix_x,
    input wire [10-1:0] pix_y,
    // output wire [44-1:0] song_,
    output wire [12-1:0] song_pix
    );
    
    parameter 
        SQUARE_XL = 32*4 -1,
        SQUARE_XR = 32*3,
        SQUARE_YL = 32*3 -1,
        SQUARE_YR = 32*2,
        SQUARE_WL = 32*2 -1,
        SQUARE_WR = 32,
        SQUARE_HL = 32 -1,
        SQUARE_HR = 0;
    function is_in_square;
        input [31:0] pos_x;
        input [31:0] pos_y;
        input [32*4 - 1:0] square;

        begin
            is_in_square = (pos_x >= square[SQUARE_XL:SQUARE_XR] && 
                pos_x < square[SQUARE_XL:SQUARE_XR] + square[SQUARE_WL:SQUARE_WR] &&
                pos_y >= square[SQUARE_YL:SQUARE_YR] && 
                pos_y < square[SQUARE_YL:SQUARE_YR] + square[SQUARE_HL:SQUARE_HR]) ? 1 : 0;
        end
    endfunction

    parameter [44-1:0] song1 = {9'd128, 3'd0, 32'd0};
    parameter 
        SONG_LENL = 44-1,
        SONG_LENR = 44-9,
        SONG_INDEXL = SONG_LENR - 1,
        SONG_INDEXR = SONG_LENR - 3,
        SONG_XL = SONG_INDEXR - 1,
        SONG_XR = SONG_INDEXR - 32;
    parameter [31:0] 
            DISTANCE = 2,
            SINGLE_WIDTH = 16,
            SINGLE_HEIGHT = 40,
            SONG_Y = 50,
            SONG_X = 640;
    parameter [9:0]
            SONG_Y10 = 50;

    wire [0:5*128-1] test_song_arr = {
        `SO5,`__,`MI3,`__,    `MI3,`__,`__,`__,    `SO5,`__,`RE2,`__,  `RE2,`__,`__,`__,
        `MI3,`__,`RE2,`__,    `RE2,`__,`DO1,`__,   `DO1,`__,`__,`__,   `__,`__,`__,`__,
        `DO1,`__,`XI_7,`__,   `LA_6,`__,`XI_7,`__, `DO1,`__,`XI_7,`__, `DO1,`__,`DO1,`__,   
        `RE2,`__,`MI3,`__,    `MI3,`__,`__,`__,    `__,`__,`__,`__,    `__,`__,`__,`__,
        `__,`__,`__,`__,      `SO5,`__,`MI3,`__,   `MI3,`__,`__,`__,   `SO5,`__,`RE2,`__,
        `RE2,`__,`__,`__,     `MI3,`__,`RE2,`__,   `RE2,`__,`DO1,`__,  `DO1,`__,`__,`__,
        `__,`__,`__,`__,      `DO1,`__,`XI_7,`__,  `LA_6,`__,`XI_7,`__, `DO1,`__,`XI_7,`__,
        `XI_7,`__,`DO1,`__,   `DO1,`__,`RE2,`__,   `DO1,`__,`__,`__,   `__,`__,`__,`__
    };
    wire [5-1:0] test_song [0:128-1];

    genvar i;
    generate
        for (i = 0; i < 128; i = i + 1) begin
            assign test_song[i] = test_song_arr[5*i:(i+1)*5-1];
        end
    endgenerate

    parameter [0:`ALPHA_TABLE_TOTAL_BITS-1] ALPHA_TABLE_ = `ALPHA_TABLE;
    wire [511:0] alpha_table [0:21-1];
    genvar i2;
    generate
        for (i2 = 0; i2 < `ALPHA_TABLE_SIZE; i2 = i2 + 1) begin
            assign alpha_table[i2] = ALPHA_TABLE_[512*i2:(i2+1)*512-1];
        end
    endgenerate

    reg [44-1:0] song = song1;
    wire flag1;

    // assign song_ = song;
    counter #(.NUM(25'd1_000_000)) div(.clk(clk), .rst(rst), .flag(flag1));
    always @(posedge flag1 or negedge rst) begin
        if (!rst) begin
            song <= song1;
        end else if (song[SONG_XL:SONG_XR] >= 
                    SONG_X + (DISTANCE + SINGLE_WIDTH) * song[SONG_LENL:SONG_LENR]) begin
            song[SONG_XL:SONG_XR] <= 0;
        end else begin
            song[SONG_XL:SONG_XR] <= song[SONG_XL:SONG_XR] + 1;
        end
    end

    
    function is_in_song;
        input [31:0] posx, posy;
        input [SONG_LENL:0] song;
        
        begin
            is_in_song = is_in_square(posx+song[SONG_XL:SONG_XR], posy, 
                {SONG_X, SONG_Y, (DISTANCE + SINGLE_WIDTH) * song[SONG_LENL:SONG_LENR], SINGLE_HEIGHT});
        end
    endfunction

    function is_in_div;
        input [31:0] posx, posy;
        input [SONG_LENL:0] song;
        begin
            is_in_div = (((posx+song[SONG_XL:SONG_XR] - SONG_X) % (DISTANCE + SINGLE_WIDTH)) >= SINGLE_WIDTH); 
        end
    endfunction

    function [9-1:0] get_single_index;
        input [31:0] posx, posy;
        input [SONG_LENL:0] song;

        begin
            get_single_index = ((posx+song[SONG_XL:SONG_XR] - SONG_X) / (DISTANCE + SINGLE_WIDTH));
        end
    endfunction

    wire [9-1:0] temp;
    wire [10-1:0] mod;
    wire [12-1:0] single_color;
    assign mod = ((pix_x+song[SONG_XL:SONG_XR] - SONG_X) % (DISTANCE + SINGLE_WIDTH));
    assign temp = get_single_index(pix_x, pix_y, song);
    assign single_color = (pix_x < 10'd320 && pix_x >= 10'd320 - 10'd16) ? `GREEN : `WHITE;

    assign song_pix = 
        (!is_in_song(pix_x, pix_y, song)) ? `BLACK : (
            (mod >= SINGLE_WIDTH) ? `BLACK : (
                // (mod < 10'd16 + 10'd15 && pix_y < 10'd32 + SONG_Y10 + 10'd4 && mod >= 10'd15 && pix_y >= SONG_Y10 + 10'd4) ? (
                (test_song[temp] == `__) ? `BLACK : (
                    ((alpha_table[test_song[temp]] << ((mod) + (pix_y - SONG_Y10) * 10'd16)) >> 511) ?
                        single_color : `BLACK
                )
                // ) : `BLACK
            )
        );
endmodule

