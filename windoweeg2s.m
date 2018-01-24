function [WindowedEEG] = windoweeg2s(EEG)

for ch = 1:14
    for fr = 1:59

        
        rowsel1 = 1 + 192*(fr-1);
        rowsel2 = 384+192*(fr-1);
        frsel = fr+(ch-1)*59;
        WindowedEEG(1:384,frsel) = EEG(rowsel1:rowsel2,ch);
    end
end