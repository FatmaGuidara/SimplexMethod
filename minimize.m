function Z = minimize(nbrContraintesDual,operationsDual,nbrVariablesDual,plDual,XDual,bjDual)

%******Convert to maximize
nbrContraintes=nbrVariablesDual;

nbrVariables=nbrContraintesDual;
pl=transpose(bjDual);

X=transpose(XDual); 
bj=transpose(plDual);
for i=1:nbrContraintesDual
    operations(i)="";
end
for i=1:nbrContraintesDual
    if(operationsDual(i)==">=")
        operations(i)="<=";
    end
    if(operationsDual(i)==">=")
        operations(i)="<=";
    end 
    if(operationsDual(i)=="==")
        nbrContraintes=nbrContraintes+1;
        X=[X;X(i,:)];
        bj=[bj;bj(i,:)];
        operations(i)="<";
        operations(length(operations)+1)=">";
    end     
end 

%********************************************** tableau 0 ***************************************
Cj=[pl zeros(1,nbrContraintes)];

In=eye(nbrContraintes);
for i=1:nbrContraintes
    if(operations(i)==">=")
        X(i,:)=-X(i,:);
        bj(i,:)=-bj(i,:);
    end
end
M=[X In bj];

%*****vb*****
vb=[];
for i=1:nbrContraintes
    vb=[vb "e"+i];
end
vb=transpose(vb);

coeffVB=[zeros(1,nbrContraintes)];

%***********rest*****
rest=[];
for i=1:nbrVariables
    rest=[rest "x"+i];
end
rest=transpose(rest);

CjName=[transpose(rest) transpose(vb)];

%***********coeff rest*********
coefRest=[];
for i=1:nbrVariables
    coefRest=[coefRest 0];
end
coefRest=transpose(coefRest);


Zj= coeffVB*M;
Zj(:,length(Zj))=[];

Cj_Zj=Cj-Zj;
max = M(:,indexMax(Cj_Zj));
for i=1:length(bj)
    vs(i) = bj(i)./max(i);
    if(max(i)<0)
        vs(i)="Inf";
    end
end
vs=transpose(vs);

disp("-------------------------------------Tableau 0-------------------------------------");
fprintf("         Cj          ");disp(Cj);
tab=[transpose(coeffVB) vb M bj vs];
disp(tab);
fprintf("         Zj          ");disp(Zj);
fprintf("         Cj_Zj         ");disp(Cj_Zj);


min=M(indexMin(vs),:);

pivot=M(indexMin(vs),indexMax(Cj_Zj));

fprintf("pivot =");disp(pivot);
for i=1:nbrVariables
    x(i)=0;
end
Z = coeffVB*bj;
disp("Z =");disp(Z);

entrante=CjName(indexMax(Cj_Zj));
disp("Variable entrante :")
disp(entrante);

sortante=vb(indexMin(vs));
disp("Variable sortante :")
disp(sortante);



%********************************************** tableau i ***************************************
compteur=1;
while(notDone(Cj_Zj))
    for i=1:nbrContraintes
        n=M(i,:);
        if(n(indexMax(Cj_Zj))~=0)&&(i~=indexMin(vs))
            coef=n(indexMax(Cj_Zj))/pivot;
            n=n-coef*min;
            M(i,:)=n;
        end
    end
    if(pivot~=1)
        M(indexMin(vs),:)=M(indexMin(vs),:)./pivot;
    end

    vb(indexMin(vs))=CjName(indexMax(Cj_Zj));
    coeffVB(indexMin(vs))=Cj(indexMax(Cj_Zj));


    Zj= coeffVB*M;
    Zj(:,length(Zj))=[];

    Cj_Zj=Cj-Zj;
    max = M(:,indexMax(Cj_Zj));
    bj=M(:,length(M));
    for i=1:length(bj)
        vs(i) = bj(i)./max(i);
        if(max(i)<0)
            vs(i)="Inf";
        end
    end
    if(notDone(Cj_Zj))
        fprintf('-------------------------------------Tableau %d -------------------------------------\n',compteur);
        fprintf("         Cj          ");disp(Cj);
        tab=[transpose(coeffVB) vb M vs];
        disp(tab);
        fprintf("         Zj          ");disp(Zj);
        fprintf("         Cj_Zj        ");disp(Cj_Zj);


        min=M(indexMin(vs),:);
        pivot=M(indexMin(vs),indexMax(Cj_Zj));
        fprintf("pivot =");disp(pivot);

        Z = coeffVB*bj;
        disp("Z =");disp(Z);

        entrante=CjName(indexMax(Cj_Zj));
        disp("Variable entrante :")
        disp(entrante);

        sortante=vb(indexMin(vs));
        disp("Variable sortante :")
        disp(sortante);
        compteur=compteur+1;
    end
    if(~notDone(Cj_Zj))
        fprintf('-------------------------------------Tableau %d -------------------------------------\n',compteur);
        fprintf("         Cj          ");disp(Cj);
        tab=[transpose(coeffVB) vb M vs];
        disp(tab);
        fprintf("         Zj          ");disp(Zj);
        fprintf("         Cj_Zj        ");disp(Cj_Zj);
        
        Z = coeffVB*bj;
        disp("Zmin =");disp(Z);
    end
    
end

















