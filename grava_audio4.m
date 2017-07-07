
clc;
clear all;
close all;
t=audiodevinfo; %getting audio device status connected with the computer system
n=size(t.input,2); %getting especially the input device status
disp('Details Of Audio Recording device Connected:');

for i=0:n-1
    disp('Device Name:')  
    disp(t.input(1,i+1).Name) %display the audio input device name
    disp('Device id:')
    disp(i) %diaplay the device id
end

d=1;
%getting the device id for recording
t=2; %getting the duration of recording
b=24; %getting the bit depth of recording
disp('Recording at 48kHz Sampling frequency');
aud=audiorecorder(48000,b,2,d); 
disp('Recording....')
recordblocking(aud,t);
myRecording = getaudiodata(aud); %start audio recoding
plot(myRecording); %plot the recorded data
audiowrite('xyzd8.wav',myRecording, 48000); %write the recorded audio to a file
disp('Saving the Audio File as xyz.wav in the working directory...!');
disp('Playing....');
play(aud); %play the recorded file00);