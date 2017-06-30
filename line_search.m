function diff = line_search(f, x0, direction, bool_function)
	alpha = 0.5;
	beta = 0.75;
	
	m = direction * gradient_eval(f, x0)' * alpha;
	
	t = 1;
	while (~bool_function(x0 + t * direction) | (f(x0 + t * direction) > (f(x0)+t*m)))
		t = t * beta;
	end
	diff = t * direction;
end



