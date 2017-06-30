function F = gradient(f, n, m)
	F = {};
	for i=1:n
		for j=1:m
			F{i,j} = @(x) pderivate(f, x, i, j);
		end
	end
end

function ans = pderivate(f, x, i, j)
	EPS = 1e-4;
	x(i,j) = x(i,j)+EPS;
	f2 = f(x);
	x(i,j) = x(i,j)-2*EPS;
	f1 = f(x);
	ans = (f2-f1) / (2*EPS);
end


