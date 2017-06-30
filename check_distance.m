function check_distance(S,A)
    summ2(S, A)
end

function ans = summ2(V, x)
    n = size(V,1);
    A = x;
    ans = 0;
    for i = 1:n
        diff = V(i,:);
        ans = ans + norma(diff, A).^2;
    end
end