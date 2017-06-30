function [S, D, g, dg, ddg, fulla_g] = ternary_sample(data, pct)
    S = [];
    D = [];
    
    x = data(:,1:end-1);
    y = data(:,end);

    idx1 = find(y==1);
    idx2 = find(y==2);
    idx3 = find(y==3);

    tic
    AUX = add_similar(x(idx1, :), pct);
    toc
    S = [S; AUX];
    tic
    AUX = add_similar(x(idx2, :), pct);
    toc
    S = [S; AUX];
    tic
    AUX = add_similar(x(idx3, :), pct);
    toc
    S = [S; AUX];
    
    tic
    AUX = add_disimilar(x(idx1, :), x([idx2 idx3],:), pct);
    toc
    D = [D; AUX];
    tic
    AUX = add_disimilar(x(idx3, :), x(idx2,:), pct);
    toc
    D = [D; AUX];
    fulla_g = function_fulla_generator(S, D);
    g = function_generator_withlog(S, D);
    dg = function_gradient_generator_withlog(S, D);
    ddg = function_hessian_generator_withlog(S, D);
end


function S = add_similar(data, pct)
    S = [];
    n = size(data, 1);
    t = floor(pct*(n*n-n));
    % if(n*n-n < t)
        % error('t too big');
    % end
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

function D = add_disimilar(data1, data2, pct)
    D = [];
    t = floor(pct*(size(data1, 1)*size(data2, 1)));
    % if(size(data1, 1)*size(data2, 1) < t)
        % error('t too big')
    % end
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
