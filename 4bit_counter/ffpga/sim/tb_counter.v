`timescale 1ns / 1ps

module tb_counter;

    // 1. Inputs (Reg) and Outputs (Wire)
    reg clk;
    reg nreset;
    reg up_down;
    wire [3:0] out_oe;
    wire osc_en;
    wire [3:0] cnter;

    // 2. Instantiate the Unit Under Test (UUT)
    // The name "counter" must match your module name in main.v
    counter uut (
        .clk(clk),
        .nreset(nreset),
        .up_down(up_down),
        .out_oe(out_oe),
        .osc_en(osc_en),
        .cnter(cnter)
    );

    // 3. Clock Generation (50MHz)
    // Period = 1/50MHz = 20ns. Toggle every 10ns.
    always #10 clk = ~clk;
    
    initial begin
    		$dumpfile ("tb_counter.vcd");
 		$dumpvars (0, tb_counter);
    end

    // 4. Stimulus Process
    initial begin
        // Initialize Inputs
        clk = 0;
        nreset = 0;    // Start in reset
        up_down = 1;   // Set to count UP

        // Wait 100ns for global reset to settle
        #100;
        
        // Release Reset
        nreset = 1;
        
        // Let it run for a while to see the count
        // Note: If your design is still set to 50 million, 
        // you won't see "cnter" change here! 
        #1000;
        
        // Change direction to DOWN
        up_down = 0;
        #1000;

        // Finish simulation
        $finish;
    end

endmodule