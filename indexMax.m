function index = indexMax(M)
for i=1:length(M)
    if(M(i)==max(M))
        index=i;
    end
end
end