function x0 = gradient_descent(f, x0)
	if( size(x0,1) ~= 1 )
		error('size(x0,1) != 1');
	end
	
	diff = 1;
	while(norm(diff)>1e-5)
		direction = -gradient_eval(f, x0);
		diff = line_search(f, x0, direction);
		x0 = x0 + diff;
	end
end
