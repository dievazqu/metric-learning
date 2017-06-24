function g = gradient_eval(f, x)
	n = size(x,2);
	G = pderivate(f, n);
	g = [];
	for i=1:n
		g = [g G{i}(x)];
	end
end
