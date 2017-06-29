function diff = line_search(f, x0, direction)
	
	alpha = 0.2;
	beta = 0.5;
	
	m = direction * gradient_eval(f, x0)' * alpha;
	
	t = 1;
	while ((f(x0 + t * direction) > (f(x0)+t*m)) | ~all_positive(x0 + t * direction))
		t = t * beta;
	end
	diff = t * direction;
end


function ans = all_positive(x)
	ans = (sum(x>=0) == size(x,2));
	%ans = true;
end
