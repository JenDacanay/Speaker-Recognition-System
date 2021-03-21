
<p align="center"> <img src="/Images/sound-waves-features.jpg" width = "1000" height = 400" alt="sound waves">
</p>

## Speaker Recognition System

### Team: AudioVision  | Members: Jennifer Dacanay and Maeia Reagle
###### Updated March 20, 2021 | EEC 201 Final Project | University of California, Davis

## Introduction

The goal of the project was to build a simple system that automatically recognizes a speaker through the use of digital signal processing tools. This was achieved using the text-dependent feature extraction method in MATLAB using Mel-Frequency Cepstrum Coefficients (MFCC), Vector Quantization (VQ), and the Linde, Buzo, and Gray (LBG) Algorithm to generate codewords (or centroids)  and the resulting vector-quantized codebook for each speaker. The system first trains to recognize each speaker through creating a VQ codebook. To recognize a speaker, the unknown voice signal is also vector-quantized and the system calculates the VQ distortion, which is the distance between a vector to the closest codeword of a codebook. The speaker is identified when the total VQ distortion is minimum. The system recognized speakers with 100% accuracy against the provided data set, 23% to 99% accuracy from an online database set, and stopped working after lower frequencies were cut off during notch filter testing. The results were all higher than our human performance recognition rate of 0% to 22% which demonstrates the speech recognition system works.

## Method

We performed the text-dependent feature extraction method which works best when the training data set has each speaker utter the same word. In our case, both the training and test sets each speaker was saying “zero”. The steps to implement and test our system consisted of three parts, preprocessing, training, and testing.

## Preprocessing

1. Plot the voice signal in time domain.
2. Normalized the signal using audioread function and removed the noise by setting a threshold that removed any data lower than -30dB.

## Training

3. Plot the Mel-spectrogram after calculating its short-time fourier transform, plot its periodogram, which is multiplied by the mel-filter banks which transforms the signal 4. using mel-frequency wrapping.
4. Plot MFCCs through discrete cosine transform (DCT) on the mel-spectrogram which removes its mean.
5. Plot the MFCCs using mfcc.m function
6. Performed vector quantization on the MFCCs, which generated codebooks for each speaker through VQ by performing the LBG algorithm. The LBG algorithm calculates the euclidean distances between centroids and MFCC.

## Testing
7. Each speaker was recognized by comparing the total smallest euclidean distance between each speaker to find a match.

## Implementation

Our speaker recognition system was created in Matlab. To execute the speaker recognition program:
1. Download src folder
2. Run identifyspeaker.m

## Results

### A. Speech Data Files

After our system was proven to work, we added noise and found that with a signal-to-noise-ratio (SNR) of 43 the system was still able to recognize speakers with 55% accuracy but an SNR of 42, the recognition rate decreased to 0%. Theoretically this may be due to the way we performed our preprocessing step in which we filtered out signals lower than -30 dB.

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

## B. Speech Preprocessing

## Test 2

Preprocessing was done using the audioread function in MATLAB which normalized the speech signals and determined the sampling rate to be 12.5 kHz.  In a block of 256 samples, this converts to 20.5 ms of speech found. The signals were plotted in time domain in Figure 1 below.

<p align="center">
  <img src="/Images/samplingrateresults.jpg" alt="sampling rate">

<p align="center">
  <img src="/Images/timedomainraw1-4.jpg" alt="Time Domain 1-4.wav">
  <img src="/Images/timedomainraw5-8.jpg" alt="Time Domain 5-8.wav">
  <img src="/Images/timedomainraw9-11.jpg" alt="Time Domain 9-11.wav">
<br><i> Figure 1: All raw training data signals plotted in time domain.</i><br><br>
</p>

<p align="center">
  <img src="/Images/s5_timedomain.JPG" alt="Time Domain s5.wav">
<br><i> Figure 2: Raw and Filtered Signals in Time Domain for Speaker 5 .</i><br><br>
</p>

The raw signal (top) for speaker voice shows there is a lot of data containing no information which is the silence in the recording, in addition, without the audioread that normalized the signal, the amplitudes varied between each speaker. The bottom figure shows the filtered signal after the preprocessing step that normalized the signal and removed data below -30 dB.

This preprocessing step worked since our system produced a recognition rate of 73% which was well above our human benchmark rate established at 25%. However, after adding the additional test files for speakers 9 through 11, they tended to match with speaker 7 or 9.

The discrepancy was found when we examined the signals in the time domain. Speakers 9, 10, and 11 had an extra stereo channel seen as orange Figure 2(a) below.

<p align="left">
  <img src="/Images/s10_timedomains.jpg" alt="Time Domain s10.wav">
</p>
<p align="center">
<br><i> Figure 3: Raw and Filtered Signals in Time Domain for Speaker 10 .</i><br><br>
</p>

After we initially pre-processed signals 9 through 11, two signals were generated as shown in Figure 3 (b). After removing the extra signal during the preprocessing step shown in Figure 3(c), the filtered signal was pre-processed with desired results, Figure 3 (d). Training with the signals in Figure 3(d) allowed the total VQ distortions to be calculated correctly, resulting in an increased recognition rate to 100% out of 30 test runs.

Next, we performed the short-time fourier transform on the signals by increasing the number of samples per frame, N, from 128, 256, and 512, with a frame increment approximately N/3. We then plotted the periodograms in Figure 4.

We generated periodograms using the short-time fourier transform and vary the frame sizes. It can be observed in the figures, as the frame size increases, more noise is removed.

<p align="center"> 
  <img src="/Images/periodogram128.jpg" width="411" height="320"  alt="Periodogram 128.wav"> 
  <img src="/Images/periodogram256.jpg" width="411" height="320"  alt="Periodogram 256.wav"> 
  <img src="/Images/periodogram512.jpg" width="411" height="320"  alt="Periodogram 512.wav"> 
  <img src="/Images/stft2_s5.jpg" alt="Periodograms2 s5.wav"> 
<br><i> Figure 4: Periodograms using STFT with different frame sizes.</i><br><br>
</p>

In Figure 4 (top), we can see that as the frame size increases from N = 128 to N = 512, results in less noise. This is further supported from another perspective of the periodogram with the figures at the bottom. Spectral distortion decreased as the hamming window frame size increased. Furthermore, most of the signal’s energy is found at frequencies less than 5 kHz with the highest energy within 1 kHz. The periodogram shows the signal has the most energy at lower frequencies which is in line with known speech recognition techniques where linear frequency spacing is performed at frequencies lower than 1 kHz to capture important acoustic characteristics of speech. We found that too high a window frame, here N = 512, started to filter the signal's energy, thus a hamming window frame size of 256 was chosen as it removed the spectral distortion but retained most of the signal’s energy.

### Test 3

The mel-spaced filterbank responses are plotted in Figure below.

<p align="center"> <img src="/Images/melfilterbanks.jpg" alt="MFCC Clusters">
<br><i> Figure 5: Mel-spaced Filter Bank Responses</i><br><br> </p>

Triangle filters aren’t as effective as the theoretical rectangular bandpass filter, however, they work well enough for our purposes without adding extra complexity.

The Mel-scale aims to mimic the non-linear human ear perception of sound, by being more discriminative at lower frequencies and less discriminative at higher frequencies [7].

<p align="center"> <img src="/Images/spectrum_beforenafter_mel_s5.jpg" alt="MFCC Clusters">
<br><i> Figure 6: Spectrogram of Speech Segment from Speaker 5 Saying "zero" and the corresponding MFCCs. </i><br><br> </p>

The mfcc function multiplies the raw spectrogram with the 20 mel-spaced filter banks. This quantified the smooth shape of the spectral envelope, this is important for identifying vowels. At the same time, it removed the fine spectral structure, which is less important in our application. It thus focuses on the most informative parts of the signal.

### Test 4

<p align="center">
  <img src="/Images/mfcc_processor.jpg" alt="MFCC Space"> 
<br><i> Figure 7: Block diagram of MFCC processor (source: Speaker Recognition System 2020) </i>
  </p>

MFCCs are computed through first computing the STFT power spectrum using Hamming window. The log of the STFT magnitude was applied to the Mel-spaced filter bank to obtain N energies. From the N energies, performed the cepstrum which is computed by taking the inverse discrete cosine transform (IDCT) of the log filter-bank energies resulting in the MFCCs (usually around 10, we chose 7 to be most efficient). 

## C. Vector Quantization

The closwords.m function performs vector quantization through a clustering algorithm known as the LBG algorithm on the training data set to build speaker identity references. The closwords.m function finds the euclidean distance between each point and each centroid, and then finds the minimum and sets that as the closest centroid. Then we make new centroids by taking the mean of all the closest points to each centroid, and then set those as the new centroid. We then calculate the distance between each centroid and its closest points, we repeat this process making new centroids over and over until the centroids settle by the difference in total distance from the centroids and their closest point changing less than the reswan value after an iteration, as this means the centroids settled and that speakers codebook, the collection of all created centroids, has been completed.

### Test 5

The resulting MFCC were plotted in a 2D plane for different speakers.

<p align="center">
  <img src="/Images/mfcc_space.jpg" width="411" height="320" alt="MFCC Space"> 
  <img src="/Images/mfcc_space3.jpg" width="411" height="320" alt="MFCC Clusters">
<br><i> Figure 8: MFCC Clusters </i>
  </p>
  
We inspected the acoustic space by plotting the 2 different MFCC vectors and observed that different speakers produced different sets of clusters. In Figure ##, speaker 4 is mostly on the negative side whereas speaker 8 is mostly on the positive side for MFCC 9 and 19.

Dothelifting.m function is called as such because it does the vast majority of the work. It generates the codebook and closest centroid (codeword) for each point for each speaker given as input, cs, and does so for k centroids. It also returns the final distance value for debugging purposes. It first places random centroids and sets a target change in residual value. Then the code itterates by first finding the closest centroids to each point by calling the closwords.m function.

### Test 6:

The resulting VQ centroids (codewords) were plotted over the same MFCC 9 and 19 clusters in Figure 9 below.

<p align="center">
  <img src="/Images/mfcc_space.jpg" width="411" height="320" alt="MFCC Space"> 
  <img src="/Images/clusters_s4s8.jpg" width="411" height="320" alt="MFCC Clusters">
<br><i> Figure 9: MFCC clusters (left) and centroids (right) </i>
  </p>
  
We observed that the VQ codebooks for speaker 8 and speaker 4 are unique which would help in differentiating between each speaker during testing.

### Test 7

This preprocessing step worked since our system produced a recognition rate of 73% which was well above our human benchmark rate established at 25%. However, after adding the additional test files for speakers 9 through 11, they tended to match with speaker 7 or 9.

Initially, our system recognition rate was initially 73% which is higher than our human performance rate of 25%. After making some changes to preprocessing our system recognition rate increased to 100% out of 30 runs with the given training and test data.

It was found that a window size of 256, a mel bank of 20, an overlap of 100, and 7 centroids produced the most accurate results. This was found by randomly trying different combinations of the 4 values until one gave consistent correct results, this was the most stable of all the ones tried. 

<p align="center">
  <img src="/Images/results.jpg" width="411" height="320" alt="Test results"> 
<br><i> Figure 10: Test results against original data set, 73% recognition rate. </i>
</p>

<p align="center">
  <img src="/Images/results2.jpg" alt="Test results 2"> 
<br><i> Figure 11: Test results against original data set, 100% recognition rate. </i>
</p>

In Figure 11, the results show perfect accuracy every time for speakers 1 through 8, although for 9 through 11, they are all too close to 7 to be able to effectively say no match. Speaker 9 is Maeia’s training data while speakers 12 through 13 are Maeia’s test data, which the system also identified correctly.

### Test 8

Notch filters were used on the voice signals to generate another test set. The accuracy of our system was tested after voice signals have passed different notch filters would have possibly suppressed distinct features of the original voice signal.The results are shown below.

<p align="center">
  <img src="/Images/results_notch1.jpg" alt="Notch Test results 1"> 
<br><i> Figure 12: Test results after 3 notch filters./i>
</p>
   
After applying 3 notch filters with a Q factor of 20, the system succesfully recognized all speakers.

<br>
<p align="center">
  <img src="/Images/results_notch2.jpg" alt="Notch Test results 2"> 
<br><i> Figure 13: Test results after 6 notch filters. </i>
</p>

Applying 3 additional notch filters with a Q factor of 10 resulted in a lower success rate.

### Test 9

A dataset with 5 speakers and 1500 speech signals from live speeches of each speaker are included, some of these files are just noise and clapping, 1 file from each speaker that was seen as representative of the speakers voices were used to train the algorithm
Speaker 1 23%
Speaker 2 77%
Speaker 3 37%
Speaker 4 66%
Speaker 5 99%
Considering the terrible quality of some of these voice captures, the fact that all of these are better than random guesses ( some significantly so.. )Despite only one piece of training data is astonishing. The fact that it was better than random guessing in all the cases, and mostly correct in a few is very impressive

## Conclusion

### Future Work

Plans for future works include implementing the deep learning technique (DL) to test whether it improves the robustness of the speaker recognition system against noise and Other plans are to create a graphical user interface (GUI) and implement this system.

### Acknowledgements

+ We would like to thank Dr. Zhi Ding and Teaching Assistant Songyang Zhang for their guidance.

### Appendix

+ This project was the final project Digital Signal Processing course, EEC 201, at University of California, Davis.

##### <i> This final project was a result of the collaborative effort to create a speech recognition system through the use of digital signal processing tools, specifically, text-dependent feature extraction using Mel-Frequency Cepstrum Coefficients (MFCC), Vector Quantization (VQ), and the Linde, Buzo, and Gray (LBG) Algorithm. The project was implemented using MATLAB, where Maeia created the preliminary complete system implementation while Jennifer worked on improvements in pre-processing, data extraction, plotting results, and adding noise to training data. Jennifer implemented Github and the final report. We collaborated throughout the whole process, so neither parts were done exclusively as we relied and helped each other when either of us ran into some issues.</i>

### References 

[1]     L.R. Rabiner and B.H. Juang, Fundamentals of Speech Recognition, Prentice-Hall, Englewood Cliffs, N.J., 1993.
 
[2]     L.R Rabiner and R.W. Schafer, Digital Processing of Speech Signals, Prentice-Hall, Englewood Cliffs, N.J., 1978.
 
[3]     S.B. Davis and P. Mermelstein, “Comparison of parametric representations for monosyllabic word recognition in continuously spoken sentences”, IEEE Transactions on Acoustics, Speech, Signal Processing, Vol. ASSP-28, No. 4, August 1980.
 
[4]     Y. Linde, A. Buzo & R. Gray, “An algorithm for vector quantizer design”, IEEE Transactions on Communications, Vol. 28, pp.84-95, 1980.
 
[5]     S. Furui, “Speaker independent isolated word recognition using dynamic features of speech spectrum”, IEEE Transactions on Acoustic, Speech, Signal Processing, Vol.           ASSP-34, No. 1, pp. 52-59, February 1986.
 
[6]     S. Furui, “An overview of speaker recognition technology”, ESCA Workshop on Automatic Speaker Recognition, Identification and Verification, pp. 1-9, 1994.
 
[7]     H. Fayek https://haythamfayek.com/2016/04/21/speech-processing-for-machine-learning.html
 
[8]     F.K. Song, A.E. Rosenberg and B.H. Juang, “A vector quantisation approach to speaker recognition”, AT&T Technical Journal, Vol. 66-2, pp. 14-26, March 1987.

[9]     comp.speech Frequently Asked Questions http://svr-www.eng.cam.ac.uk/comp.speech/

[10]    https://en.wikipedia.org/wiki/Euclidean_distance

[11]    Henry degree and tony tsoi’s code for inspiration on the input cutting, which was necessary for program to operate accurately


