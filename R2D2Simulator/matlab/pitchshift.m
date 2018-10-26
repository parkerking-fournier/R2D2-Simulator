function f = pitchshift(y, t, Fs)
    frequency = HPS(y,Fs);
    target = t;
    x = target/frequency;
    e = pvoc(y, x); 
    f = resample(e,frequency,target); 
end