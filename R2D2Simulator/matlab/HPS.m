% A Simple Harmonic Product Spectrum Algorithm

function fundamental = HPS(y,Fs)

    t = length(y) / Fs;
    l = length(y);

    % Multiply the signal by a hanning window
    % This window is the size of the whole signal for now
    windowed = y .* hann(l);

    % Take an FFT of this
    y = fft(windowed);
    y = y(1:floor(length(y)/2));
    y = abs(y);

    % Downsample this a couple times
    hps1 = downsample(y,1);
    hps2 = downsample(y,2);
    hps3 = downsample(y,3);
    hps4 = downsample(y,4);
    hps5 = downsample(y,5);

    % Create empty vector to hold the resulting multiplications
    w = (1:length(hps5));

    % Take product of downsampled fft's
    for i=1:length(hps5)
    
      Product =   hps1(i)  * hps2(i) * hps3(i) * hps4(i) * hps5(i);
      w(i) = Product;
    end

    % Find the maximum value, which should correspond to the fundamental
    [m,n]=findpeaks(w, 'SORTSTR', 'descend');

     % Return the fundamental
    fundamental = floor(n(1)* Fs / l);
end