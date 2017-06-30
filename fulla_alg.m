function Ap = fulla_alg(S, D, A)

    Aprev = A*0;
    g = g_gen(D);
    g_grad = g_grad_gen(D);
    while(~hasConvergedOuter(g, A, Aprev))
        Aprev = A;
        Aprev2 = A + 1; 
        while(~hasConvergedInner(A, Aprev2))
            Aprev2 = A;
            A = projection_c1(S,A);
            A = projection_c2(A);
        end
        A = gradient_descent(g, g_grad, A)
        g(A)
    end
    Ap = Aprev2;
end

function ans = hasConvergedOuter(g, A, Aprev)
    ans = abs(g(A) - g(Aprev)) < 1e-4;
end

function ans = hasConvergedInner(A, Aprev)
    ans = abs(norm(A(:)) - norm(Aprev(:))) < 1e-2;
end

function Ap = projection_c1(S, x)
    v_a = x(:);

    H = 2*eye(length(v_a));
    f = -2*v_a;
    A = quadA(S, size(x,1));
    b = 1;

    options = optimset('Algorithm','interior-point-convex','Display','off');

    v_min = quadprog(H, f, A, b, [], [], [], [], [], options);

    Ap = reshape(v_min, size(x,1), size(x,2));
end


function A = quadA(S, n)
    A = [];
    for k=1:n*n
        A = [A quadConst(S, n, k)];
    end
end

function const = quadConst(S, n, k)
    i = mod(k-1,n) + 1;
    j = floor((k - 1)/n) + 1;
    const = 0;
    for q=1:size(S,1)
        const = const + S(q,i)*S(q,j);
    end
end

function Ap = projection_c2(A)
    [V D] = eig(A);
    D = max(D, 0);
    Ap = V*D*V';
end

function Ap = gradient_descent(g, g_grad, A)
    % alpha = 0.0001;
    direction = -g_grad(A);
    direction = fulla_line_search(g, g_grad, A, direction);
    Ap = A + direction;
end

function g = g_gen(D)
    g = @(A) -g_full(D,A);
end

function g_grad = g_grad_gen(D)
    g_grad = @(A) -g_full_grad(D, A);
end

function ans = g_full(D, A)
    n = size(D,1);
    ans = 0;
    for i = 1:n
        diff = D(i,:);
        ans = ans + norma(diff, A);
    end;
end

function grad = g_full_grad(D, A)
    grad = [];
    n = size(A,1);
    m = size(A,2);
    for i=1:n
        line = [];
        for j=1:m
            line = [line g_full_grad_ij(D,A,i,j)];
        end
        grad = [grad; line];
    end
end

function gradij = g_full_grad_ij(D,A,i,j)
    gradij = 0;
    for k=1:size(D,1)
        na = max(norma(D(k,:), A), 1e-6);
        gradij = gradij + (D(k,i)*D(k,j))/(2*na);
    end
end

function diff = fulla_line_search(g, dg, x0, direction)
    alpha = 0.2;
    beta = 0.25;
    
    % direction = direction*0.01;
    m = sum(sum(direction .* dg(x0))) * alpha;

    
    t = 1;
    while (g(x0 + t * direction) > (g(x0)+t*m))
        t = t * beta;
    end
    
    diff = t * direction;
end
