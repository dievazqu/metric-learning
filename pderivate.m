function F = pderivate(f, dim)
	F = {};
	for i=1:dim
		F{i} = @(x) pderivate_(f, x, i);
	end
end

function ans = pderivate_(f, x, i)
	EPS = 1e-4;
	x(:,i) = x(:,i)+EPS;
	f2 = f(x);
	x(:,i) = x(:,i)-2*EPS;
	f1 = f(x);
	ans = (f2-f1) / (2*EPS);
end


