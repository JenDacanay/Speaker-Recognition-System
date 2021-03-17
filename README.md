# Speaker Recognition System
### Team: AudioVision  
#### Jennifer Dacanay, Maeia Reagle
EEC 201 Final Project

## Abstract

## Introduction

+ To execute the speaker recognition program:
  1. Download src folder
  2. Download Data folder into src folder
  3. Run `finaldsp.m`

### Pre-emphasizing

Each signal had a sampling frequency of 12.5 khz, therefore 20.5 ms of will have a frame with 256 samples. 
<p align="center"> <img src="/img/s5_timedomain.JPG" alt="Time Domain s5.wav">
  
<br><i> Figure 1: Raw and Filtered Signals in Time Domain for Speaker 5 .</i><br><br>
</p>

## Training

## Testing

### Test 1
In this step, we established the human performance recognition rate as the benchmark to compare our speech recognition system to. We listened eleven speakers say "zero" in the  Training_Data folder, then played a random file in Test_Data folder and tried to identify each speaker. The results were recorded in Table 1 below:  

<p align="center">
 
<div id="Human-Performance"></div>

<div align= "center">
<TABLE>
   <TR>
    <TD><b>Name</b></TD>
     <TD><b>No. of Speakers Recognized Correctly</b></TD>
     <TD><b>Accuracy</b></TD> 
  </TR>
  <TR>
    <TD align="center">Jennifer</TD>
    <TD align="center">2 out of 11</TD>
    <TD align="center">18%</TD> 
  </TR>
    <TR>
    <TD align="center">Maiea</TD>
    <TD align="center">0 out of 11</TD>
    <TD align="center">0%</TD> 
  </TR>
  </TABLE>
  </div>
  </p>
  
<p align="center">
<i> Table 1: Human Performance for Speaker Recognition</i>
  </p>

### Test 2

We generate periodograms using the short-time fourier transform and vary the frame sizes. It can be observed in the figures, as the frame size increases, more noise is removed.

<p align="center"> 
  <img src="/img/periodograms5.jpg" alt="Periodograms s5.wav"> 
<br><i> Figure 1: Periodograms using STFT with different frame sizes..</i><br><br>
</p>

Since all signals had a frame length of 256 samples, we chose to use the frame length, N = 312 which equals 25 ms. This is between the reccomended range of 20 ms to 30 ms and gives a frame overlap of 60%. 
Figure 1 shows the periodogram after taking the short-time fourier transfrom (STFT). The periodogram demonstrates how the power of the signal is distributed in the frequency range and over time. We see how the signal is mainly in the lower frequencies less than 4.5khz.

During the first step of pre-processing, we remove the noise and silent parts of the speech signals. 
## Feature Extraction

### Test 3: 
Plot the mel-spaced filterbank responses. Compare them with theoretical responses. 

<p align="center"> <img src="/img/melfilterbanks.jpg" alt="MFCC Clusters">
<br><i> Figure 2: Mel-spaced Filter Bank Responses</i><br><br> </p>

Triangle filters aren’t as effective as the theoretical rectangular bandpass, however they work well enough for our purposes without adding extra complexity. 

##  MFCC

Multiplying the raw spectrogram with the mel-spaced filter banks quantifies the smooth shape of the spectral envelope, this is important for identifying vowels. At the same time, it removed the fine spectral structure, which is less important in our application. It thus focuses on the most informative parts of the signal. Straightforward and 
<p align="center"> <img src="/img/spectrum_beforenafter_mel_s5.jpg" alt="Spectrogram s5.wav"> 
<br><i> Figure 3: Spectrogram of Speech Segment from Speaker 5 Saying "zero" and the corresponding MFCCs.</i><br><br> </p>


### Test 5:

We inspect the acoustic space, MFCC vectors, and observe that that different speakers produce different sets of clusters.
<p align="center">
  <img src="/img/mfcc_space.jpg" width="411" height="320" alt="MFCC Space"> 
  <img src="/img/clusters_s4s8.jpg" width="411" height="320" alt="MFCC Clusters">
<br><i> Figure 4: MFCC Clusters and Centroids (Right)</i>
  </p>
  
Are they in clusters? They are very much in clusters after the MFCC step, in this case 4 is mostly on the negative side where speaker 8 is mostly on the positive side for these mfcc coefficients 9 and 19.

### Test 6:
The plot of VQ codewords was added to over the MFCC space vector to show the centroids.

## Results

### Test 7: Record the results. What is recognition rate our system can perform? Compare this with the human performance

<p align="center">
  <img src="/img/results.jpg" width="411" height="320" alt="Test results"> 
<br><i> Figure 5: Test Results with Original Data</i>
</p>
Perfect accuracy every time for 1-8, although for 9-11 they are all too close to 7 to be able to effectivly say no match. 9 is Maeia’s training data and 12-13 are Maeias test data, which it also gets right!

### Test 8: Use notch filters on the voice signals to generate another test set. Test your system on the accuracy after voice signals have passed different notch filters that may have suppressed distinct features of the original voice signal. Report the robustness of your system. 

<p align="center">
  <img src="/img/results_notch1.jpg" alt="Notch Test results 1"> 
<br><i> Figure 6:  Test results after 3 notch filters./i>
</p>
After applying 3 notch filters with a Q factor of 20, the system succesfully recoginzes all speakers.


<br>
<p align="center">
  <img src="/img/results_notch2.jpg" alt="Notch Test results 2"> 
<br><i> Figure 7: Test results after 6 notch filters. </i>
</p>
Applying 3 more notch filters with a Q factor of 10 results in a lower sucess rate.
