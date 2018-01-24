function apenEEG =  apeneeg2s( dim, r, data, tau )


for ch = 1:14
    for fr = 1:59
        
        rowsel1 = 1 + 192*(fr-1);
        rowsel2 = 384+192*(fr-1);
        sd1 = std(data(rowsel1:rowsel2,ch));
        apenEEG(fr,ch) = ApEn( dim, sd1*r, data(rowsel1:rowsel2,ch),tau);
        
    end
end