N = 40000;
Perfect = complex(zeros(N,72,14));
NoisyH22 = complex(zeros(N,72,14));
for x = 1:10000 
    Txwaveform1 = complex(zeros(72,14));
    for i = 1:14
        a = 1+16+(i-1)*(16+72);
        b = a +71;
        Txwaveform1(:,i) = (Txwaveform(a:b).');

    end

    chcfg.Seed = x;

    Rxwaveform =  lteFadingChannel(chcfg,Txwaveform);

    %PerfectH = lteDLPerfectChannelEstimate(enb,chcfg);
    NoisyH20 = awgn(Rxwaveform,20,'measured');
    Rxwaveform1 = complex(zeros(72,14));
    Rxwaveform2 = complex(zeros(72,14));
    
    for i = 1:14
        a = 16+(i-1)*(16+72);
        b = a +71;
        Rxwaveform1(:,i) = (Rxwaveform( a:b).');
        Rxwaveform2(:,i) = (NoisyH20( a:b).');

    end
    close all
    Perfect(x,:,:) =(fft(Rxwaveform1)/72./ifft(Txwaveform1));
    NoisyH22(x,:,:) = (fft(Rxwaveform2)/72./ifft(Txwaveform1));
end
12
