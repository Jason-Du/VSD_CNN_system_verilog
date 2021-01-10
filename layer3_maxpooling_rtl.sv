`timescale 1ns/10ps
`include "maxpooling_2x2_rtl.sv"
`include "stage26_fifo_rtl.sv"
`include "counter_cnn_rtl.sv"
`include "def.svh"
module layer3_maxpooling(
	clk,
	rst,
	input_data,
	
	pixel_store_done,
	//IN OUT PORT
	save_enable,
	output_row,
	output_col,
	
	layer3_calculation_done,
	pipeline_layer3_calculation_done,
	output_data,
	//fix
	//read_pixel_addr,
	read_col_addr,
	read_row_addr,
	//fix
	read_pixel_signal,

);
	input                                           clk;
	input                                           rst;
	input        [`LAYER3_WEIGHT_INPUT_LENGTH-1:0]  input_data;
	
	input                                           pixel_store_done;
	//IN OUT PORT
	output logic                                    save_enable;
	output logic [                `WORDLENGTH-1:0]  output_row;
	output logic [                `WORDLENGTH-1:0]  output_col;
	
	output logic                                    layer3_calculation_done;
	output logic                                    pipeline_layer3_calculation_done;
	output logic [      `LAYER3_OUTPUT_LENGTH-1:0]  output_data;
	//fix
	//read_pixel_addr;
	output logic [                `WORDLENGTH-1:0]  read_col_addr;
	output logic [                `WORDLENGTH-1:0]  read_row_addr;
	//fix
	output logic                                    read_pixel_signal;
	
	
	
	
	
	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] buffer_output;

	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_2_2_register_in;
	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_2_1_register_in;

	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_2_2_register_out;
	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_2_1_register_out;

	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_1_2_register_in;
	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_1_1_register_in;
	
	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_1_2_register_out;
	logic  [ `LAYER3_WEIGHT_INPUT_LENGTH-1:0] col_1_1_register_out;
	
	//----------------------------SAVE ADDRESS SIGNAL CONTROL----------------------------//
	//set counter is also col counter
	localparam SAVE_IDLE=2'b00;
	localparam SAVE_SETTING=2'b01;
	localparam SAVE_ENABLE=2'b10;
	logic  [15:0] save_address_row_count;
	logic         save_address_row_clear;
	logic         save_address_row_keep;
	

	logic  [15:0] read_pixel_count;
	logic  read_pixel_clear;
	
	logic  [15:0] set_count;
	logic         set_clear;
	logic         set_keep;
	logic  [1:0]  save_cs;
	logic  [1:0]  save_ns;
	//fix 
	logic [15:0] read_pixel_row_count;
	logic        read_pixel_row_clear;
	logic        read_pixel_row_keep;
	//fix
	
	always_ff@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			save_cs<=SAVE_IDLE;
		end
		else
		begin
			save_cs=save_ns;
		end
	end
	always_comb
	begin
		//read_pixel_addr=read_pixel_count;
		read_col_addr=read_pixel_count;
		read_row_addr=read_pixel_row_count;
		output_row=save_address_row_count>>1;
		output_col=set_count>>1;
		//read_weights_buffer_num_sel=5'd3;
		case(save_cs)
		SAVE_IDLE:
		begin
			save_address_row_keep=1'b1;
			layer3_calculation_done=1'b0;
			pipeline_layer3_calculation_done=1'b0;
			save_address_row_clear=1'b1;
			save_enable=1'b0;
			set_clear=1'b1;
			set_keep=1'b0;
			read_pixel_signal=1'b0;
			read_pixel_clear=1'b1;
			//keep
			read_pixel_row_clear=1'b1;
			read_pixel_row_keep=1'b1;
			//keep
			if(pixel_store_done)
			begin
				save_ns=SAVE_SETTING;
			end
			else
			begin
				save_ns=SAVE_IDLE;
			end
		end
		SAVE_SETTING:
		begin
			save_address_row_keep=1'b1;
			layer3_calculation_done=1'b0;
			pipeline_layer3_calculation_done=1'b0;
			save_address_row_clear=1'b1;
			read_pixel_signal=1'b1;
			set_keep=1'b0;
			//fix
			//read_pixel_clear=1'b0;
			read_pixel_row_clear=1'b0;
			if (read_pixel_count==16'd`LAYER3_WIDTH-1)
			begin
				read_pixel_clear=1'b1;
				read_pixel_row_keep=1'b0;
			end
			else
			begin
				read_pixel_clear=1'b0;
				read_pixel_row_keep=1'b1;
			end
			//fix
			if(set_count==16'd`LAYER3_SET_COUNT)
			begin
				set_clear=1'b1;
				save_enable=1'b0;
				save_ns=SAVE_ENABLE;
			end
			else
			begin
				set_clear=1'b0;
				save_enable=1'b0;
				save_ns=SAVE_SETTING;
			end
		end
		SAVE_ENABLE:
		begin
			save_address_row_clear=1'b0;
			read_pixel_signal=1'b1;
			set_keep=1'b0;
			//fix
			//read_pixel_clear=1'b0;
			read_pixel_row_clear=1'b0;
			if (read_pixel_count==16'd`LAYER3_WIDTH-1)
			begin
				read_pixel_clear=1'b1;
				read_pixel_row_keep=1'b0;
			end
			else
			begin
				read_pixel_clear=1'b0;
				read_pixel_row_keep=1'b1;
			end
			//fix
			////////////////////////////////////////////////////////////////
			if(set_count==16'd`LAYER3_WIDTH-1)
			begin
				set_clear=1'b1;
				save_address_row_keep=1'b0;
			end
			else
			begin
				set_clear=1'b0;
				save_address_row_keep=1'b1;
			end
			//////////////////////////////////////////////////////////////
			if(save_address_row_count==16'd4&&set_count==`LAYER3_WIDTH-2)
			begin
				pipeline_layer3_calculation_done=1'b1;
			end
			else
			begin
				pipeline_layer3_calculation_done=1'b0;
			end
			if(save_address_row_count==16'd`LAYER3_WIDTH-2&&set_count==16'd`LAYER3_WIDTH-2)
			begin
				save_ns=SAVE_IDLE;
				layer3_calculation_done=1'b1;
			end
			else
			begin
				save_ns=SAVE_ENABLE;
				layer3_calculation_done=1'b0;
			end
			if(set_count>16'd`LAYER3_WIDTH-2||set_count[0]==1||save_address_row_count[0]==1)
			begin
				save_enable=1'b0;
			end
			else
			begin
				save_enable=1'b1;
			end
			
		end
		default:
		begin
			set_clear=1'b1;
			set_keep=1'b0;
			save_address_row_clear=1'b1;
			save_address_row_keep=1'b0;
			layer3_calculation_done=1'b0;
			pipeline_layer3_calculation_done=1'b0;
			save_enable=1'b0;
			save_ns=SAVE_IDLE;
			read_pixel_signal=1'b0;
			read_pixel_clear=1'b1;
			//fix
			read_pixel_row_clear=1'b1;
			read_pixel_row_keep=1'b0;
			//fix
		end
		endcase
	end
// fix

	counter_cnn read_col_counter(
	.clk(clk),
	.rst(rst),
	.count(read_pixel_row_count),
	.clear(read_pixel_row_clear),
	.keep(read_pixel_row_keep)
	);
// fix
	counter_cnn read_counter(
	.clk(clk),
	.rst(rst),
	.count(read_pixel_count),
	.clear(read_pixel_clear),
	.keep(1'b0)
	);
	
	counter_cnn set_counter(
	.clk(clk),
	.rst(rst),
	.count(set_count),
	.clear(set_clear),
	.keep(1'b0)
	);
	counter_cnn save_address_row(
	.clk(clk),
	.rst(rst),
	.count(save_address_row_count),
	.clear(save_address_row_clear),
	.keep(save_address_row_keep)
	);
	
	
///--------------------------------MAXPOOLING OPERATION---------------------------------//
maxpooling_2x2 max_channel1(
	.input_channel1(col_1_1_register_out[15:0]),
	.input_channel2(col_1_2_register_out[15:0]),
	.input_channel3(col_2_1_register_out[15:0]),
	.input_channel4(col_2_2_register_out[15:0]),
	
	.output_channel(output_data[15:0])
);
maxpooling_2x2 max_channel2(
	.input_channel1(col_1_1_register_out[31:16]),
	.input_channel2(col_1_2_register_out[31:16]),
	.input_channel3(col_2_1_register_out[31:16]),
	.input_channel4(col_2_2_register_out[31:16]),
	
	.output_channel(output_data[31:16])
);
maxpooling_2x2 max_channel3(
	.input_channel1(col_1_1_register_out[47:32]),
	.input_channel2(col_1_2_register_out[47:32]),
	.input_channel3(col_2_1_register_out[47:32]),
	.input_channel4(col_2_2_register_out[47:32]),
	
	.output_channel(output_data[47:32])
);
maxpooling_2x2 max_channel4(
	.input_channel1(col_1_1_register_out[63:48]),
	.input_channel2(col_1_2_register_out[63:48]),
	.input_channel3(col_2_1_register_out[63:48]),
	.input_channel4(col_2_2_register_out[63:48]),
	
	.output_channel(output_data[63:48])
);
maxpooling_2x2 max_channel5(
	.input_channel1(col_1_1_register_out[79:64]),
	.input_channel2(col_1_2_register_out[79:64]),
	.input_channel3(col_2_1_register_out[79:64]),
	.input_channel4(col_2_2_register_out[79:64]),
	
	.output_channel(output_data[79:64])
);
maxpooling_2x2 max_channel6(
	.input_channel1(col_1_1_register_out[95:80]),
	.input_channel2(col_1_2_register_out[95:80]),
	.input_channel3(col_2_1_register_out[95:80]),
	.input_channel4(col_2_2_register_out[95:80]),
	
	.output_channel(output_data[95:80])
);
maxpooling_2x2 max_channel7(
	.input_channel1(col_1_1_register_out[111:96]),
	.input_channel2(col_1_2_register_out[111:96]),
	.input_channel3(col_2_1_register_out[111:96]),
	.input_channel4(col_2_2_register_out[111:96]),
	
	.output_channel(output_data[111:96])
);
maxpooling_2x2 max_channel8(
	.input_channel1(col_1_1_register_out[127:112]),
	.input_channel2(col_1_2_register_out[127:112]),
	.input_channel3(col_2_1_register_out[127:112]),
	.input_channel4(col_2_2_register_out[127:112]),
	
	.output_channel(output_data[127:112])
);	
//----------------------------------------BUFFER_CHAIN--------------------------------------------//
	stage26_fifo first_stage(
	.clk(clk),
	.rst(rst),
	.input_data(col_2_1_register_out),
	.output_data(buffer_output)
	);
	always_comb
	begin
		col_2_2_register_in=input_data;
		col_2_1_register_in=col_2_2_register_out;
		
		col_1_2_register_in=buffer_output;
		col_1_1_register_in=col_1_2_register_out;
	end
	always_ff@(posedge clk or posedge rst)
	begin
		if(rst)
		begin
			col_2_2_register_out<=16'd0;
			col_2_1_register_out<=16'd0;
			
			col_1_2_register_out<=16'd0;
			col_1_1_register_out<=16'd0;
		end
		else
		begin
			
			col_2_2_register_out<=col_2_2_register_in;
			col_2_1_register_out<=col_2_1_register_in;
			
			col_1_2_register_out<=col_1_2_register_in;
			col_1_1_register_out<=col_1_1_register_in;
		end
	end
endmodule

