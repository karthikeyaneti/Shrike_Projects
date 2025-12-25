(* top *) module full_adder (
	(* iopad_external_pin *) input a,
	(* iopad_external_pin *) input b,
	(* iopad_external_pin *) input c_in,
	(* iopad_external_pin *) output sum,
	(* iopad_external_pin *) output sum_en,
	(* iopad_external_pin *) output carry,
	(* iopad_external_pin *) output carry_en
);
	assign sum_en = 1'b1;
	assign carry_en = 1'b1;
	
	wire w1, w2, w3;
	
	half_adder ha1(a, b, w1, w2);
	half_adder ha2(w2, c_in, w3, sum);
	or or1(carry, w1, w3);
	
endmodule