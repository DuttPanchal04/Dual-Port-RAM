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

    // to observe process everytime
    // $monitor("Time = %t | Din_a = %b | Din_b = %b | addr_a = %b | addr_b = %b | we_a = %b | we_b = %b | @addr_a = %b | @addr_b = %b | re_a = %b | re_b = %b | rst = %b | dout_a = %b | dout_b = %b", $realtime, din_a, din_b, addr_a, addr_b, we_a, we_b, dut.mem[addr_a], dut.mem[addr_b], re_a, re_b, rst, dout_a, dout_b);


    // initially
    din_a = 8'b1; din_b = 8'b10;
    addr_a = 4'b1010; addr_b = 4'b1111; 
    we_a = 1'b0; we_b = 1'b0;
    re_a = 1'b0; re_b = 1'b0;
    rst = 1'b0;


    // Write any of these command line argument in Run Option before run simulation: +WRITE_FROM_A +READ_FROM_A +WRITE_FROM_B +READ_FROM_B +RESET


    // Testcase 1
    if($test$plusargs("WRITE_FROM_A")) begin
      @(posedge clk);
      we_a = 1'b1;
      @(negedge clk);
      we_a = 1'b0;
      $display("THIS IS WRITE_FROM_A TESTCASE: INPUT VALUE %b IS CORRECTLY WRITTEN IN LOCATION %b", din_a, addr_a);
      $display("Data at memory address %b is %b", addr_a, dut.mem[addr_a]);

    end

    // Testcase 2
    if($test$plusargs("WRITE_FROM_B")) begin
      @(posedge clk);
      we_b = 1'b1;
      @(negedge clk);
      we_b = 1'b0;
      $display("THIS IS WRITE_FROM_B TESTCASE: INPUT VALUE %b IS CORRECTLY WRITTEN IN LOCATION %b", din_b, addr_b);
      $display("Data at memory address %b is %b", addr_b, dut.mem[addr_b]);
    end

    // Testcase 3
    // you have first write the data to read, otherwise it will be x.
    if($test$plusargs("READ_FROM_A")) begin
      @(posedge clk);
      re_a = 1'b1;
      @(negedge clk);
      re_a = 1'b0;
      $display("THIS IS READ_FROM_A TESTCASE: INPUT VALUE %b IS CORRECTLY READED FROM LOCATION %b", din_a, addr_a);
      $display("Data read from %b is %b", addr_a, dout_a);
    end

    // Testcase 4
    // you have first write the data to read, otherwise it will be x.
    if($test$plusargs("READ_FROM_B")) begin
      @(posedge clk);
      re_b = 1'b1;
      @(negedge clk);
      re_b = 1'b0;
      $display("THIS IS READ_FROM_B TESTCASE: INPUT VALUE %b IS CORRECTLY READED FROM LOCATION %b", din_b, addr_b);
      $display("Data read from %b is %b", addr_b, dout_b);

    end

    // Testcase 5
    if($test$plusargs("RESET")) begin

      @(posedge clk);
      rst = 1'b1;
      $display("THIS IS RESET: ALL MEMORY LOCATIONS AND OUTPUT PORTS CLEARED!");
      @(negedge clk);
      rst = 1'b0;

    end

    // loop to check all memory address locations and output ports (reference for reset output)
    for(integer j = 0; j < 16; j = j+1) begin

      $display("Data at %d is %b", j, dut.mem[j]);

    end
    $display("Data at output port of A is %b and port B is %b", dout_a, dout_b);

    #10;

    #10; $finish;
   

  end

endmodule