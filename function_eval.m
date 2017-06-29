function v = function_eval(f, mat)
	v = [];
	for i=1:size(mat, 1)
		v = [v f(mat(i,:))];
	end
end
