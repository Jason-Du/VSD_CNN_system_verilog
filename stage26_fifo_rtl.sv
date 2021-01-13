`timescale 1ns/10ps
`include"def.svh"
module stage26_fifo(
	clk,
	rst,
	input_data,
	output_data
);
input               clk;
input               rst;
input        [`LAYER3_WEIGHT_INPUT_LENGTH-1:0] input_data;//127
output logic [`LAYER3_WEIGHT_INPUT_LENGTH-1:0] output_data;
logic        [`LAYER3_WEIGHT_INPUT_LENGTH-1:0] Reg_in  [`LAYER3_WIDTH-2];
logic        [`LAYER3_WEIGHT_INPUT_LENGTH-1:0] Reg_out [`LAYER3_WIDTH-2];
	always_ff@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			for(int i=0;i<=`LAYER3_WIDTH-3;i++)
			begin
				Reg_out[i]<=`LAYER3_WEIGHT_INPUT_LENGTH'd0;
				//$display("rst check");
				//$display(i);
			end
		end
		else
		begin
			for(int i=0;i<=`LAYER3_WIDTH-3;i++)
			begin
				Reg_out[i]<=Reg_in[i];
			end
		end
	end
	always_comb
	begin
		for(int i=0;i<`LAYER3_WIDTH-3;i++)
		begin
			Reg_in[i+1]=Reg_out[i];
		end
		output_data=Reg_out[`LAYER3_WIDTH-3];
		Reg_in[0]=input_data;
	end
	
endmodule


