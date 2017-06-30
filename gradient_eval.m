function g = gradient_eval(f, x)
	n = size(x,1);
	m = size(x,2);
	G = gradient(f, n, m);
	g = [];
	for i=1:n
		line = [];
		for j=1:m
			line = [line G{i,j}(x)];
		end
		g = [g; line];
	end
end
