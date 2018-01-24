function [windowed] = windowfeats2s(rmsDelta,rmsAlpha,rmsBeta,rmsGamma,WEntropyEEG,apenEEG)
    
% for k = 1:44
% %   1+window_per_dwt*(ch-1):window_per_dwt,1+14*(ch-1):14*ch
%     windowed(1:71,1+14*(k-1):14*k) = CD3(1+71*(k-1):71*k,1:14);
%     windowed(72:111,1+14*(k-1):14*k) = CD4(1+40*(k-1):40*k,1:14);
%     windowed(112:135,1+14*(k-1):14*k) = CD5(1+24*(k-1):24*k,1:14);
%     windowed(136:159,1+14*(k-1):14*k) = A5(1+24*(k-1):24*k,1:14);
%     
%     windowed(160,1+14*(k-1):14*k) = rmsDelta(1+1*(k-1):1*k,1:14);
%     windowed(161,1+14*(k-1):14*k) = rmsAlpha(1+1*(k-1):1*k,1:14);
%     windowed(162,1+14*(k-1):14*k) = rmsBeta(1+1*(k-1):1*k,1:14);
%     windowed(163,1+14*(k-1):14*k) = rmsGamma(1+1*(k-1):1*k,1:14);
%     windowed(164,1+14*(k-1):14*k) = WEntropyEEG(1+1*(k-1):1*k,1:14);
% end

for k = 1:59
    for ch = 1:14
%   1+window_per_dwt*(ch-1):window_per_dwt,1+14*(ch-1):14*ch
    
    windowed(ch,k) = rmsDelta(k,ch);
    windowed(14+ch,k) = rmsAlpha(k,ch);
    windowed(28+ch,k) = rmsBeta(k,ch);
    windowed(42+ch,k) = rmsGamma(k,ch);
    windowed(56+ch,k) = WEntropyEEG(k,ch);
    windowed(70+ch,k) = apenEEG(k,ch);
    end
end