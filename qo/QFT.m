## -*- texinfo -*-
## @deftypefn {Function file} {} QFT(qubits)
## Function @code{QFT} returns quantum fourier transform
## for given number of @var{qubits}.
##
## @end deftypefn
##
## @seealso {H, Id, ProductGate}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 25 May 2004

function ret = QFT(qubits)
if (nargin!=1)
	usage("QFT(qubits)");
endif

ret = zeros(2^qubits);
n=qubits;
twopowN = 2^n;
twopii = 2*pi*i;

for x=[0:twopowN-1]
	for y=[0:twopowN-1]
		ret(x+1,y+1)=e^(twopii*x*y/(twopowN));
	endfor
endfor
ret = 1/sqrt(2^n)*ret;

endfunction
