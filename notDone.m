function b = notDone(M)
b=false;
for i=1:length(M)
    if(M(i)>0)
        b=true;
    end
end
end