function f = function_generatorwithlog(S, D)
	f = @(x) summ2(S,x) - log(summ(D,x)) - sum(log(x));
end

function ans = summ2(v, x)
	n = size(v,2);
	A = diag(x);
	ans = 0;
	for i = 1:n
		ans = ans + norma(v(i,:), A).^2;
	end
end

function ans = summ(v, x)
	n = size(v,2);
	A = diag(x);
	ans = 0;
	for i = 1:n
		ans = ans + norma(v(i,:), A);
	end;
end
