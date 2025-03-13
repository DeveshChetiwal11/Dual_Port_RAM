`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 25.02.2025 12:18:38
// Design Name: 
// Module Name: dual_port_TB
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


module dual_port_TB();
reg clk_a, clk_b, wren_a, rden_a, wren_b, rden_b;
reg rst;
reg [8:0] address_a, address_b;
reg [7:0] data_a, data_b;
wire [7:0] q_a, q_b;
trueport_ram R1(
     .clk_a(clk_a), .clk_b(clk_b), .wren_a(wren_a), .rden_a(rden_a), .wren_b(wren_b), .rden_b(rden_b),
     .rst(rst),  
     .address_a(address_a), .address_b(address_b),
     .data_a(data_a), .data_b(data_b),
     .q_a(q_a), .q_b(q_b) );
   // Clock generation
    always #5 clk_a = ~clk_a;
    always #7 clk_b = ~clk_b; // Different clock periods to test asynchronous behavior

    initial begin
        // Initialize signals
        clk_a = 0; clk_b = 0;
        wren_a = 0; rden_a = 0; wren_b = 0; rden_b = 0;
        rst = 1;
        address_a = 0; address_b = 0;
        data_a = 0; data_b = 0;

        #10 rst = 0; // Release reset after some time

        // Write data using Port A
        #10 address_a = 9'd10; data_a = 8'h90; wren_a = 1;
        #10 wren_a = 0;

        // Read data using Port A
        #10 rden_a = 1;
        #10 rden_a = 0;

        // Write data using Port B
        #10 address_b = 9'd20; data_b = 8'h50; wren_b = 1;
        #10 wren_b = 0;

        // Read data using Port B
        #15 /*address_b = 9'd20*/;rden_b = 1;
        #10 rden_b = 0;
        
        // Read the value written by Port A using Port B (to test dual-port access)
        #10 address_b = 9'd10; rden_b = 1;
        #10 rden_b = 0;
        
        // Read the value written by Port B using Port A (to test dual-port access)
        #10 address_a = 9'd20; rden_a = 1;
        #10 rden_a = 0;

        //Same address for both ports
        #10 address_a = 9'd15 ; data_a = 9'h10 ; wren_a = 1 ;  address_b = 9'd15 ; data_b = 9'h15 ; wren_b = 1 ;
        #10 address_a = 9'd15; rden_a = 1;  rden_b = 0;
        #10 rden_a = 0; rden_b = 0;
        
        //Address greater than the range
         #10 address_a = 9'd512 ; data_a = 9'h10 ; wren_a = 1 ; 
         #10 address_a = 9'd20; rden_a = 1;
         #10 rden_a = 0;
        // End simulation
        #150 $finish;
    end
endmodule