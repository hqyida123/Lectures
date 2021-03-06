function nV = getNextV(W, x, Pi);
global L M c alpha delta beta g;

cont = zeros(L,L);
cont(1, :) = W(1,:,2).*((1+delta*alpha.*x(1,:))./(1 + alpha.*x(1,:))) + ...
    W(1,:,3).*(((1-delta)*alpha.*x(1,:))./(1 + alpha.*x(1,:)));

cont(L, : ) = W(L,:,2).*((1-delta+alpha.*x(L,:))./(1 + alpha.*x(L,:))) + ...
    W(L,:,1).*(delta./(1 + alpha.*x(L,:)));

cont(2:L-1, :) = W(2:L-1,:,3).*((1-delta)*alpha*x(2:L-1,:))./(1 + alpha*x(2:L-1,:)) + ...
    W(2:L-1,:,2).*(1-delta+delta*alpha*x(2:L-1,:))./(1 + alpha*x(2:L-1,:)) + ...
    W(2:L-1,:,1).*(delta./(1 + alpha*x(2:L-1,:)));

nV = Pi - x + beta*cont;