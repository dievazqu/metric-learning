function f = function_generator(S, D)
	f = @(x) summ2(S,x) - log(summ(D,x));
end

function ans = summ2(v, x)
	ans = 0;
	A = diag(x);
	for i=1:size(v,1)
		v_i = v(i,:);
		ans = ans + v_i*A*v_i';
	end
end

function ans = summ(v, x)
	ans = 0;
	A = diag(x);
	for i=1:size(v,1)
		v_i = v(i,:);
		ans = ans + v_i*A*v_i';
	end
	ans = sqrt(ans);
end
