function [f, g] = metric_diag_dist(x)
	A = diag(x);
	f = @(v, w) sqrt((v-w)*A*(v-w)');
	g =@(d) sqrt(d*A*d');
end
