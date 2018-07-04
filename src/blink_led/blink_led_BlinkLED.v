module blink_led_BlinkLED
(
  input  clk,
  input  reset,
  input  led_in,
  input  led_we,
  output  led_out,
  output  run_busy,
  input  run_req
);

  wire  clk_sig;
  wire  reset_sig;
  wire  led_in_sig;
  wire  led_we_sig;
  wire  led_out_sig;
  reg  run_busy_sig = 1'b1;
  wire  run_req_sig;

  reg  class_led_0000 = 1'b0;
  wire  class_led_0000_mux;
  wire  tmp_0001;
  reg signed [32-1 : 0] run_i_0001 = 32'h00000000;
  reg  binary_expr_00002 = 1'b0;
  reg signed [32-1 : 0] unary_expr_00003 = 0;
  reg signed [32-1 : 0] run_i_0004 = 32'h00000000;
  reg  binary_expr_00005 = 1'b0;
  reg signed [32-1 : 0] unary_expr_00006 = 0;
  wire  run_req_flag;
  reg  run_req_local = 1'b0;
  wire  tmp_0002;
  localparam run_method_IDLE = 32'd0;
  localparam run_method_S_0000 = 32'd1;
  localparam run_method_S_0001 = 32'd2;
  localparam run_method_S_0002 = 32'd3;
  localparam run_method_S_0003 = 32'd4;
  localparam run_method_S_0004 = 32'd5;
  localparam run_method_S_0006 = 32'd6;
  localparam run_method_S_0007 = 32'd7;
  localparam run_method_S_0008 = 32'd8;
  localparam run_method_S_0009 = 32'd9;
  localparam run_method_S_0010 = 32'd10;
  localparam run_method_S_0011 = 32'd11;
  localparam run_method_S_0012 = 32'd12;
  localparam run_method_S_0013 = 32'd13;
  localparam run_method_S_0015 = 32'd14;
  localparam run_method_S_0016 = 32'd15;
  localparam run_method_S_0017 = 32'd16;
  localparam run_method_S_0018 = 32'd17;
  localparam run_method_S_0019 = 32'd18;
  localparam run_method_S_0020 = 32'd19;
  localparam run_method_S_0021 = 32'd20;
  localparam run_method_S_0022 = 32'd21;
  localparam run_method_S_0023 = 32'd22;
  reg [31:0] run_method = run_method_IDLE;
  reg signed [32-1 : 0] run_method_delay = 0;
  reg  run_req_flag_d = 1'b0;
  wire  run_req_flag_edge;
  wire  tmp_0003;
  wire  tmp_0004;
  wire  tmp_0005;
  wire  tmp_0006;
  wire  tmp_0007;
  wire  tmp_0008;
  wire  tmp_0009;
  wire  tmp_0010;
  wire  tmp_0011;
  wire  tmp_0012;
  wire  tmp_0013;
  wire  tmp_0014;
  wire  tmp_0015;
  wire  tmp_0016;
  wire  tmp_0017;
  wire signed [32-1 : 0] tmp_0018;
  wire  tmp_0019;
  wire signed [32-1 : 0] tmp_0020;


  assign clk_sig = clk;
  assign reset_sig = reset;
  assign led_in_sig = led_in;
  assign led_we_sig = led_we;
  assign led_out = led_out_sig;
  assign led_out_sig = class_led_0000;

  assign run_busy = run_busy_sig;
  always @(posedge clk) begin
    if(reset == 1'b1) begin
      run_busy_sig <= 1'b1;
    end else begin
      if (run_method == run_method_S_0000) begin
        run_busy_sig <= 1'b0;
      end else if (run_method == run_method_S_0001) begin
        run_busy_sig <= tmp_0006;
      end
    end
  end

  assign run_req_sig = run_req;

  assign tmp_0001 = led_we_sig == 1'b1 ? led_in_sig : class_led_0000;
  assign tmp_0002 = run_req_local | run_req_sig;
  assign tmp_0003 = ~run_req_flag_d;
  assign tmp_0004 = run_req_flag & tmp_0003;
  assign tmp_0005 = run_req_flag | run_req_flag_d;
  assign tmp_0006 = run_req_flag | run_req_flag_d;
  assign tmp_0007 = 1'b1 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0008 = 1'b1 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0009 = binary_expr_00002 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0010 = binary_expr_00002 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0011 = binary_expr_00005 == 1'b1 ? 1'b1 : 1'b0;
  assign tmp_0012 = binary_expr_00005 == 1'b0 ? 1'b1 : 1'b0;
  assign tmp_0013 = run_method != run_method_S_0000 ? 1'b1 : 1'b0;
  assign tmp_0014 = run_method != run_method_S_0001 ? 1'b1 : 1'b0;
  assign tmp_0015 = tmp_0014 & run_req_flag_edge;
  assign tmp_0016 = tmp_0013 & tmp_0015;
  assign tmp_0017 = run_i_0001 < 32'h004c4b40 ? 1'b1 : 1'b0;
  assign tmp_0018 = run_i_0001 + 32'h00000001;
  assign tmp_0019 = run_i_0004 < 32'h004c4b40 ? 1'b1 : 1'b0;
  assign tmp_0020 = run_i_0004 + 32'h00000001;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      run_method <= run_method_IDLE;
      run_method_delay <= 32'h0;
    end else begin
      case (run_method)
        run_method_IDLE : begin
          run_method <= run_method_S_0000;
        end
        run_method_S_0000 : begin
          run_method <= run_method_S_0001;
        end
        run_method_S_0001 : begin
          if (tmp_0005 == 1'b1) begin
            run_method <= run_method_S_0002;
          end
        end
        run_method_S_0002 : begin
          if (tmp_0007 == 1'b1) begin
            run_method <= run_method_S_0004;
          end else if (tmp_0008 == 1'b1) begin
            run_method <= run_method_S_0003;
          end
        end
        run_method_S_0003 : begin
          run_method <= run_method_S_0023;
        end
        run_method_S_0004 : begin
          run_method <= run_method_S_0006;
        end
        run_method_S_0006 : begin
          run_method <= run_method_S_0007;
        end
        run_method_S_0007 : begin
          if (tmp_0009 == 1'b1) begin
            run_method <= run_method_S_0012;
          end else if (tmp_0010 == 1'b1) begin
            run_method <= run_method_S_0008;
          end
        end
        run_method_S_0008 : begin
          run_method <= run_method_S_0013;
        end
        run_method_S_0009 : begin
          run_method <= run_method_S_0010;
        end
        run_method_S_0010 : begin
          run_method <= run_method_S_0011;
        end
        run_method_S_0011 : begin
          run_method <= run_method_S_0006;
        end
        run_method_S_0012 : begin
          run_method <= run_method_S_0009;
        end
        run_method_S_0013 : begin
          run_method <= run_method_S_0015;
        end
        run_method_S_0015 : begin
          run_method <= run_method_S_0016;
        end
        run_method_S_0016 : begin
          if (tmp_0011 == 1'b1) begin
            run_method <= run_method_S_0021;
          end else if (tmp_0012 == 1'b1) begin
            run_method <= run_method_S_0017;
          end
        end
        run_method_S_0017 : begin
          run_method <= run_method_S_0022;
        end
        run_method_S_0018 : begin
          run_method <= run_method_S_0019;
        end
        run_method_S_0019 : begin
          run_method <= run_method_S_0020;
        end
        run_method_S_0020 : begin
          run_method <= run_method_S_0015;
        end
        run_method_S_0021 : begin
          run_method <= run_method_S_0018;
        end
        run_method_S_0022 : begin
          run_method <= run_method_S_0002;
        end
        run_method_S_0023 : begin
          run_method <= run_method_S_0000;
        end
      endcase
      run_req_flag_d <= run_req_flag;
      if(tmp_0013 & tmp_0015 == 1'b1) begin
        run_method <= run_method_S_0001;
      end
    end
  end


  always @(posedge clk) begin
    if(reset == 1'b1) begin
      class_led_0000 <= 1'b0;
    end else begin
      if (run_method == run_method_S_0004) begin
        class_led_0000 <= 1'b1;
      end else if (run_method == run_method_S_0013) begin
        class_led_0000 <= 1'b0;
      end else begin
        class_led_0000 <= class_led_0000_mux;
      end
    end
  end

  assign class_led_0000_mux = tmp_0001;

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      run_i_0001 <= 32'h00000000;
    end else begin
      if (run_method == run_method_S_0004) begin
        run_i_0001 <= 32'h00000000;
      end else if (run_method == run_method_S_0010) begin
        run_i_0001 <= unary_expr_00003;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00002 <= 1'b0;
    end else begin
      if (run_method == run_method_S_0006) begin
        binary_expr_00002 <= tmp_0017;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      unary_expr_00003 <= 0;
    end else begin
      if (run_method == run_method_S_0009) begin
        unary_expr_00003 <= tmp_0018;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      run_i_0004 <= 32'h00000000;
    end else begin
      if (run_method == run_method_S_0013) begin
        run_i_0004 <= 32'h00000000;
      end else if (run_method == run_method_S_0019) begin
        run_i_0004 <= unary_expr_00006;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      binary_expr_00005 <= 1'b0;
    end else begin
      if (run_method == run_method_S_0015) begin
        binary_expr_00005 <= tmp_0019;
      end
    end
  end

  always @(posedge clk) begin
    if(reset == 1'b1) begin
      unary_expr_00006 <= 0;
    end else begin
      if (run_method == run_method_S_0018) begin
        unary_expr_00006 <= tmp_0020;
      end
    end
  end

  assign run_req_flag = tmp_0002;

  assign run_req_flag_edge = tmp_0004;



endmodule
