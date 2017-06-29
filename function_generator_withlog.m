function f = function_generatorwithlog(S, D)
	f = @(x) summ2(S,x) - log(summ(D,x)) - sum(log(x));
end

function ans = summ2(V, x)
	n = size(V,2);
	A = diag(x);
	ans = 0;
	for i = 1:n
		v = V{i};
		a=v{1,1}(1,:);
		b=v{1,1}(2,:);
		diff = a - b;
		ans = ans + norma(diff, A).^2;
	end
end

function ans = summ(V, x)
	n = size(V,2);
	A = diag(x);
	ans = 0;
	for i = 1:n
		v = V{i};
		a=v{1,1}(1,:);
		b=v{1,1}(2,:);
		diff = a - b;
		ans = ans + norma(diff, A);
	end;
end
