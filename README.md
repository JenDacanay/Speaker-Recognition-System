
<p align="center"> <img src="/Images/sound-waves-features.jpg" width = "1000" height = 400" alt="sound waves">
</p>

## Speaker Recognition System

### Team: AudioVision  | Members: Jennifer Dacanay and Maeia Reagle
###### Updated March 20, 2021 | EEC 201 Final Project | University of California, Davis

### Introduction

The goal of the project was to build a simple system that automatically recognizes a speaker through the use of digital signal processing tools. This was achieved using the text-dependent feature extraction method in MATLAB using Mel-Frequency Cepstrum Coefficients (MFCC), Vector Quantization (VQ), and the Linde, Buzo, and Gray (LBG) Algorithm to generate codewords (or centroids)  and the resulting vector-quantized codebook for each speaker. The system first trains to recognize each speaker through creating a VQ codebook. To recognize a speaker, the unknown voice signal is also vector-quantized and the system calculates the VQ distortion, which is the distance between a vector to the closest codeword of a codebook. The speaker is identified when the total VQ distortion is minimum. The system recognized speakers with 100% accuracy against the provided data set, 23% to 99% accuracy from an online database set, and stopped working after lower frequencies were cut off during notch filter testing. The results were all higher than our human performance recognition rate of 0% to 25% which demonstrates the speech recognition system works.

### Method

We performed the text-dependent feature extraction method which works best when the training data set has each speaker utter the same word. In our case, both the training and test sets each speaker was saying “zero”. The steps to implement and test our system consisted of three parts, preprocessing, training, and testing.


#### Preprocessing

1. Plot the voice signal in time domain.
2. Normalized the signal using audioread function and removed the noise by setting a threshold that removed any data lower than -30dB.

#### Training

3. Plot the Mel-spectrogram after calculating its short-time fourier transform, plot its periodogram, which is multiplied by the mel-filter banks which transforms the signal 4. using mel-frequency wrapping.
4. Plot MFCCs through discrete cosine transform (DCT) on the mel-spectrogram which removes its mean.
5. Plot the MFCCs using mfcc.m function
6. Performed vector quantization on the MFCCs, which generated codebooks for each speaker through VQ by performing the LBG algorithm. The LBG algorithm calculates the euclidean distances between centroids and MFCC.
Testing
7. Each speaker was recognized by compaing the total smallest euclidean distance between each speaker to find a match.

### Implementation

This speaker recognition system was created in Matlab. To execute the speaker recognition program:
1. Download src folder
2. Run identifyspeaker.m

### Results

### Test 1
In this step, we established the human performance recognition rate as the benchmark to compare our speech recognition system to. We listened eleven speakers say "zero" in the  Training_Data folder, then played a random file in Test_Data folder and tried to identify each speaker. The results were recorded in Table 1 below:  

<p align="center">
<div align= "center">
<TABLE>
   <TR>
    <TD><b>Name</b></TD>
     <TD><b>No. of Speakers Recognized Correctly</b></TD>
     <TD><b>Accuracy</b></TD> 
  </TR>
  <TR>
    <TD align="center">Jennifer</TD>
    <TD align="center">2 out of 8</TD>
    <TD align="center">25%</TD> 
  </TR>
    <TR>
    <TD align="center">Maeia</TD>
    <TD align="center">0 out of 8</TD>
    <TD align="center">0%</TD> 
  </TR>
  </TABLE>
  </div>
  </p>
<p align="center"> 
<i> Table 1: Human Performance for Speaker Recognition</i>
</p>

### Test 2

Preprocessing was done using the audioread function in MATLAB which normalized the speech signals and determined the sampling rate to be 12.5 kHz. In a block of 256 samples, this converts to 20.5 ms of speech found.

<p align="center">
  <img src="/Images/samplingrateresults.jpg" alt="sampling rate">

<p align="center">
  <img src="/Images/s5_timedomain.JPG" alt="Time Domain s5.wav">
<br><i> Figure 1: Raw and Filtered Signals in Time Domain for Speaker 5 .</i><br><br>
</p>

The raw signal (top) for speaker voice shows there is a lot of data containing no information which is the silence in the recording, in addition, without the audioread that normalized the signal, the amplitudes varied between each speaker. The bottom figure shows the filtered signal after the preprocessing step that normalized the signal and removed data below -30 dB. 

This preprocessing step worked since our system produced a recognition rate of 73% which was well above our human benchmark rate established at 25%. However, after adding the additional test files for speakers 9 through 11, they tended to match with speaker 7 or 9. 


We generated periodograms using the short-time fourier transform and vary the frame sizes. It can be observed in the figures, as the frame size increases, more noise is removed.

<p align="center"> 
  <img src="/Images/periodogram128.jpg" width="411" height="320"  alt="Periodogram 128.wav"> 
  <img src="/Images/periodogram256.jpg" width="411" height="320"  alt="Periodogram 256.wav"> 
  <img src="/Images/periodogram512.jpg" width="411" height="320"  alt="Periodogram 512.wav"> 
  <img src="/Images/stft2_s5.jpg" alt="Periodograms2 s5.wav"> 
<br><i> Figure 1: Periodograms using STFT with different frame sizes.</i><br><br>
</p>

## Feature Extraction

### Test 3: 
Plot the mel-spaced filterbank responses. Compare them with theoretical responses. 

<p align="center"> <img src="/Images/melfilterbanks.jpg" alt="MFCC Clusters">
<br><i> Figure 2: Mel-spaced Filter Bank Responses</i><br><br> </p>

Triangle filters aren’t as effective as the theoretical rectangular bandpass, however they work well enough for our purposes without adding extra complexity. 

###  MFCC

Multiplying the raw spectrogram with the mel-spaced filter banks quantifies the smooth shape of the spectral envelope, this is important for identifying vowels. At the same time, it removed the fine spectral structure, which is less important in our application. It thus focuses on the most informative parts of the signal. Straightforward and 
<p align="center"> <img src="/Images/spectrum_beforenafter_mel_s5.jpg" alt="Spectrogram s5.wav"> 
<br><i> Figure 3: Spectrogram of Speech Segment from Speaker 5 Saying "zero" and the corresponding MFCCs.</i><br><br> </p>

### Test 5:

We inspect the acoustic space, MFCC vectors, and observe that that different speakers produce different sets of clusters.
<p align="center">
  <img src="/Images/mfcc_space.jpg" width="411" height="320" alt="MFCC Space"> 
  <img src="/Images/clusters_s4s8.jpg" width="411" height="320" alt="MFCC Clusters">
<br><i> Figure 4: MFCC Clusters and Centroids (Right)</i>
  </p>
  
Are they in clusters? They are very much in clusters after the MFCC step, in this case 4 is mostly on the negative side where speaker 8 is mostly on the positive side for these MFCCs 9 and 19.

### Test 6:
The plot of VQ codewords was added to over the MFCC space vector to show the centroids.
It was found that a window size of 256 a mel bank of 20 an overlap of 100 and 7 centroids was best for accuracy, this was found by randomly trying different combinations of the 4 values until one gave consistent correct results, this was the most stable of all the ones tried. 

### Test 7: Record the results. What is recognition rate our system can perform? Compare this with the human performance

<p align="center">
  <img src="/Images/results.jpg" width="411" height="320" alt="Test results"> 
<br><i> Figure 5: Test Results with Original Data</i>
</p>
Perfect accuracy every time for 1-8, although for 9-11 they are all too close to 7 to be able to effectivly say no match. 9 is Maeia’s training data and 12-13 are Maeias test data, which it also gets right!

### Test 8: Use notch filters on the voice signals to generate another test set. Test your system on the accuracy after voice signals have passed different notch filters that may have suppressed distinct features of the original voice signal. Report the robustness of your system. 

<p align="center">
  <img src="/Images/results_notch1.jpg" alt="Notch Test results 1"> 
<br><i> Figure 6:  Test results after 3 notch filters./i>
</p>
After applying 3 notch filters with a Q factor of 20, the system succesfully recognizes all speakers.


<br>
<p align="center">
  <img src="/Images/results_notch2.jpg" alt="Notch Test results 2"> 
<br><i> Figure 7: Test results after 6 notch filters. </i>
</p>

Applying 3 additional notch filters with a Q factor of 10 resulted in a lower sucess rate.

### Test 9: 
Test the system with other speech files you may find online. E.g. https://lionbridge.ai/datasets/best-speech-recognition-datasets-formachine-learning

A dataset with 5 speakers and 1500 speech signals from live speeches of each speaker are included, some of these files are just noise and clapping, 1 file from each speaker that was seen as representative of the speakers voices were used to train the algorithm
Speaker 1 23%
Speaker 2 77%
Speaker 3 37%
Speaker 4 66%
Speaker 5 99%
Considering the terrible quality of some of these voice captures, the fact that all of these are better than random guesses ( some significantly so.. )Despite only one piece of training data is astonishing. The fact that it was better than random guessing in all the cases, and mostly correct in a few is very impressive


##### <i> This final project was a result of the collaborative effort to create a speech recognition system through the use of digital signal processing tools, specifically, text-dependent feature extraction using Mel-Frequency Cepstrum Coefficients (MFCC), Vector Quantization (VQ), and the Linde, Buzo, and Gray (LBG) Algorithm. </i>


### References 

[1]     L.R. Rabiner and B.H. Juang, Fundamentals of Speech Recognition, Prentice-Hall, Englewood Cliffs, N.J., 1993.
 
[2]     L.R Rabiner and R.W. Schafer, Digital Processing of Speech Signals, Prentice-Hall, Englewood Cliffs, N.J., 1978.
 
[3]     S.B. Davis and P. Mermelstein, “Comparison of parametric representations for monosyllabic word recognition in continuously spoken sentences”, IEEE Transactions on Acoustics, Speech, Signal Processing, Vol. ASSP-28, No. 4, August 1980.
 
[4]     Y. Linde, A. Buzo & R. Gray, “An algorithm for vector quantizer design”, IEEE Transactions on Communications, Vol. 28, pp.84-95, 1980.
 
[5]     S. Furui, “Speaker independent isolated word recognition using dynamic features of speech spectrum”, IEEE Transactions on Acoustic, Speech, Signal Processing, Vol. ASSP-34, No. 1, pp. 52-59, February 1986.
 
[6]     S. Furui, “An overview of speaker recognition technology”, ESCA Workshop on Automatic Speaker Recognition, Identification and Verification, pp. 1-9, 1994.
 
[7]     F.K. Song, A.E. Rosenberg and B.H. Juang, “A vector quantisation approach to speaker recognition”, AT&T Technical Journal, Vol. 66-2, pp. 14-26, March 1987.
 
[8]      comp.speech Frequently Asked Questions WWW site,http://svr-www.eng.cam.ac.uk/comp.speech/

[9]     https://en.wikipedia.org/wiki/Euclidean_distance

[10]    Henry degree and tony tsoi’s code for inspiration on the input cutting, which was necessary for program to operate accurately

[11]    Matlab, for not telling figuring out till after the fact there are two different functions for euclidean distance rather than programing our own.

[12]    https://www.kaggle.com/kongaevans/speaker-recognition-dataset?select=16000_pcm_speeches

