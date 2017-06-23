function F = derivate(f, n)
	if nargin<2
		n=1;
	end
	if(n==1)
		F = derivate_(f);
	elseif (n==2)
		F = derivate2_(f);
	else
		F = derivate2_(derivate(f,n-2));
	end
end

function F = derivate_(f)
	EPS = 1e-4;
	F = @(x) ((f(x+EPS)-f(x-EPS)) ./ (2*EPS));
end

function F = derivate2_(f)
	EPS = 1e-4;
	F = @(x) ((f(x+EPS)-2*f(x)+f(x-EPS)) ./ (EPS*EPS));
end
