function new_data = map(data, sA)
    new_data = [];
    for i=1:size(data,1)
        new_data = [new_data; data(i,:)*sA];
    end
end