`timescale 1ns / 1ps


module barrel_shifter(input [3:0]in,
                       input [1:0] shift,
                       input dir,
                       output reg [3:0] out);
                    always @(*) begin
    case (dir)
        1'b1: begin 
            case (shift)
                2'b00: out = in;                  
                2'b01:out = {in[2:0], 1'b0};     
                2'b10:out = {in[1:0], 2'b00};    
                2'b11:out = {in[0], 3'b000};    
                default:out = 4'b0000;                
            endcase
        end
        1'b0: begin 
            case (shift)
                2'b00: out = in;                  
                2'b01: out = {1'b0, in[3:1]};     
                2'b10: out = {2'b00, in[3:2]};    
                2'b11: out = {3'b000, in[3]};     
                default: out = 4'b0000;                
            endcase
        end
        default: out = 4'b0000; // Default case
    endcase
end
                    
endmodule
