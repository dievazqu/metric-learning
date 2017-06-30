function x0 = newton_raphson(f, x0, g, h)
	if( size(x0,1) ~= 1 )
		error('size(x0,1) != 1');
	end
	if nargin<3
		g = @(x) gradient_eval(f, x);
		h = @(x) hessian_eval(f, x);
	end
	diff = 1;
	n = size(x0,2);
	fx0 = f(x0)+100;
	while(abs(f(x0)-fx0)>1e-6)
		fx0 = f(x0)
		H = h(x0);
		G = g(x0);
		if( isInversible(H) )
			diff = - G * inv(H) ;
			diff = line_search(f, x0, diff, @all_positive);
			x0 = x0 + diff;
		else
			diff = 0;
		end
	end
	
end


function bool = isInversible(H)
	bool = (rank(H) == min(size(H)));
end
