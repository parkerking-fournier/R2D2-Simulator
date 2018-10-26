% Read in text files
A = dlmread('amp.txt');
F = dlmread('frequency.txt');

% Set the sample rate for the final playing
% N represents 1/100th of a second in terms of Fs
% This is used because the max patch outputs a number
% for frequency and amplitude every 100th second
Fs1 = 44100;
N = floor(Fs1/100);

% Repeat each element from the text file N times so it
% occupies 1/100th of a second
envelope = A(ceil((1:N*numel(A))/N));
envelope = envelope./max(envelope);
frequencies = F(ceil((1:N*numel(F))/N));

% Find the best fit for the frequency and amplitude
freq = bestfit(frequencies);
env = bestfit(envelope);
env = env./max(env);
env = env';

% Scale the frequencies to the R2-D2 range
for i=1:length(freq)
    if freq(i) ~= 0
        freq(i) = freq(i)+400;
    end
end

% This will be the final audio file
final = zeros(1,length(freq));

% This loop generates random pitch shifted R2-D2 sounds
index = 1;
while index < length(freq)
    % Dont do anything if the frequency is below 400 hz
   if freq(index) < 400
       index = index + 1;
   % Calculate the target frequency for pitch shifting
   % Copy the R2-D2 sound into the correct part of the
   % vector 'final', accounting for different Fs
   else
       target = floor(freq(index));
       [y,Fs] = randomSound;
       y = pitchshift(y, target, Fs);
       rate = Fs1/Fs;
       for n=0:length(y)-1
           for m=0:rate-1
               if (n+m+index) <= length(final) 
                    final(index+n+m) = y(n+1);
               end
           end
       end
       
       %Increment the index
       increment = index + length(y);
       
       if index + length(y) > length(final)
            increment = length(final) - index;
       end
       index = index + increment;
   end
end

%Apply envelope and sound the sound
final = final(1:length(env));
final = final.*env;
soundsc(final,Fs1);

%plot the sound so it can be visualized
plot(final);