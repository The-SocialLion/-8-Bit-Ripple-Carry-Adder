`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    13:25:59 03/26/2021 
// Design Name: 
// Module Name:    rfa 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module raf(a, b, cin, cout, s);
    input [7:0]a;
    input [7:0]b;
    input cin;
    output cout;
    output [7:0]s;
	 wire [6:0]c;
	 fa(a[0],b[0],cin,c[0],s[0]);
	 fa(a[1],b[1],c[0],c[1],s[1]);
	 fa(a[2],b[2],c[1],c[2],s[2]);
	 fa(a[3],b[3],c[2],c[3],s[3]);
	 fa(a[4],b[4],c[3],c[4],s[4]);
	 fa(a[5],b[5],c[4],c[5],s[5]);
	 fa(a[6],b[6],c[5],c[6],s[6]);
	 fa(a[7],b[7],c[6],cout,s[7]);	 
endmodule
module ha(v,w,u,x);
	input w,v;
	output u,x;
	xor(u,v,w);
	and(x,v,w);
endmodule
module fa(e,f,c,carry,sum);
	input e,f,c;
	output carry,sum;
	wire t1,t2,t3;
	ha(e,f,t1,t2);
	ha(t1,c,sum,t3);
	or(carry,t2,t3);
endmodule

