# Speaker Recognition System
### Team: AudioVision  
#### Jennifer Dacanay, Maeia Reagle
EEC 201 Final Project

## Abstract

## Introduction
## Training

## Testing
### Pre-emphasizing

During the first step of pre-processing, we remove the noise and silent parts of the speech signals. 

<p align="center"> <img src="/img/s5_timedomain.JPG" width="511" height="420" alt="Time Domain s5.wav">
<br><i> Figure 1: Raw  and Filtered Signals Time Domain for Speaker 5 .</i><br><br>
</p>
  
### Test 2
We generate periodograms using the short-time fourier transform and vary the framze sizes. As the the frame size increases, more noise is removed.

## Feature Extraction

##  MFCC
<p align="center"> 
  <img src="/img/periodograms5.jpg" alt="Periodograms s5.wav"> 
<br><i> Figure 2: Periodograms using STFT with different frame sizes..</i><br><br>
 
</p>

### Test 3: 
Plot the mel-spaced filterbank responses. Compare them with theoretical responses. 

<p align="center"> <img src="/img/melfilterbanks.jpg" alt="MFCC Clusters">
<br><i> Figure 3: Mel-spaced Filter Bank Responses</i><br><br> </p>

Triangle filters aren’t as effective as the theoretical rectangular bandpass, however they work well enough for our purposes without adding extra complexity. 

<p align="center"> <img src="/img/spectrum_beforenafter_mel_s5.jpg" alt="Spectrogram s5.wav"> </p>


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
<div id="Human-Performance"></div>
<div align= "center">
<TABLE>
   <TR>
    <TD><b>Name</b></TD>
     <TD><b>No. of Speakers Recognized</b></TD>
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
<br><i> Figure 5: Human Performance for Speaker Recognition</i>
</p>


<p align="center">
  <img src="/img/results.jpg" width="411" height="320" alt="Test results"> 
<br><i> Figure 5: Test Results with Original Data</i>
</p>
Perfect accuracy every time for 1-8, although for 9-11 they are all too close to 7 to be able to effectivly say no match. 9 is Maeia’s training data and 12-13 are Maeias test data, which it also gets right!

### Test 8: Use notch filters on the voice signals to generate another test set. Test your system on the accuracy after voice signals have passed different notch filters that may have suppressed distinct features of the original voice signal. Report the robustness of your system. 

