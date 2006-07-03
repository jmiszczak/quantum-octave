## -*- texinfo -*-
## @deftypefn {Function file} {} RotYX(@var{real})
## Function @code{RotY} returns 2x2 matrix, that is
## 
## @example 
## @group
## RotY(pi/2)
##  @result{} 
## 0.70711  -0.70711
## 0.70711   0.70711
## @end group
## @end example
##
## @end deftypefn
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 November 2003

function ret = RotY(th)
    ret = [cos(th/2),-sin(th/2);sin(th/2),cos(th/2)];
endfunction