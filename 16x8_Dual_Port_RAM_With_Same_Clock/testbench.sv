// Code your testbench here
// or browse Examples
module tb;

  reg [7:0] din_a, din_b;
  reg [3:0] addr_a, addr_b;
  reg we_a, we_b;
  reg re_a, re_b;
  wire [7:0] dout_a, dout_b;
  reg clk;
  reg rst;

  dual_port_ram dut(

    .clk(clk),
    .rst(rst),
    .din_a(din_a),
    .din_b(din_b),
    .dout_a(dout_a),
    .dout_b(dout_b),
    .addr_a(addr_a),
    .addr_b(addr_b),
    .we_a(we_a),
    .we_b(we_b),
    .re_a(re_a),
    .re_b(re_b)

  );

  initial begin

    clk = 0;
    forever #5 clk = ~clk;

  end

  initial begin

    $dumpfile("test_dpt.vcd");
    $dumpvars(0, tb);

    $monitor("Time = %t | Din_a = %b | Din_b = %b | addr_a = %b | addr_b = %b | we_a = %b | we_b = %b | @addr_a = %b | @addr_b = %b | re_a = %b | re_b = %b | rst = %b | dout_a = %b | dout_b = %b", $realtime, din_a, din_b, addr_a, addr_b, we_a, we_b, dut.mem[addr_a], dut.mem[addr_b], re_a, re_b, rst, dout_a, dout_b);


    // initially
    din_a = 8'b1; din_b = 8'b10;

    addr_a = 4'b1010; addr_b = 4'b1111; // for writing on different addresses

    // addr_a = 4'b1111; addr_b = 4'b1111; // for writing on same address

    we_a = 1'b0; we_b = 1'b0;

    re_a = 1'b0; re_b = 1'b0;

    rst = 1'b0;

    // write data from both ports to different memory locations


    @(posedge clk);
    we_a = 1'b1;
    we_b = 1'b1; 


    /*
    @(posedge clk);
    we_b = 1'b0;
    we_a = 1'b1;

    @(posedge clk);
    we_a = 1'b0;
    we_b = 1'b1;
    */


    /*
     @(posedge clk);
      we_a = 1'b0;
      we_b = 1'b0;
   */  


    // when both ports try to write on same address
    /*
    @(posedge clk);

    we_a = 1;
    we_b = 1;

    @(posedge clk);
    we_a = 0; we_b = 0; 

    @(posedge clk);
    re_a = 1'b1;
    re_b = 1'b1;
    $display("dout_a = %b | dout_b = %b", dout_a, dout_b);
    */



    // read data from memory locations
    @(posedge clk);
    we_a = 1'b0;
    we_b = 1'b0;
    re_a = 1'b1;
    re_b = 1'b1;



    /* use this for check reset at any time ( clears all memory locations and both port's output pins)
    #10;
    rst = 1'b1;
    */

    #10;

    #10; $finish;

  end

endmodule