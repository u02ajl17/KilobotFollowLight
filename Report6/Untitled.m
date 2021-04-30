Fs = 44100 ; 
nBits = 16 ; 
nChannels = 2 ; 
ID = -1; % default audio input device 
recObj = audiorecorder(Fs,nBits,nChannels,ID);
disp('Start speaking.')
recordblocking(recObj,5);
sig = getaudiodata(recObj);
name = 'test2.wav';
audiowrite(name, sig, Fs);