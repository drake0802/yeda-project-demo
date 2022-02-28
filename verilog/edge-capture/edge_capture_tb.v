module edge_capture_tb();
    reg clk=0;
    initial forever begin #10 clk<=~clk; end
    reg test_begin=0;
    reg rst_signal=1;
    initial begin
        #100 ;test_begin<=1;rst_signal=0;
        #110;rst_signal=1;
        #20 ;rst_signal=0;
    end
    reg rst=1;
    always@(posedge clk)rst<=rst_signal;
    reg [31:0]in[15:0];
    integer i;
    initial begin
        for(i=0;i<16;i=i+1)
           in[i]=$random; 
    end
    
   
    
    reg [4:0]in_counter=0; 
    always@(posedge clk)begin
        if(test_begin)in_counter<=in_counter+1; 
        if(in_counter>=20)$finish;
    end   
    wire [31:0]in_wire=in[in_counter];
    reg [31:0]ref_out=0;
    reg [31:0]in_r=0;
    always@(posedge clk)in_r<=in_wire;    
    genvar j;
    generate 
        for(j=0;j<32;j=j+1)begin:gen_capture
            always@(posedge clk)begin
                if(rst)ref_out[j]<=0;
                else if((in_r[j])&(~in_wire[j])) ref_out[j]<=1;
            end
        end
    endgenerate

    wire [31:0]out;
    edge_capture dut(.clk(clk),.reset(rst),.in(in_wire),.out(out));

    wire error=test_begin?(out!=ref_out):0;

initial begin
    $dumpfile("wave.vcd");
    $dumpvars(0, edge_capture_tb);
end
   
    
endmodule