[s,Fs] = audioread('s1.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s1 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 

%%
[s1,Fs] = audioread('s1.wav');

[s2,Fs] = audioread('s2.wav');

[s3,Fs] = audioread('s3.wav');

[s4,Fs] = audioread('s4.wav');

[s5,Fs] = audioread('s5.wav');

[s6,Fs] = audioread('s6.wav');

[s7,Fs] = audioread('s7.wav');

[s8,Fs] = audioread('s8.wav');

[s9,Fs] = audioread('s9.wav');

[s10,Fs] = audioread('s10.wav');

[s11,Fs] = audioread('s11.wav');

%%
[cs1,yt1] = mfcc(s5, Fs,128,20,30);
[cs1,yt1] = mfcc(s5, Fs,256,20,100);
[cs1,yt1] = mfcc(s5, Fs,512,20,170);

%%
[cs1,yt1] = mfcc(s5, Fs,256,20,100);

%%
 plot(linspace(0, (12500/2), 129), melfb_own(20, 256, 12500)'),
 title('Mel-spaced filterbank'), xlabel('Frequency (Hz)');
%%
[s,Fs] = audioread('s1.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s1 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s2.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s2 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s3.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s3 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s4.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s4 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s5.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s5 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s6.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s6 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s7.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s7 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s8.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s8 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s9.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
%%
s9 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s10.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s10 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 
[s,Fs] = audioread('s11.wav');
stemp = round(s, 3);  
crit = abs(stemp) > db2mag(-40);
s11 = s(find(crit, 1, 'first'):find(crit, 1, 'last')); 

%%
plot(1:13056,nol)
%% Plot all the signals
subplot(11,1,1);
plot((1:length(s1)),s1)
subplot(11,1,2);
plot((1:length(s2)),s2)
subplot(11,1,3);
plot((1:length(s3)),s3)
subplot(11,1,4);
plot((1:length(s4)),s4)
subplot(11,1,5);
plot((1:length(s5)),s5)
subplot(11,1,6);
plot((1:length(s6)),s6)
subplot(11,1,7);
plot((1:length(s7)),s7)
subplot(11,1,8);
plot((1:length(s8)),s8)
subplot(11,1,9);
plot((1:length(s9)),s9)
subplot(11,1,10);
plot((1:length(s10)),s10)
subplot(11,1,11);
plot((1:length(s11)),s11)

%% apply mfcc to speech files
[cs1,yt1] = mfcc(s1, Fs,256,20,100);
[cs2,yt2] = mfcc(s2, Fs,256,20,100);
[cs3,yt3] = mfcc(s3, Fs,256,20,100);
[cs4,yt4] = mfcc(s4, Fs,256,20,100);
[cs5,yt5] = mfcc(s5, Fs,256,20,100);
[cs6,yt6] = mfcc(s6, Fs,256,20,100);
[cs7,yt7] = mfcc(s7, Fs,256,20,100);
[cs8,yt8] = mfcc(s8, Fs,256,20,100);
[cs9,yt9] = mfcc(s9, Fs,256,20,100);
[cs10,yt10] = mfcc(s10, Fs,256,30,100);
[cs11,yt11] = mfcc(s11, Fs,256,30,100);
%% show clusters
figure
plot(cs8(:,9)', cs8(:,18)', 'x')
hold on
plot(cs4(:,9)', cs4(:,18)', 'o')
xlabel('mfcc-9'); ylabel('mfcc-18')

grid on
title("mfcc space")
%plot(code{8}(:,9),code{8}(:,18),'s')

%plot(code{4}(:,9),code{4}(:,18),'d')
legend("Speaker 8", "Speaker 4","S8 Cent","S4 Cent")
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
[code,cb,resval] = train('C:\Users\Maeia\Documents\MATLAB\Training_Data3\', 9,256,20,100,7);
test('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 13, code,cb,256,20,100,7)
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
test('C:\Users\Maeia\Documents\MATLAB\Test_Data\', 11, code,cb,400,20,100,8)

%%
[code,cb,resval] = train('C:\Users\Maeia\Documents\MATLAB\Training_Data3\', 8,256,20,100,6);

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



