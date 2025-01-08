# Master's Thesis Code Repository 
## EmoSense & Mood AI Project

Objective: This project advances Speech Emotion Recognition (SER) by developing a model that accurately identifies continuous emotional states—arousal, valence, and liking—from speech signals in real-world conditions. It addresses the limitations of traditional SER models by focusing on noisy environments and reverberation, which are common in practical applications such as healthcare diagnostics and human-computer interaction (HCI).

Permission of the script usage is attributed to the authors of the AVEC 2019 challenge [here](https://github.com/AudioVisualEmotionChallenge/AVEC2019). This repository which contains the files to the run the baseline audiovisual features extraction and baseline recognition systems.
1. **Data Collection**: First, we gather relevant datasets from the AVEC 2019 challenge dataset [here](https://sites.google.com/view/avec2019/home).
   
2. **Data Preprocessing**: The data is cleaned and transformed using the LLD and BoW techniques. <br>

  a.   **_Low-Level Descriptors (LLDs)_**: <br>
  (i) `extract_audio_LLDs.py` file extracts acoustic LLDs over time (either eGeMAPS LLDs or MFCCs + delta + acceleration) using openSMILE toolkit. View code [here](https://github.com/sriramprog/class-personal-projects/blob/main/extract_audio_LLDs.py) <br>
  
  (ii) `extract_video_LLDs.py` file extracts visual LLDs over time (FAU likelihoods) using openFACE toolkit. View code [here](https://github.com/sriramprog/class-personal-projects/blob/main/extract_video_LLDs.py) <br>
  
  b.   **_Bag-of-Words Representations (BoW)_**: <br>
`generate_xbow_egemaps.py` file extracts bag-of-audio-words (BoAW) and bag-of-video-words (BoVW) features from the respective LLDs using openXBOW toolkit. View code [here](https://github.com/sriramprog/class-personal-projects/blob/main/generate_xbow_egemaps.py) <br>

3. **Model Development**: The model is developed using LSTM network, as detailed by using the following files for model training and testing purposes. <br>

  a.   `CES_data.py file` loads features for all partitions and labels for training and development partitions for AVEC 2019 Cross-Emotion Subchallenge portion of the dataset. View code [here](https://github.com/sriramprog/class-personal-projects/blob/main/CES_data.py) <br>
  
  b.   `baseline_lstm.py` performs the training of a 2-layer LSTM on the features and save monomodal predictions. View code [here](https://github.com/sriramprog/class-personal-projects/blob/main/baseline_lstm.py) <br>
  
  c.   `calc_scores.py` calculates Concordance Correlation Coefficient (CCC), Pearson's Correlation Coefficient (PCC) and Mean Squared Error (MSE) on the concatenated predictions. Note: Only the CCC is taken into account as the official metric for this challenge. View code [here](https://github.com/sriramprog/class-personal-projects/blob/main/calc_scores.py) <br>
