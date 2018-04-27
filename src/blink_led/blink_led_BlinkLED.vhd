library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity blink_led_BlinkLED is
  port (
    clk : in std_logic;
    reset : in std_logic;
    led_in : in std_logic;
    led_we : in std_logic;
    led_out : out std_logic;
    run_busy : out std_logic;
    run_req : in std_logic
  );
end blink_led_BlinkLED;

architecture RTL of blink_led_BlinkLED is

  attribute mark_debug : string;
  attribute keep : string;


  signal clk_sig : std_logic;
  signal reset_sig : std_logic;
  signal led_in_sig : std_logic;
  signal led_we_sig : std_logic;
  signal led_out_sig : std_logic;
  signal run_busy_sig : std_logic := '1';
  signal run_req_sig : std_logic;

  signal class_led_0000 : std_logic := '0';
  signal class_led_0000_mux : std_logic;
  signal tmp_0001 : std_logic;
  signal run_i_0001 : signed(32-1 downto 0) := X"00000000";
  signal binary_expr_00002 : std_logic := '0';
  signal unary_expr_00003 : signed(32-1 downto 0) := (others => '0');
  signal run_i_0004 : signed(32-1 downto 0) := X"00000000";
  signal binary_expr_00005 : std_logic := '0';
  signal unary_expr_00006 : signed(32-1 downto 0) := (others => '0');
  signal run_req_flag : std_logic;
  signal run_req_local : std_logic := '0';
  signal tmp_0002 : std_logic;
  type Type_run_method is (
    run_method_IDLE,
    run_method_S_0000,
    run_method_S_0001,
    run_method_S_0002,
    run_method_S_0003,
    run_method_S_0004,
    run_method_S_0006,
    run_method_S_0007,
    run_method_S_0008,
    run_method_S_0009,
    run_method_S_0010,
    run_method_S_0011,
    run_method_S_0012,
    run_method_S_0013,
    run_method_S_0015,
    run_method_S_0016,
    run_method_S_0017,
    run_method_S_0018,
    run_method_S_0019,
    run_method_S_0020,
    run_method_S_0021,
    run_method_S_0022,
    run_method_S_0023  
  );
  signal run_method : Type_run_method := run_method_IDLE;
  signal run_method_delay : signed(32-1 downto 0) := (others => '0');
  signal run_req_flag_d : std_logic := '0';
  signal run_req_flag_edge : std_logic;
  signal tmp_0003 : std_logic;
  signal tmp_0004 : std_logic;
  signal tmp_0005 : std_logic;
  signal tmp_0006 : std_logic;
  signal tmp_0007 : std_logic;
  signal tmp_0008 : std_logic;
  signal tmp_0009 : std_logic;
  signal tmp_0010 : std_logic;
  signal tmp_0011 : std_logic;
  signal tmp_0012 : std_logic;
  signal tmp_0013 : std_logic;
  signal tmp_0014 : std_logic;
  signal tmp_0015 : std_logic;
  signal tmp_0016 : std_logic;
  signal tmp_0017 : std_logic;
  signal tmp_0018 : signed(32-1 downto 0);
  signal tmp_0019 : std_logic;
  signal tmp_0020 : signed(32-1 downto 0);

begin

  clk_sig <= clk;
  reset_sig <= reset;
  led_in_sig <= led_in;
  led_we_sig <= led_we;
  led_out <= led_out_sig;
  led_out_sig <= class_led_0000;

  run_busy <= run_busy_sig;
  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        run_busy_sig <= '1';
      else
        if run_method = run_method_S_0000 then
          run_busy_sig <= '0';
        elsif run_method = run_method_S_0001 then
          run_busy_sig <= tmp_0006;
        end if;
      end if;
    end if;
  end process;

  run_req_sig <= run_req;

  -- expressions
  tmp_0001 <= led_in_sig when led_we_sig = '1' else class_led_0000;
  tmp_0002 <= run_req_local or run_req_sig;
  tmp_0003 <= not run_req_flag_d;
  tmp_0004 <= run_req_flag and tmp_0003;
  tmp_0005 <= run_req_flag or run_req_flag_d;
  tmp_0006 <= run_req_flag or run_req_flag_d;
  tmp_0007 <= '1' and '1';
  tmp_0008 <= '1' and '0';
  tmp_0009 <= '1' when binary_expr_00002 = '1' else '0';
  tmp_0010 <= '1' when binary_expr_00002 = '0' else '0';
  tmp_0011 <= '1' when binary_expr_00005 = '1' else '0';
  tmp_0012 <= '1' when binary_expr_00005 = '0' else '0';
  tmp_0013 <= '1' when run_method /= run_method_S_0000 else '0';
  tmp_0014 <= '1' when run_method /= run_method_S_0001 else '0';
  tmp_0015 <= tmp_0014 and run_req_flag_edge;
  tmp_0016 <= tmp_0013 and tmp_0015;
  tmp_0017 <= '1' when run_i_0001 < X"004c4b40" else '0';
  tmp_0018 <= run_i_0001 + X"00000001";
  tmp_0019 <= '1' when run_i_0004 < X"004c4b40" else '0';
  tmp_0020 <= run_i_0004 + X"00000001";

  -- sequencers
  process (clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        run_method <= run_method_IDLE;
        run_method_delay <= (others => '0');
      else
        case (run_method) is
          when run_method_IDLE => 
            run_method <= run_method_S_0000;
          when run_method_S_0000 => 
            run_method <= run_method_S_0001;
          when run_method_S_0001 => 
            if tmp_0005 = '1' then
              run_method <= run_method_S_0002;
            end if;
          when run_method_S_0002 => 
            if tmp_0007 = '1' then
              run_method <= run_method_S_0004;
            elsif tmp_0008 = '1' then
              run_method <= run_method_S_0003;
            end if;
          when run_method_S_0003 => 
            run_method <= run_method_S_0023;
          when run_method_S_0004 => 
            run_method <= run_method_S_0006;
          when run_method_S_0006 => 
            run_method <= run_method_S_0007;
          when run_method_S_0007 => 
            if tmp_0009 = '1' then
              run_method <= run_method_S_0012;
            elsif tmp_0010 = '1' then
              run_method <= run_method_S_0008;
            end if;
          when run_method_S_0008 => 
            run_method <= run_method_S_0013;
          when run_method_S_0009 => 
            run_method <= run_method_S_0010;
          when run_method_S_0010 => 
            run_method <= run_method_S_0011;
          when run_method_S_0011 => 
            run_method <= run_method_S_0006;
          when run_method_S_0012 => 
            run_method <= run_method_S_0009;
          when run_method_S_0013 => 
            run_method <= run_method_S_0015;
          when run_method_S_0015 => 
            run_method <= run_method_S_0016;
          when run_method_S_0016 => 
            if tmp_0011 = '1' then
              run_method <= run_method_S_0021;
            elsif tmp_0012 = '1' then
              run_method <= run_method_S_0017;
            end if;
          when run_method_S_0017 => 
            run_method <= run_method_S_0022;
          when run_method_S_0018 => 
            run_method <= run_method_S_0019;
          when run_method_S_0019 => 
            run_method <= run_method_S_0020;
          when run_method_S_0020 => 
            run_method <= run_method_S_0015;
          when run_method_S_0021 => 
            run_method <= run_method_S_0018;
          when run_method_S_0022 => 
            run_method <= run_method_S_0002;
          when run_method_S_0023 => 
            run_method <= run_method_S_0000;
          when others => null;
        end case;
        run_req_flag_d <= run_req_flag;
        if (tmp_0013 and tmp_0015) = '1' then
          run_method <= run_method_S_0001;
        end if;
      end if;
    end if;
  end process;


  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        class_led_0000 <= '0';
      else
        if run_method = run_method_S_0004 then
          class_led_0000 <= '1';
        elsif run_method = run_method_S_0013 then
          class_led_0000 <= '0';
        else
          class_led_0000 <= class_led_0000_mux;
        end if;
      end if;
    end if;
  end process;

  class_led_0000_mux <= tmp_0001;

  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        run_i_0001 <= X"00000000";
      else
        if run_method = run_method_S_0004 then
          run_i_0001 <= X"00000000";
        elsif run_method = run_method_S_0010 then
          run_i_0001 <= unary_expr_00003;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        binary_expr_00002 <= '0';
      else
        if run_method = run_method_S_0006 then
          binary_expr_00002 <= tmp_0017;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        unary_expr_00003 <= (others => '0');
      else
        if run_method = run_method_S_0009 then
          unary_expr_00003 <= tmp_0018;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        run_i_0004 <= X"00000000";
      else
        if run_method = run_method_S_0013 then
          run_i_0004 <= X"00000000";
        elsif run_method = run_method_S_0019 then
          run_i_0004 <= unary_expr_00006;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        binary_expr_00005 <= '0';
      else
        if run_method = run_method_S_0015 then
          binary_expr_00005 <= tmp_0019;
        end if;
      end if;
    end if;
  end process;

  process(clk)
  begin
    if clk'event and clk = '1' then
      if reset = '1' then
        unary_expr_00006 <= (others => '0');
      else
        if run_method = run_method_S_0018 then
          unary_expr_00006 <= tmp_0020;
        end if;
      end if;
    end if;
  end process;

  run_req_flag <= tmp_0002;

  run_req_flag_edge <= tmp_0004;



end RTL;
