module and_gate(
	input Branch,
	input Zero,
	output AndGateOut
);

	assign AndGateOut = Branch & Zero;

endmodule
