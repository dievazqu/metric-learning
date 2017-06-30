function ans = semidefiniteness(x)
	e = eig(x);
	ans = isreal(e) & min(e) >= 0;
end
