function MWS = setup_Noz(MWS)
%		T-MATS -- setup_LPC.m
% *************************************************************************
% written by Jeffryes Chapman  based on work by Dean K. Frederick, J. Hillmon, and Ryan May
% NASA Glenn Research Center, Cleveland, OH
% Dec 18th, 2012
%
% This function creates the properties of the Nozzle Module
% *************************************************************************

MWS.Noz.ATh = 110.7;   % nozzle throat area (in^2)

MWS.Noz.LossPerc = 0.00;  %percent flow loss through the nozzle

%---- gas constant & gamma vs FAR ------
temp = [
    0       0.0685604   1.39978
    0.005   0.0685715   1.38404
    0.01    0.0685825   1.33886
    0.015   0.0685934   1.30043
    0.02    0.0686042   1.25592
    0.025   0.0686149   1.15704
    0.03    0.0686254   0.998183
    0.10    0.0686254   0.998183
    ];

MWS.Noz.FARVec =  temp(:,1);
MWS.Noz.RArray = temp(:,2);
MWS.Noz.gamtVec = temp(:,3);


MWS.Noz.TtVec = [300,500:100:2000 4000];

B1 = [...
    1.40054                   1.39887                   1.39722
    1.40085                   1.39862                   1.39643
    1.39963                   1.39697                   1.39438
    1.39666                    1.3937                    1.3908
    1.39235                   1.38915                   1.38604
    1.38707                   1.38371                   1.38045
    1.38116                   1.37769                   1.37433
    1.37491                   1.37138                   1.36796
    1.36856                   1.36499                   1.36152
    1.36229                   1.35868                    1.3552
    1.35624                   1.35265                   1.34915
    1.35052                   1.34689                   1.34339
    1.34519                   1.34155                   1.33803
    1.34028                   1.33664                   1.33311
    1.33581                   1.33215                   1.32861
    1.33187                   1.32819                   1.32463
    1.32818                   1.32448                   1.32091
    1.32818                   1.32448                   1.32091];

B2 = [...
    1.39561                   1.39402                   1.39247
    1.39429                    1.3922                   1.39015
    1.39186                   1.38939                   1.38697
    1.38798                   1.38522                   1.38253
    1.383                   1.38004                   1.37716
    1.37727                   1.37417                   1.37116
    1.37106                   1.36787                   1.36478
    1.36462                   1.36138                   1.35823
    1.35816                   1.35489                   1.35171
    1.35182                   1.34854                   1.34534
    1.34575                   1.34244                   1.33924
    1.33998                   1.33668                   1.33348
    1.33462                   1.33132                    1.3281
    1.32968                   1.32637                   1.32315
    1.32518                   1.32185                   1.31862
    1.32118                   1.31784                    1.3146
    1.31746                   1.31411                   1.31087
    1.31746                   1.31411                   1.31087];

B3 = [...
    1.39094
    1.38814
    1.38461
    1.37991
    1.37435
    1.36822
    1.36176
    1.35516
    1.34862
    1.34224
    1.33613
    1.33036
    1.32498
    1.32002
    1.31549
    1.31146
    1.30772
    1.30772];
B4 = [...
    1.39094
    1.38814
    1.38461
    1.37991
    1.37435
    1.36822
    1.36176
    1.35516
    1.34862
    1.34224
    1.33613
    1.33036
    1.32498
    1.32002
    1.31549
    1.31146
    1.30772
    1.30772];

MWS.Noz.GArray = [B1 B2 B3 B4];

%   X PEQPa...TABLE OF PRIMARY STREAM NOZZLE EXHAUST EXPANSION RATIOS.
MWS.Noz.PeQPaVec = [0 10000];

%   Z Cd....TABLE OF PRIMARY STREAM DISCHARGE COEFFICIENTS.
MWS.Noz.CdThArray = [1 1];

%   Z CV....TABLE OF PRIMARY STREAM Velocity COEFFICIENTS.
MWS.Noz.CvArray= [0.990 0.990];

%   Z TG....TABLE OF PRIMARY STREAM Thermal Growth COEFFICIENTS.
MWS.Noz.TGArray = ones(length(MWS.Noz.TtVec),1);
