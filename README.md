# Speaker Recognition System
### Team: AudioVision  
#### Jennifer Dacanay, Maeia Reagle
EEC 201 Final Project

## Abstract

## Introduction

### Pre-emphasizing

The first step of pre-processing, we remove the noise and silent parts of the speech signals. 

<p align="center"> <img src="/img/s5_timedomain.JPG" width="511" height="420" alt="Time Domain s5.wav">
<br><i> Figure 1: Raw  and Filtered Signals Time Domain for Speaker 5 .</i><br><br>
</p>
  
### Test 2
We generate periodograms using the short-time fourier transform and vary the framze sizes. As the the frame size increases, less noise remains.

## Feature Extraction

##  MFCC
<p align="center"> 
  <img src="/img/periodograms5.jpg" alt="Periodograms s5.wav"> 
<br><i> Figure 2: Periodograms using STFT with different frame sizes..</i><br><br>
 
</p>

### Test 3: 
Plot the mel-spaced filterbank responses. Compare them with theoretical responses. 

<p align="center"> <img src="/img/melfilterbanks.jpg" alt="MFCC Clusters"> </p>
<br><i> Figure 3: Mel Filter Bank Responses</i><br><br>

Triangle filters aren’t as effective as the theoretical rectangular bandpass, however they work well enough for our purposes without adding extra complexity . 

<p align="center"> <img src="/img/spectrum_beforenafter_mel_s5.jpg" alt="Spectrogram s5.wav"> </p>


<p align="center"> <img src="/img/clusters_s4s8.jpg" width="511" height="420" alt="MFCC Clusters"> </p>
<p align="center"> <img src="/img/mfcc_s5.jpg" width="511" height="420" alt="MFCC Clusters"> </p>
### Training

### Testing


## Results

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
  
<p align="center">
