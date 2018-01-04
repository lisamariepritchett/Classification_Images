% figure2b.m  Generate panels of Figure 2b in Pritchett and Murray (2015)%             i.e., experiment 2, proxy decision space and GDD function fitclear; clc; clf;% add tool folder to pathaddpath(fullfile(pwd,'tools'));% choose subject (subject = 1 to 9)subject = 3;fname = sprintf('data/experiment2_subject%d.txt',subject);fprintf('processing %s\n',fname);% load data and select columnstrials = load(fname,'-ascii');signal = 2-trials(:,5);         % signal position:  1 = left, 2 = rightsigcst = trials(:,4);           % signal contrast incrementrngseeds = trials(:,[ 6 7 ]);   % random number generator seedsresponse = 2-trials(:,9);       % observer response:  1 = judged increment on left, 2 = judged increment on right% calculate a radially pooled, unit-energy classification imagefprintf('  calculating classification image ...\n');cimage = calcclass_experiment2( signal, response, rngseeds );% calculate proxy decision variablesfprintf('  calculating proxy decision variables ...\n');[ dvar1, dvar2 ] = calcdvar_experiment2( signal, sigcst, rngseeds, cimage );% calculate proxy decision spacefprintf('  calculating proxy decision space ...\n');dspace = calcdspace( dvar1, dvar2, response );% fit GDD function to proxy decision spacefprintf('  fitting GDD function to proxy decision space ...\n');param = fitgddloop( dspace, 'gdd' );% show proxy decision space and fitted GDD functionplotdspace( dspace, param );