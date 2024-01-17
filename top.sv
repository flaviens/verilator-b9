module top(clkin_data, in_data, out_data);
  wire interm0_;
  wire [14:0] interm1_;
  wire [14:0] interm2_;
  wire [10:0] interm3_;
  wire [10:0] interm4_;
  wire [24:0] celloutsig_0z;
  wire celloutsig_2z;
  wire celloutsig_3z;
  input [159:0] clkin_data;
  wire [159:0] clkin_data;
  input [95:0] in_data;
  wire [95:0] in_data;
  output [95:0] out_data;
  wire [95:0] out_data;
  assign celloutsig_2z = ~(interm0_ | celloutsig_0z[1]);
  assign celloutsig_0z = in_data[67:43] + in_data[59:35];
  assign celloutsig_3z = { celloutsig_0z[14:3], interm2_[2:0] } && { in_data[46:44], interm1_[11:7], celloutsig_2z, interm1_[5:0] };
  reg [10:0] interm8_;
  always_ff @(posedge clkin_data[0], negedge clkin_data[32])
    if (!clkin_data[32]) interm8_ <= in_data[24:14];
    else interm8_ <= { celloutsig_0z[23:14], interm4_[0] };
  assign { interm3_[10:2], interm0_, interm3_[0] } = interm8_;
  assign { interm1_[14:12], interm1_[6] } = { in_data[46:44], celloutsig_2z };
  assign interm2_[14:3] = celloutsig_0z[14:3];
  assign interm3_[1] = interm0_;
  assign interm4_[10:1] = celloutsig_0z[23:14];
  assign out_data[0] = celloutsig_3z;
endmodule
