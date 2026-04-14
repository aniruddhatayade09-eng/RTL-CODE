    module pwm( clk_1,reset,on,pwm_out_buf);
input clk_1;
input [15:0] on;  
input reset;
output wire pwm_out_buf;

reg [15:0] on_time = 5;
reg [10:0]total_time = 100;

always @(posedge clk_1) begin

if (reset) begin 
 total_time <= 0;
 on_time <= 5;
end else begin 
if (total_time == 1200) begin
  on_time <= on;
  total_time <= 0;
end else 
 total_time <= total_time + 1;
 end
 end
 
 assign pwm_out_buf = (on_time >= total_time ) ? 0 : 1;

 endmodule
