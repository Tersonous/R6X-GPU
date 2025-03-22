module shader_unit (
    input wire clk,
    input wire start,
    input wire [7:0] pixel_in,
    output reg [7:0] pixel_out,
    output reg done
);

    reg [7:0] reg_file [0:7]; // RISC6 Registers
    reg [15:0] instruction;
    
    always @(posedge clk) begin
        if (start) begin
            // Example: Modify brightness using RISC6 instructions
            instruction <= {8'b00000001, pixel_in}; // LDI R1, pixel_in
            reg_file[1] <= instruction[7:0];
            
            instruction <= {8'b00001000, 8'd20}; // ADD R1, 20
            reg_file[1] <= reg_file[1] + instruction[7:0];

            pixel_out <= reg_file[1];
            done <= 1;
        end
    end

endmodule
