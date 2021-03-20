% Speaker Recognition System
% EEC 201 Final Project
% Team AudioVision: Maeia Reagle, Jennifer Dacanay
clc; clear; close all;

%% Read in raw signal data
[s1,Fs] = audioread('./Data/Training_Data/s1.wav');
s1=s1(:,1); % Removes stereo noises
[s2,Fs] = audioread('./Data/Training_Data/s2.wav');
s2=s2(:,1); % Removes stereo noises
[s3,Fs] = audioread('./Data/Training_Data/s3.wav');
s3=s3(:,1); % Removes stereo noises
[s4,Fs] = audioread('./Data/Training_Data/s4.wav');
s4=s4(:,1); % Removes stereo noises
[s5,Fs] = audioread('./Data/Training_Data/s5.wav');
% s5=s5(:,1); % Removes stereo noises
[s6,Fs] = audioread('./Data/Training_Data/s6.wav');
s6=s6(:,1); % Removes stereo noises
[s7,Fs] = audioread('./Data/Training_Data/s7.wav');
s7=s7(:,1); % Removes stereo noises
[s8,Fs] = audioread('./Data/Training_Data/s8.wav');
s8=s8(:,1); % Removes stereo noises
[s9,Fs] = audioread('./Data/Training_Data/s9.wav');
s9=s9(:,1); % Removes stereo noises
[s10,Fs] = audioread('./Data/Training_Data/s10.wav');
s10=s10(:,1); % Removes stereo noises
[s11,Fs] = audioread('./Data/Training_Data/s11.wav');
s11=s11(:,1); % Removes stereo noises
[s12,Fs] = audioread('./Data/Training_Data/s12.wav');
s12=s12(:,1); % Removes stereo noises
[s13,Fs] = audioread('./Data/Training_Data/s13.wav');
s13=s13(:,1); % Removes stereo noises

%% Plot raw signals
figure()
n = 13
for i=1:n
    subplot(n,1,i);
    sgtitle('Raw Signals')
    sn = sprintf('s%d',i);
    y=eval(sn);
    plot((1:length(y)),y)
    title(['s', num2str(i),'.wav'])
    xlabel('Time (s)'); ylabel('Amplitude')
end

%% Filter signals: remove data less than specified db
dB = -30; 
s1_fil = keepsound(s1, dB, 1);
s2_fil = keepsound(s2, dB, 2);
s3_fil = keepsound(s3, dB, 3); 
s4_fil = keepsound(s4, dB, 4); 
s5_fil = keepsound(s5, dB, 5); 
s6_fil = keepsound(s6, dB, 6); 
s7_fil = keepsound(s7, dB, 7); 
s8_fil = keepsound(s8, dB, 8); 
s9_fil = keepsound(s9, dB, 9); 
s10_fil = keepsound(s10, dB, 10); 
s11_fil = keepsound(s11, dB, 11); 
s12_fil = keepsound(s12, dB, 12); 
s13_fil = keepsound(s13, dB, 13);

%% Plot all filtered signals
figure()
n = 13;
for i=1:n
    subplot(n,1,i);
    sgtitle('Filtered Signals')
    s_fil = sprintf('s%d_fil',i);
    sfn = eval(s_fil);
    plot((1:length(sfn)),sfn)
    title(['s', num2str(i), '.wav'])
    xlabel('Time (s)')
    ylabel('Amplitude')
end

%% Plot raw and filtered signals in time domain
n = 13;     % number of signals to plot
for i=1:n % Plot
    figure()
    % Test 2 - Plot raw voice signals in time domain
    subplot(2,1,1)
    sgtitle(['Signal in Time Domain for Speaker ', num2str(i)])
    s = sprintf('s%d',i);
    sr = eval(s);
    plot((1:length(sr)),sr)
    title(['Raw Signal of s', num2str(i), '.wav'])
    xlabel('Time (s)')
    ylabel('Amplitude')
    subplot(2,1,2)
    s_fil = sprintf('s%d_fil',i);
    filtered_signal = eval(s_fil);
    plot((1:length(filtered_signal)),filtered_signal)
    plot(filtered_signal)
    title(['Filtered Signal of s', num2str(i), '.wav'])
    xlabel('Time (s)')
    ylabel('Amplitude')
end

%% Test 2: Plot periodograms with N = 128, 256, 512 frame sizes
s = s5 % Change speaker file
num_mfcc = 20;
[y, f, t] = stft(s, Fs, 'Window', hamming(128), 'OverlapLength', 30);%stft
sgtitle('STFT Periodograms for Speaker 5')
set(sgtitle,'Color','b')
subplot(1,3,1);
waterfall(f,t,abs(y(:,:,1))')
subtitle('N = 128')
xlabel('Frequency(Hz)')
ylabel('Time (s)')
subplot(1,3,2);
[y, f, t] = stft(s, Fs, 'Window', hamming(256), 'OverlapLength', 100);%stft
waterfall(f,t,abs(y(:,:,1))')
subtitle('N = 256')
xlabel('Frequency(Hz)')
ylabel('Time (s)')
subplot(1,3,3);
[y, f, t] = stft(s, Fs, 'Window', hamming(512), 'OverlapLength', 170);%stft
waterfall(f,t,abs(y(:,:,1))')
subtitle('N = 512')
xlabel('Frequency(Hz)')
ylabel('Time (s)')

%% Test 3: Plot mel-spaced filterbank responses
figure()
plot(linspace(0, (12500/2), 129), melfb_own(20, 256, 12500)'),
title('Mel-spaced filterbank'), xlabel('Frequency (Hz)');

%% Plot spectrum for Speaker 5 before and after applying melbanks
% Uncomment lines in mfcc function
nwin = 256;
nmfcc = 20;
ov = 100;
[cs5,yt5] = mfcc(s5_fil, Fs,nwin,nmfcc,ov)

%% Apply mfcc to filtered speech files
% nwin = 256;
% nmfcc = 20;
% ov = 100;
% [cs1,yt1] = mfcc(s1_fil, Fs,nwin,nmfcc,ov)
% [cs2,yt2] = mfcc(s2_fil, Fs,nwin,nmfcc,ov)
% [cs3,yt3] = mfcc(s3_fil, Fs,nwin,nmfcc,ov)
% [cs4,yt4] = mfcc(s4_fil, Fs,nwin,nmfcc,ov)
% [cs5,yt5] = mfcc(s5_fil, Fs,nwin,nmfcc,ov)
% [cs6,yt6] = mfcc(s6_fil, Fs,nwin,nmfcc,ov)
% [cs7,yt7] = mfcc(s7_fil, Fs,nwin,nmfcc,ov)
% [cs8,yt8] = mfcc(s8_fil, Fs,nwin,nmfcc,ov)
% [cs9,yt9] = mfcc(s9_fil, Fs,nwin,nmfcc,ov)
% [cs10,yt10] = mfcc(s10_fil, Fs,nwin,nmfcc,ov)
% [cs11,yt11] = mfcc(s11_fil, Fs,nwin,nmfcc,ov)
% [cs12,yt12] = mfcc(s12_fil, Fs,nwin,nmfcc,ov)
% [cs13,yt13] = mfcc(s12_fil, Fs,nwin,nmfcc,ov)

%%
figure
plot(cs11(:,9)', cs11(:,6)', 'x')
hold on
plot(cs7(:,9)', cs7(:,6)', 'o')
xlabel('mfcc-9'); ylabel('mfcc-18')
legend("Speaker 9", "Speaker 7")
grid on
title("mfcc space")

%% show clusters
figure
plot(cs5(3,:)', cs5(5,:)', 'x')
hold on
plot(cs10(3,:)', cs10(5,:)', 'o')
xlabel('mfcc-3'); ylabel('mfcc-5')
legend("Speaker 5", "Speaker 10")
grid on
title("mfcc space")
%% take initial random points for initial codebook vectors number k
k=5
cs = cs5;
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
 for i = 1:k
        num = find(cb == i); 
        centroids(i,:) = mean(cs(num,:));
    end
%%
[newcode,cb,resval] = Dothelifting(cs, 6)

%%
[code,cb,resval] = train('C:\Users\Maeia\Documents\MATLAB\Training_Data3\', 8,256,30,100,6);

%%
test('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 5, code,cb,256,30,100,6)
%%
test('C:\Users\Maeia\Documents\MATLAB\Test_Data2\', 5, code,cb,256,30,100,6)
%% good
[code,cb,resval] = train('C:\Users\Maeia\Documents\MATLAB\Training_Data3\', 9,256,15,100,6);
test('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 13, code,cb,256,15,100,6)
%% Perfect every time use this one 
% [code,cb,resval] = train('C:\Users\Maeia\Documents\MATLAB\Training_Data3\', 9,256,20,100,7);
[code,cb,resval] = train('.\Data\Training_Data\', 9,256,20,100,7);
test('.\Data\\Test_Data\', 13, code,cb,256,20,100,7)
%%

test2('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 13, code,cb,256,20,100,7)
%%
[code,cb,resval] = train2('C:\Users\Maeia\Downloads\archive\16000_pcm_speeches\Training\', 5,256,20,100,7);
%%
n=test3('C:\Users\Maeia\Downloads\archive\16000_pcm_speeches\Benjamin_Netanyau1\', 500, code,cb,256,20,100,7)
n=test3('C:\Users\Maeia\Downloads\archive\16000_pcm_speeches\Jens_Stoltenberg2\', 500, code,cb,256,20,100,7)
n=test3('C:\Users\Maeia\Downloads\archive\16000_pcm_speeches\Julia_Gillard3\', 500, code,cb,256,20,100,7)
n=test3('C:\Users\Maeia\Downloads\archive\16000_pcm_speeches\Magaret_Tarcher4\', 500, code,cb,256,20,100,7)

n=test3('C:\Users\Maeia\Downloads\archive\16000_pcm_speeches\Nelson_Mandela5\', 500, code,cb,256,20,100,7)

%%
c=0
for i=1:500
    if n(i,1) == 5
        c=c+1
    end
end

%%
[code,cb,resval] = train('C:\Users\Maeia\Documents\MATLAB\Training_Data3\', 9,25,45,30,15);
test('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 12, code,cb,200,45,30,15)

%%
% test('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 11, code,cb,400,20,100,8)

%%
% [code,cb,resval] = train('C:\Users\Maeia\Documents.\Data\Training_Data3\', 8,256,20,100,6);

%%
[s,Fs] = audioread('C:\Users\Maeia\Documents\MATLAB\Test_Data\s2.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-30);
t2 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 


%%
 v = mfcc(t2, Fs,256,20,100); 
 %%
  d = dista(v, code{2});
  dist = sum(min(d,[],2)) / size(d,1)
%%
cb = closword(v, code{1})
%%


%% show clusters  %% update from here
figure
plot(cs8(:,9)', cs8(:,18)', 'x')
hold on
plot(cs4(:,9)', cs4(:,18)', 'o')
xlabel('mfcc-9'); ylabel('mfcc-18')
grid on
title("mfcc space")
c1=plot(code{8}(:,9),code{8}(:,18),'s')
set(c1, {'MarkerFaceColor'}, get(c1,'Color')); 
plot(code{4}(:,9),code{4}(:,18),'d')
legend("Speaker 8", "Speaker 4","S8 Cent","S4 Cent")
