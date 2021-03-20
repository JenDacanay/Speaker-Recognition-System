% Speaker Recognition System
% EEC 201 Final Project
% Team AudioVision: Maeia Reagle, Jennifer Dacanay
clc; clear; close all;

%% Read in raw signal data
[s1,Fs] = audioread('./Data/Training_Data/s1.wav');
[s2,Fs] = audioread('./Data/Training_Data/s2.wav');
[s3,Fs] = audioread('./Data/Training_Data/s3.wav'); 
[s4,Fs] = audioread('./Data/Training_Data/s4.wav'); 
[s5,Fs] = audioread('./Data/Training_Data/s5.wav'); 
[s6,Fs] = audioread('./Data/Training_Data/s6.wav');
[s7,Fs] = audioread('./Data/Training_Data/s7.wav');
[s8,Fs] = audioread('./Data/Training_Data/s8.wav');
[s9,Fs] = audioread('./Data/Training_Data/s9.wav'); 
[s10,Fs] = audioread('./Data/Training_Data/s10.wav');
[s11,Fs] = audioread('./Data/Training_Data/s11.wav');
[s12,Fs] = audioread('./Data/Training_Data/s12.wav'); 
[s13,Fs] = audioread('./Data/Training_Data/s13.wav');
[s14,Fs] = audioread('./Data/Training_Data/s14.wav'); 

%% Filter signals: remove data with magnitudes less than specified db
dB = -30; 
s1_fil = preprocess(s1, dB, 1);
s2_fil = preprocess(s2, dB, 2);
s3_fil = preprocess(s3, dB, 3); 
s4_fil = preprocess(s4, dB, 4); 
s5_fil = preprocess(s5, dB, 5); 
s6_fil = preprocess(s6, dB, 6); 
s7_fil = preprocess(s7, dB, 7); 
s8_fil = preprocess(s8, dB, 8); 
s9_fil = preprocess(s9, dB, 9); 
s10_fil = preprocess(s10, dB, 10);
s11_fil = preprocess(s11, dB, 11); 
s12_fil = preprocess(s12, dB, 12); 
s13_fil = preprocess(s13, dB, 13);
s14_fil = preprocess(s14, dB, 13);

%% Plot spectrum for Speaker 5 before and after applying melbanks
% Uncomment lines in mfcc function
nwin = 256;
nmfcc = 20;
ov = 100;
[cs5,yt5] = mfcc(s5_fil, Fs,nwin,nmfcc,ov)

%% Apply MFC to filtered speech files
nwin = 256;
nmfcc = 20;
ov = 100;
[cs1,yt1] = mfcc(s1_fil, Fs,nwin,nmfcc,ov)
[cs2,yt2] = mfcc(s2_fil, Fs,nwin,nmfcc,ov)
[cs3,yt3] = mfcc(s3_fil, Fs,nwin,nmfcc,ov)
[cs4,yt4] = mfcc(s4_fil, Fs,nwin,nmfcc,ov)
[cs5,yt5] = mfcc(s5_fil, Fs,nwin,nmfcc,ov)
[cs6,yt6] = mfcc(s6_fil, Fs,nwin,nmfcc,ov)
[cs7,yt7] = mfcc(s7_fil, Fs,nwin,nmfcc,ov)
[cs8,yt8] = mfcc(s8_fil, Fs,nwin,nmfcc,ov)
[cs9,yt9] = mfcc(s9_fil, Fs,nwin,nmfcc,ov)
[cs10,yt10] = mfcc(s10_fil, Fs,nwin,nmfcc,ov)
[cs11,yt11] = mfcc(s11_fil, Fs,nwin,nmfcc,ov)
[cs12,yt12] = mfcc(s12_fil, Fs,nwin,nmfcc,ov)
[cs13,yt13] = mfcc(s13_fil, Fs,nwin,nmfcc,ov)
[cs14,yt14] = mfcc(s14_fil, Fs,nwin,nmfcc,ov)

%% take initial random points for initial codebook vectors number k
k=5
place=randperm(size(cs, 1))
startcode = cs(place(1:k), :);

%%
words = closword(cs, startcode)

%%
place=randperm(size(cs, 1))
startcode = cs(place(1:k), :);
res=.05
prevcode=startcode
initres=0

cb = closword(cs, startcode)
 centroids = zeros(k, size(cs, 2));
 for speaker1 = 1:k
        num = find(cb == speaker1); 
        centroids(speaker1,:) = mean(cs(num,:));
    end
%%
[newcode,cb,resval] = Dothelifting(cs, 6)

%%
test('C:\Users\Maeia\Documents\MATLAB\Test_Data2\', 5, code,cb,256,30,100,6)
%% good
[code,cb,resval] = train('.\Data\Training_Data\', 9,256,15,100,6);
test('.\Data\Test_Data\', 13, code,cb,256,15,100,6)
%% Perfect every time use this one 
[code,cb,resval] = train('.\Data\Training_Data\', 11,256,20,100,7);
test('.\Data\Test_Data\', 11, code,cb,256,20,100,7)
%%
test2('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 13, code,cb,256,20,100,7)
%%
[code,cb,resval] = train2('C:\Users\Maeia\Downloads\archive\16000_pcm_speeches\Training\', 5,256,20,100,7);
%%
n=test3('.Data\Users\Maeia\Downloads\archive\16000_pcm_speeches\Benjamin_Netanyau1\', 500, code,cb,256,20,100,7)
n=test3('.Data\Users\Maeia\Downloads\archive\16000_pcm_speeches\Jens_Stoltenberg2\', 500, code,cb,256,20,100,7)
n=test3('.Data\Users\Maeia\Downloads\archive\16000_pcm_speeches\Julia_Gillard3\', 500, code,cb,256,20,100,7)
n=test3('.Data\16000_pcm_speeches\Magaret_Tarcher4\', 500, code,cb,256,20,100,7)
n=test3('.Data\16000_pcm_speeches\Nelson_Mandela5\', 500, code,cb,256,20,100,7)

%%
c=0
for speaker1=1:500
    if n(speaker1,1) == 5
        c=c+1
    end
end

%%
 v = mfcc(t2, Fs,256,20,100); 
 %%
  d = dista(v, code{2});
  dist = sum(min(d,[],2)) / size(d,1)
%%
cb = closword(v, code{1})

%% Plots for Tests
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%                                 Plots                                  %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Test 2a: Plot raw and filtered signals in time domain
first_signal = 8;
last_signal = 14;
n = 10; % indicate signal number to plot
for speaker1=first_signal:last_signal % Plot 
    figure()
    subplot(2,1,1)
    sgtitle(['Signal in Time Domain for Speaker ', num2str(speaker1)])
    s = sprintf('s%d',speaker1);
    sr = eval(s);
    plot((1:length(sr)),sr)
    title(['Raw Signal of s', num2str(speaker1), '.wav'])
    xlabel('Time (s)')
    ylabel('Amplitude')
    subplot(2,1,2)
    s_fil = sprintf('s%d_fil',speaker1);
    filtered_signal = eval(s_fil);
    plot((1:length(filtered_signal)),filtered_signal)
    plot(filtered_signal)
    title(['Filtered Signal of s', num2str(speaker1), '.wav'])
    xlabel('Time (s)')
    ylabel('Amplitude')
end

%% Test 2b: Plot periodograms of STFT with N = 128, 256, 512 frame sizes
s = s5_fil % Change speaker file
close all;
num_mfcc = 20;
plot_periodogram_stft(s, Fs)

%% Test 3: Plot mel-spaced filterbank responses
figure()
plot(linspace(0, (48000/2),150), melbanks(20, 48000,300)')
title('Mel-spaced Filter Bank'), xlabel('Frequency (Hz)');

%% Test 5: Show Clusters
close all; figure()
plot(cs7(:,6)', cs7(:,9)', 'x')
hold on
plot(cs11(:,6)', cs11(:,9)', 'or')
xlabel('mfcc-6'); ylabel('mfcc-9')
legend("Speaker 7", "Speaker 11")
grid on
title("MFCC Space")

%% show clusters
figure()
plot(cs8(:,9)', cs8(:,18)', 'xb')
hold on
plot(cs4(:,9)', cs4(:,18)', 'or')
xlabel('mfcc-9'); ylabel('mfcc-18')

grid on
title("mfcc space")
%plot(code{8}(:,9),code{8}(:,18),'s')
%plot(code{4}(:,9),code{4}(:,18),'d')
legend("Speaker 8", "Speaker 4","S8 Cent","S4 Cent")


%% show clusters
close all;
figure()
% Speakers to compare
speaker1 = 1;   
speaker2 = 6;
speaker3 = 9;

% MFCCs to compare
mfcc1 = 5;      mfcc2 = 12;
spkr1 = sprintf('cs%d',speaker1); spkr1 = eval(spkr1);
spkr2 = sprintf('cs%d',speaker2); spkr2 = eval(spkr2);
spkr3 = sprintf('cs%d',speaker3); spkr3 = eval(spkr3);

a = plot(spkr1(:,mfcc1)', spkr1(:,mfcc2)', 'o')
set(a, 'MarkerFaceColor', get(a,'Color'));
hold all
b = plot(spkr2(:,mfcc1)', spkr2(:,mfcc2)', 'o')
set(b, 'MarkerFaceColor', get(b,'Color'));
legend("Speaker 3", "Speaker 7")
c = plot(spkr3(:,mfcc1)', spkr3(:,mfcc2)', 'o')
set(c, 'MarkerFaceColor', get(c,'Color'));
legend("Speaker 1", "Speaker 6", "Speaker 9")
xlabel('MFCC-',num2str(mfcc1)); ylabel('MFCC-',num2str(mfcc2))

grid on
title("MFCC Space")
hold off