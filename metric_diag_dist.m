function f = metric_diag_dist(x)
	A = diag(x);
	f = @(v, w) sqrt((v-w)*A*(v-w)');
end
