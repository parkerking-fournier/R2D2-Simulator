function [y,Fs] = randomSound
    % Choose a random number to choose a random R2D2 sound
    r = randi(10);

    if r == 1
        [y,Fs] = audioread('wow.wav');
    end

    if r == 2
        [y,Fs] = audioread('shortgrowl.wav');
    end

    if r == 3
        [y,Fs] = audioread('beepybeep.wav');
    end

    if r == 4
        [y,Fs] = audioread('berp.wav');
    end

    if r == 5
        [y,Fs] = audioread('boop.wav');
    end

    if r == 6
        [y,Fs] = audioread('bweep.wav');
    end

    if r == 7
        [y,Fs] = audioread('cleanwhistle.wav');
    end

    if r == 8
        [y,Fs] = audioread('dwaep.wav');
    end

    if r == 9
        [y,Fs] = audioread('dwip.wav');
    end

    if r == 10
        [y,Fs] = audioread('dwoop.wav');
    end
end
