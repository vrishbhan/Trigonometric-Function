# Trigonometric-Function

Design for computing cos theta using Taylor series approximation using Verilog

*The 8-bit outputs are monitored in signed decimal radix format for theta = 0° to 360° at the increment of 10°*

### Brief Explanation of results -

The value of cos theta that is obtained is in binary, so we need to convert it to floating point manually for exact result verification

for example lets take the first output of the cos value ( for 10 degree) that is 126 which is 01111110 in binary

The result is actually 0.1111110 which is 0.984375 and that is the value of cos (10 deg)
