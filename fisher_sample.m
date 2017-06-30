function [S, D, g, dg, ddg, fulla_g] = fisher_sample()
	load fisheriris;
	S = [];
	D = [];
	
	AUX = add_similar(meas(1:50, :), 1000);
	S = [S; AUX];
	AUX = add_similar(meas(51:100, :), 1000);
	S = [S; AUX];
	AUX = add_similar(meas(101:150, :), 1000);
	S = [S; AUX];
	
	AUX = add_disimilar(meas(1:50, :), meas(51:150,:), 2000);
	D = [D; AUX];
	AUX = add_disimilar(meas(101:150, :), meas(51:100,:), 1000);
	D = [D; AUX];
	fulla_g = function_fulla_generator(S, D);
	g = function_generator_withlog(S, D);
	dg = function_gradient_generator_withlog(S, D);
	ddg = function_hessian_generator_withlog(S, D);
end


function S = add_similar(data, t)
	S = [];
	n = size(data, 1);
	if(n*n-n < t)
		error('t too big');
	end
	perm = randperm(n*n);
	k = 1;
	q = 1;
	while(k<=t)
		
		i = mod(perm(q)-1, n) + 1;
		j = floor((perm(q)-1) / n) + 1;
		if( i==j )
			q = q+1;
			continue;
		end
		S = [S; data(i,:)-data(j,:)];
		k = k + 1;
		q = q + 1;
	end
end

function D = add_disimilar(data1, data2, t)
	D = [];
	if(size(data1, 1)*size(data2, 1) < t)
		error('t too big')
	end
	n = size(data1, 1);
	% 50 x 100; n = 50; 1 y 5000
	perm = randperm(size(data1, 1)*size(data2, 1));
	k = 1;
	while(k<=t)
		i = mod(perm(k)-1, n) + 1;
		j = floor((perm(k)-1) / n) + 1;
		D = [D; data1(i,:)-data2(j,:)];
		k = k + 1;
	end
end
