`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.09.2023 13:24:08
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top(
    // components 
    input switch_0,
    input switch_1,
    output led_0,
    output led_1,
    
    input [3:0] btn,
    output [3:0] led
    
    );
    // wiring
    assign led_0 = switch_0; 
    assign led_1 = switch_1;
    assign led = btn;
endmodule
