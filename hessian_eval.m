function h = hessian_eval(f, x)
	if( size(x,1) ~= 1 )
		error('size(x,1) != 1');
	end
	n = size(x,2);
	G = pderivate(f, n);
	h = [];
	for i=1:n
		h = [h; gradient_eval(G{i}, x)];
	end
end
