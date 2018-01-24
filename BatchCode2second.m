clear
%---Fatigue or Not Fatigue---------------------------------------------------------
NotFatigue =  [40 39 42 26 22 38 29 23 35 38];
number = string(1:44);
Fatigue  = NotFatigue+1;
NumFatigue  = 44-NotFatigue;

%---Load Files-------------------------------------------------------------
Path = 'D:\Thesis\Data\Test EEG\';                                                            %Copy Paste Folder. Dapat may backlash sa dulo
SavePath = 'D:\Thesis\Save File\Save Image';
Files = dir(strcat(Path,'*.csv'));                                          
    
%---Batch Process-----------------------------------------------------
RowOffset = 1;
ColOffset = 0;
for numCSVfiles = 1:length(Files)
    Fullfile = strcat(Path,Files(numCSVfiles).name);
    Volunteer = erase(Files(numCSVfiles).name,".csv");
    RawEEG = csvread(Fullfile,RowOffset,ColOffset);
    eegcols = 3:16; % EEG Columns.
    EEG = RawEEG(:, eegcols);
        
    DenoisedEEG = denoise(EEG); 
    FilteredEEG = filteeg(DenoisedEEG,1,50,128);
    WindowedEEG = windoweeg2s(FilteredEEG);
    Delta = filteeg(DenoisedEEG,0.5,3,128);
    Alpha = filteeg(DenoisedEEG,3,8,128);
    Beta = filteeg(DenoisedEEG,12,38,128);
    Gamma = filteeg(DenoisedEEG,38,42,128);
    rmsDelta = normeeg(rmseeg2s(Delta));
    rmsAlpha = normeeg(rmseeg2s(Alpha));
    rmsBeta = normeeg(rmseeg2s(Beta));
    rmsGamma = normeeg(rmseeg2s(Gamma));
    WEntropyEEG = normeeg(wentropyeeg2s(WindowedEEG));
    apenEEG = normeeg(apeneeg2s(2,0.02,DenoisedEEG,1));
    windowed(:,1+59*(numCSVfiles-1):59*numCSVfiles) = windowfeats2s(rmsDelta,rmsAlpha,rmsBeta,rmsGamma,WEntropyEEG,apenEEG);
%     [CD3, CD4, CD5, A5] = dwteeg(WindowedEEG);
%     windowed(1+164*(numCSVfiles-1):164*numCSVfiles) = windowdwt(CD3,CD4,CD5,A5,rmsDelta,rmsAlpha,rmsBeta,rmsGamma,WEntropyEEG);

%     for n = 1:NotFatigue(numCSVfiles)
% %       savenofatigue = input(:,n);
% %       save(['D:\Thesis\Save File\Save Image\No Fatigue\' Volunteer 'NoFatigue' number{n} '.mat'],'savenofatigue')
%         savenofatigue = windowed(:,1+14*(n-1):14*n);
%         imwrite(savenofatigue,['D:\Thesis\Save File\Save Image 2\No Fatigue\' Volunteer 'NoFatigue' number{n} '.png'])
%     end
%     for f = 1+NotFatigue(numCSVfiles):44
% %       savefatigue = input(:,f+NotFatigue(numCSVfiles));
% %       save(['D:\Thesis\Save File\Save Image\Fatigue\' Volunteer 'Fatigue' number{f} '.mat'],'savefatigue')
%         savefatigue = windowed(:,1+14*(f-1):14*f);
%         imwrite(savefatigue,['D:\Thesis\Save File\Save Image 2\Fatigue\' Volunteer 'Fatigue' number{f} '.png'])
%     end
end
csvwrite('D:\Thesis\Data\ANN Inputs\InputEEGFeat5.csv',windowed)
