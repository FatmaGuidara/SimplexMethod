function main()
clc;clear;
%exemples

%probleme de maximization
%exemple Cours 1
disp(" ");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp("-------------------------------------------------------- EXAMPLE Cours 1 --------------------------------------------------------");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp(" ");

nbrContraintes=3;
operations=["<=" "<=" "<="];
nbrVariables=2;
%pl=coef des variables xi
pl=[30 50];
X=[1 0;0 2;3 2];
bj=[4;12;18];
maximize(nbrContraintes,operations,nbrVariables,pl,X,bj);

%exemple Cours 2
disp(" ");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp("-------------------------------------------------------- EXAMPLE COURS 2 --------------------------------------------------------");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp(" ");

nbrContraintes=4;
operations=["<=" "<=" "<=" "<="];
nbrVariables=2;
%pl=coef des variables xi
pl=[1000 1200];
X=[10 5;2 3;1 0;0 1];
bj=[200;60;34;14];
maximize(nbrContraintes,operations,nbrVariables,pl,X,bj);

%exemple Exercice
disp(" ");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp("-------------------------------------------------------- EXAMPLE EXERCICE --------------------------------------------------------");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp(" ");

nbrContraintes=4;
operations=["<=" "<=" "<=" "<="];
nbrVariables=2;
%pl=coef des variables xi
pl=[100 200];
X=[1 4;4 2;1 0;1 1];
bj=[480;440;90;150];
maximize(nbrContraintes,operations,nbrVariables,pl,X,bj);



%probleme de minimisation
%example Cours 1
disp(" ");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp("-------------------------------------------------------- EXAMPLE COURS 1 --------------------------------------------------------");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp(" ");

nbrContraintesDual=3;
operationsDual=[">=" ">=" ">="];
nbrVariablesDual=2;
plDual=[6 9];
XDual=[20 5;30 20;5 10];
bjDual=[25;60;15];
minimize(nbrContraintesDual,operationsDual,nbrVariablesDual,plDual,XDual,bjDual);

%exemple Exercice
disp(" ");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp("-------------------------------------------------------- EXAMPLE EXERCICE --------------------------------------------------------");
disp("----------------------------------------------------------------------------------------------------------------------------------");
disp(" ");

nbrContraintesDual=4;
operationsDual=[">=" ">=" ">=" ">="];
nbrVariablesDual=2;
plDual=[1 1];
XDual=[2 1;5 8;1 6];
bjDual=[12;74;24];
minimize(nbrContraintesDual,operationsDual,nbrVariablesDual,plDual,XDual,bjDual);

end

