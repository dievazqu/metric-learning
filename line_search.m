function diff = line_search(f, x0, direction)
	
	m = direction * gradient_eval(f, x0)' * 0.5;
	alpha = 1;
	while( (~(f(x0) - f(x0 + alpha * direction) >= alpha*m) | ~all_positive(x0 + alpha * direction)) & alpha>1e-10 )
		alpha = alpha * 0.5;
	end
	diff = alpha * direction;
end


function ans = all_positive(x)
	ans = (sum(x>=0) == size(x,2));
end
