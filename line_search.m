function diff = line_search(f, x0, direction, bool_function)
	alpha = 0.2;
	beta = 0.5;
	
	% direction = direction*0.01;

	m = sum(sum(direction .* gradient_eval(f, x0))) * alpha;

	
	t = 1;
	while (~bool_function(x0 + t * direction) | (f(x0 + t * direction) > (f(x0)+t*m)))
		t = t * beta;
	end
	
	diff = t * direction;
end



