function [RMSEEGBAND] = rmseeg2s(EEGBAND)

windowsec = 2;
overlap = 0.5;
Fs = 128;

for ch = 1:14
    for fr = 1:59
        rowsel1 = 1 + 192*(fr-1);
        rowsel2 = 384+192*(fr-1);
        RMSEEGBAND(fr,ch) = rms(EEGBAND(rowsel1:rowsel2,ch));
    end
end



