## -*- texinfo -*-
## @deftypefn {Function file} {} Fidelity(rho, sigma)
## Function @code{Fidelity} returns fidelity (distance between)
## of state @var{rho} vs. @var{sigma}.
##
## @end deftypefn
##
## @seealso {Encode, Decode, Recover, Entropy, TrNorm}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 29 March 2004

function ret = Fidelity(rho,sigma)
if (nargin!=2)
	usage("Fidelity (rho,sigma)");
endif

sr = size(rho);

lrho = 0;

if(2.^ceil(log2(sr))==sr && sr(1)==sr(2)) # it is state
	lrho = rho;
elseif(2.^ceil(log2(sr))==sr && sr(1)==1) # it is state vector
	lrho = State(rho);
else
	error("First parameter must be state vector or density matrix!")
endif

sqrtrho = sqrtm(lrho);

temp = sqrtrho*sigma*sqrtrho;

temp = sqrtm(temp);

ret = trace(temp);

endfunction
