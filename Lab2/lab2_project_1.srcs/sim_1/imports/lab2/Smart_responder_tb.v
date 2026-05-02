`timescale 1ns / 1ps

module Smart_responder_tb;
    reg clk,rst;
    reg [3:0]btn;
    initial begin
        clk = 1'b0;
        rst = 1'b1;
        btn = 4'd0;
        #10 rst = 1'b0;
        #10 rst = 1'b1;
        
        #10 btn = 4'd1; 
        #10 btn = 4'd3;
        #10 btn = 4'd0;
        
        #50 rst = 1'b0;
        #10 rst = 1'b1;
        
        #10 btn = 4'd2;
        #10 btn = 4'd6;
        #10 btn = 4'd0;        
    end
    always #5 clk <= ~clk;
    wire [3:0] an;
    wire [7:0] seg_code;
    Smart_responder Smart_responder(
        .clk( clk ),
        .rst_n( rst ),
        .btn( btn ),
        .an( an ),
        .seg_code( seg_code )
    );
endmodule
