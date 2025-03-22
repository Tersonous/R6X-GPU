module framebuffer (
    input wire clk,
    input wire we,          // Write enable
    input wire [9:0] px,    // X coordinate (0-639)
    input wire [8:0] py,    // Y coordinate (0-479)
    input wire [7:0] color, // 8-bit color (grayscale for simplicity)
    output wire [7:0] pixel // Output pixel color
);

    reg [7:0] memory [0:640*480-1]; // Framebuffer storage

    always @(posedge clk) begin
        if (we) 
            memory[py * 640 + px] <= color;
    end

    assign pixel = memory[py * 640 + px];

endmodule
