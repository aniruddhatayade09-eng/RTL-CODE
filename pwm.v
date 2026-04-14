    module pwm( clk_1,reset,on,pwm_out_buf/*LED*/);
input clk_1;
input [15:0] on;  
input reset;
output wire pwm_out_buf;
//output wire [15:0] LED;

//wire clk;
//reg ref_clk;
//reg [2:0] div_count ;
//reg [31:0] count = 0;
reg [15:0] on_time = 5;
//reg [15:0] off_time = 20;
reg [10:0]total_time = 100;



 

//assign LED = {off,on};


//always @(posedge clk) begin
   
//   if ( div_count == 5) begin
//       ref_clk <= 1;
//       div_count <= 0; 
//       end
//    else   begin
//      ref_clk <= 0;
//      div_count <= div_count + 1;
//     end
//end

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