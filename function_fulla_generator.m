function f = function_fulla_generator(S, D)
	f = @(x) summ2(S,x) - log(summ(D,x)) - log(min(eig((x'+x)/2)));
end

function ans = summ2(V, A)
	n = size(V,2);
	ans = 0;
	for i = 1:n
		diff = V(i,:);
		ans = ans + norma(diff, A).^2;
	end
end

function ans = summ(V, A)
	n = size(V,2);
	ans = 0;
	for i = 1:n
		diff = V(i,:);
		ans = ans + norma(diff, A);
	end;
end
