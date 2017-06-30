function f = function_generator(S, D)
	f = @(x) summ2(S,x) - log(summ(D,x));
end

function ans = summ2(V, x)
	n = size(V,1);
	A = diag(x);
	ans = 0;
	for i = 1:n
		diff = V(i,:);
		ans = ans + norma(diff, A).^2;
	end
end

function ans = summ(V, x)
	n = size(V,1);
	A = diag(x);
	ans = 0;
	for i = 1:n
		diff = V(i,:);
		ans = ans + norma(diff, A);
	end;
end
