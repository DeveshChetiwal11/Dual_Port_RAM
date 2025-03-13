module trueport_ram(
    input clk_a, clk_b, wren_a, rden_a, wren_b, rden_b,
    input rst,  // Active-high synchronous reset
    input [8:0] address_a, address_b,
    input [7:0] data_a, data_b,
    output [7:0] q_a, q_b );
    
    // To store the address before reading the value in it to avoid setup violation
    reg [8:0] addr_a,addr_b;

    // Declare 512x8-bit RAM
    reg [7:0] ram [511:0];

    // Port A logic
    always @(posedge clk_a) begin
        if (rst)
            q_a <= 8'h00;
        else begin
                                   //if(address_a >= 9'd512)     
                                      //$display("Address is out of range of memory. Please generate a valid address");
            if (wren_a)
                ram[address_a] <= data_a;
            if (rden_a)
                addr_a <= address_a; // Synchronous read
        end
    end
    assign q_a = ram[addr_a];
    // Port B logic
    always @(posedge clk_b) begin
        if (rst) 
            q_b <= 8'h00;
        else begin
                                          //if(address_b >= 9'd512)
                                             //$display("Address is out of range of memory. Please generate a valid address");
            if (wren_b)
                ram[address_b] <= data_b;
            if (rden_b)
                addr_b <= address_b; // Synchronous read
        end
    end
    assign q_b = ram[addr_b];
endmodule
