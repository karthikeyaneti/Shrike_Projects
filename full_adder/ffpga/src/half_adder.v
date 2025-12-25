// Custom Module

module half_adder(
	input a,b,
	output c,s
	);
		
		assign s = a ^ b;
		assign c = a & b;
	
endmodule
