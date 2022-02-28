module edge_capture(
    input clk,
    input reset,
    input [31:0] in,
    output [31:0] out
);
    reg [31:0]out_reg=0;
    assign out=out_reg;
    
    reg [31:0]in_r=0;
genvar i;
generate 
    for(i=0;i<32;i=i+1)begin:gen_capture
        always@(posedge clk)in_r[i]<=in[i];
        
        always@(posedge clk)begin
            if(reset)out_reg[i]<=0;
            else if((in_r[i])&(~in[i])) out_reg[i]<=1;
        end
    end
endgenerate
    
endmodule