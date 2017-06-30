function x0 = gradient_descent(f, x0, bool_function, df)
	if nargin<3
		bool_function = @all_positive;
	end
	if nargin<4
		df = @(x) gradient_eval(f, x);
	end
	
	fx0 = f(x0)+100;
	while(abs(f(x0)-fx0)>1e-6)
		direction = -df(x0);
		fx0 = f(x0)
		diff = line_search(f, x0, direction, bool_function);
		x0 = x0 + diff;
	end
end
