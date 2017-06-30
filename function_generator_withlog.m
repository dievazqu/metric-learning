function f = function_generatorwithlog(S, D)
	f = @(x) summ2(S,x) - log(summ(D,x)) - sum(log(x));
end

function ans = summ2(V, x)
	n = size(V,1);
	A = diag(x);
	ans = 0;
	for i = 1:n
		ans = ans + norma(V(i,:), A).^2;
	end
end

function ans = summ(V, x)
	n = size(V,1);
	A = diag(x);
	ans = 0;
	for i = 1:n
		ans = ans + norma(V(i,:), A);
	end;
end
