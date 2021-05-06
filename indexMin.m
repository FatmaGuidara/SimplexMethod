function index = indexMin(M)
for i=1:length(M)
    if(M(i)==min(M))
        index=i;
    end
end
end