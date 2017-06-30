function dg = function_gradient_generator(S, D)
	dg = @(x) eval_d(S,D,x);
end


function v = eval_d(S,D,x)
	n = size(x,2);
	v = [];
	for i=1:n
		v = [v eval_i(S,D,x,i)];
	end
end


function ans = eval_i(S,D,x,i)
	s = size(S,2);
	A = diag(x);
	s1 = 0;
	for q = 1:s
		s1 = s1 + S(q,:)^2;
	end
	s2 = 0;
	d = size(D,2);
	for q = 1:d
		s2 = s2 + norma(D(q,:),A);
	end
	
	s3 = 0;
	for q = 1:d
		diff = D(q,:);
		s3 = s3 + (diff(i)^2)/(2*norma(diff,A));
	end
	ans = s1 - s3 / s2;
end
