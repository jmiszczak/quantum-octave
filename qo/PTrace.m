## -*- texinfo -*-
## @deftypefn {Function file} {} PTrance(state, targv)
## Function @code{PTrace} returns density matrix obtained
## from matrix @var{state} by tracing out subspace of qubits
## listed in @var{targv}.
##
## @example 
## @group
## PTrace(State(Ket([0,0,0])),[1,2])
##  @result{} 
##	1 0
##	0 0
## @end group
## @end example
##
## @end deftypefn
##
## @seealso {ProductGate, PartialTranspose}
##
## Author: Piotr Gawron, Jaroslaw Miszczak
## Created: 15 March 2004

function ret = PTrace(state,tqidx)
targv = sort(tqidx); # must be sorted!

ss = size(state)(2); # dimension of matrix state - always power of 2
sq = log2(ss); # numer of qubits in matrix state

tq = size(targv)(2); # number of qubits to trace-out
ts = 2^tq;

rq = sq - tq; # calculate number of qubits in returned density matrix
rs = 2^rq; # calculate size of returned density matrix

ret = zeros (rs); # inicialize returned density matrix

# loop over every matrix emelent of returned density matrix
for i = 1:rs
	for j = 1:rs
#*		printf("(%d,%d) ",i,j);
#*		printf("[%d], [%d]\n",Dec2BinVec(i-1,rq),Dec2BinVec(j-1,rq));
		bi = Dec2BinVec(i-1,rq);
		bj = Dec2BinVec(j-1,rq);
	
	# sum loop over elements of targv list
		for k = 0:ts-1
			bk = Dec2BinVec(k,tq);
#*			printf("k  = %d\n", b);
			BRA = BuildBinaryVector(targv,bk,bi,sq)';
			KET = BuildBinaryVector(targv,bk,bj,sq);
			temp = BRA*(state*KET);
			ret(i,j) +=  temp;
		endfor
	endfor
endfor
endfunction
