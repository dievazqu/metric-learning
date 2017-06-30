function ans = semidefiniteness(x)
	e = eig(x);
	ans = isreal(e) & min(e) >= 2*1e-4;
end
