function f = function_generator(S, D)
	f = @(x) summ2(S,x) - log(summ(D,x));
end

function ans = summ2(V, x)
	n = size(V,2);
	A = diag(x);
	ans = 0;
	for i = 1:(n-1)
		v = V{i};
		a=v{1,1}(1,:);
		b=v{1,1}(2,:);
		diff = a - b;
		ans = ans + diff*A*diff';
	end
end

function ans = summ(V, x)
	n = size(V,2);
	A = diag(x);
	ans = 0;
	for i = 1:(n-1)
		v = V{i};
		a=v{1,1}(1,:);
		b=v{1,1}(2,:);
		diff = a - b;
		ans = ans + diff*A*diff';
	end
	ans = sqrt(ans);
end
