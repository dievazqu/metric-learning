function x0 = newton_raphson(f, x0)
	if( size(x0,1) ~= 1 )
		error('size(x0,1) != 1');
	end
	diff = 1;
	n = size(x0,2);
	while(norm(diff)>1e-5)
		H = hessian_eval(f, x0);
		G = gradient_eval(f, x0);
		if( isInversible(H))
			diff = G * inv(H)';
			for i=1:n
				if(x0(i) < diff(i))
					% x0(i) = diff(i) * alpha
					alpha = x0(i)./diff(i);
					diff = diff * alpha;
				end
			end
			x0 = x0 - diff;
		else
			diff = 0;
		end
	end
end


function bool = isInversible(H)
	bool = (rank(H) == min(size(H)));
end
