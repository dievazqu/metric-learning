function ddg = function_hessian_generator_withlog(S, D)
	ddg = @(x) eval_dd(S,D,x);
end


function mat = eval_dd(S,D,x)
	n = size(x,2);
	mat = [];
	for i=1:n
		line = [];
		for j=1:n
			line = [line eval_ij(S,D,x,i,j)];
		end
		mat = [mat; line];
	end
end


function ans = eval_ij(S,D,x,i,j)
	s = size(S,1);
	A = diag(x);
	s1 = norm_sum(D, A);
	s2 = partial_sum(D,A,i);
	s3 = partial_sum(D,A,j);
	s4 = s1;
	s5 = 0;
	d = size(D,1);
	for q = 1:d
		diff = D(q,:);
		s5 = s5 - diff(i)^2*diff(j)^2/(4*norma(diff,A)^3);
	end
	ans =  1/s1^2 * s2 * s3 - 1/s4 * s5;
	if(i==j)
		ans = ans + 1/x(i)^2;
	end
end


function ans = norm_sum(S, A)
	ans = 0;
	s = size(S,1);
	for q = 1:s
		diff = S(q,:);
		ans = ans + norma(diff,A);
	end
end

function ans = partial_sum(S,A,i)
	ans = 0;
	s = size(S,1);
	for q = 1:s
		diff = S(q,:);
		ans = ans + (diff(i)^2)/(2*norma(diff,A));
	end
end
