function [WEntropyEEG] = wentropyeeg2s(EEG)

for ch = 1:14
    for n = 1:59
    WEntropyEEG(n,ch) = wentropy(EEG(1:384,n+59*(ch-1)),'shannon');    
    end
end
