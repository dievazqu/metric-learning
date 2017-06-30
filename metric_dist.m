function [f, g] = metric_dist(A)
	f = @(v, w) sqrt((v-w)*A*(v-w)');
	g =@(d) sqrt(d*A*d');
end
