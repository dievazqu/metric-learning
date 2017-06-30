function ans = all_positive(x)
	ans = (sum(x>=0) == size(x,2));
end
