function ans = semidefiniteness(x)
	e = eig(x);
	ans = min(e) >= 0;
end
