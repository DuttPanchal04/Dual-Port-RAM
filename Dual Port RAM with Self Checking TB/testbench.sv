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

  reg [7:0] expected_dout_a;
  reg [7:0] expected_dout_b;

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

  // check wheather my output matches expected outputs
  task check;

    input in_we_a, in_we_b, in_re_a, in_re_b;
    input [3:0] in_addr_a, in_addr_b;
    input [7:0] in_din_a, in_din_b;

    begin

      in_we_a = we_a;
      in_we_b = we_b;
      in_re_a = re_a;
      in_re_b = re_b;
      in_addr_a = addr_a;
      in_addr_b = addr_b;
      in_din_a = din_a;
      in_din_b = din_b;


      @(posedge clk);  


      if(in_we_a)

        dut.mem[in_addr_a] <= in_din_a;


      if (in_we_b)

        dut.mem[in_addr_b] <= in_din_b;

      if(in_re_a)

        expected_dout_a <= in_addr_a;

      if(in_re_b)

        expected_dout_b <= in_addr_b;

    end

    if(expected_dout_a == dout_a)
      $display("PASS");
    else
      $display("FAIL");

  endtask


  initial begin

    we_a = 1'b0; we_b = 1'b0;

    re_a = 1'b0; re_b = 1'b0;

    rst = 1'b0;

    check(1'b1, 1'b1, 1'b1, 1'b1, 4'b1010, 4'b1111, 8'b1, 8'b10);

    @(posedge clk); $finish;
    
  end


endmodule