# Dual_Port_RAM

# Overview
A True Dual-Port RAM allows simultaneous access to memory from two independent ports. Each port has its own clock, address, and control signals, enabling concurrent read and write operations. This implementation is designed for a 512x8-bit memory, but it can be easily modified for different memory sizes.

# Features
-> True Dual-Port Operation: Supports simultaneous read and write operations from two independent ports.
-> Independent Clocks: Each port operates on its own clock (clk_a and clk_b).
-> Synchronous Reset: Includes an active-high synchronous reset (rst) to initialize the RAM.
-> Configurable Memory Size: The memory size is fixed at 512x8 bits but can be modified for other configurations.
-> Error Handling: Includes commented-out error handling for out-of-range addresses (can be enabled for debugging).

# Code Structure
-> The Verilog code consists of the following key components:
-> Memory Declaration: A 512x8-bit RAM (ram) to store data.
-> Port A Logic: Handles read and write operations for Port A (clk_a, address_a, data_a, q_a).
-> Port B Logic: Handles read and write operations for Port B (clk_b, address_b, data_b, q_b).
-> Address Registers: Temporary registers (addr_a and addr_b) to store addresses for synchronous read operations.
-> Synchronous Reset: Resets the output registers (q_a and q_b) to zero when rst is high.

# Inputs and Outputs

# Inputs:
-> clk_a: Port A clock.
-> clk_b: Port B clock.
-> wren_a: Port A write enable.
-> rden_a: Port A read enable.
-> wren_b: Port B write enable.
-> rden_b: Port B read enable.
-> rst: Active-high synchronous reset.
-> address_a: Port A address (9 bits).
-> address_b: Port B address (9 bits).
-> data_a: Port A input data (8 bits).
-> data_b: Port B input data (8 bits).

# Outputs:
-> q_a: Port A output data (8 bits).
-> q_b: Port B output data (8 bits).# 
