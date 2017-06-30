function h = hessian_eval(f, x)
	if( size(x,1) ~= 1 )
		error('size(x,1) != 1');
	end
	n = size(x,2);
    % m = size(x,2);
	G = gradient(f, 1, n);
	h = [];
	for i=1:n
        h = [h; gradient_eval(G{1,i}, x)];
        % h = [h; line];
	end
end
