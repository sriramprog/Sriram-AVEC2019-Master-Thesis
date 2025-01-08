# Master's Thesis Code Repository 
## EmoSense & Mood AI Project

## **Objective**: <br>
This repository contains the implementation for Speech Emotion Recognition (SER), focusing on continuous emotional state identification, including arousal, valence, and liking from speech signals. The model aims to address challenges in noisy and reverberated environments, which are common in real-world applications like healthcare diagnostics and human-computer interaction (HCI).

Permission of the script usage is attributed to the authors of the AVEC 2019 challenge [here](https://github.com/AudioVisualEmotionChallenge/AVEC2019). 

## **Code Overview:**
**Key Files:**
1. `extract_audio_LLDs.py`
   - Extracts acoustic low-level descriptors (LLDs) over time using the openSMILE toolkit. The LLDs include either eGeMAPS LLDs or MFCCs with delta and acceleration features.
   - [View code here](https://github.com/sriramprog/Sriram-AVEC2019-Master-Thesis/blob/main/extract_audio_LLDs.py)

2. `extract_video_LLDs.py`
   - Extracts visual LLDs over time (FAU likelihoods) using the openFACE toolkit.
   - [View code here](https://github.com/sriramprog/Sriram-AVEC2019-Master-Thesis/blob/main/extract_video_LLDs.py)

3. `generate_xbow_egemaps.py`
   - Generates Bag-of-Words (BoW) features, including bag-of-audio-words (BoAW) and bag-of-video-words (BoVW), using the openXBOW toolkit.
   - [View code here](https://github.com/sriramprog/Sriram-AVEC2019-Master-Thesis/blob/main/generate_xbow_egemaps.py)

4. `CES_data.py`
   - Loads features and labels for training and testing from the AVEC 2019 Cross-Emotion Subchallenge dataset.
   - [View code here](https://github.com/sriramprog/Sriram-AVEC2019-Master-Thesis/blob/main/CES_data.py)
  
5. `baseline_lstm.py`
   - Trains a 2-layer LSTM on the extracted features and saves the monomodal predictions.
   - [View code here](https://github.com/sriramprog/Sriram-AVEC2019-Master-Thesis/blob/main/baseline_lstm.py)

6. `calc_scores.py`
   - Computes performance metrics, including Concordance Correlation Coefficient (CCC), Pearson's Correlation Coefficient (PCC), and Mean Squared Error (MSE). Note: CCC is the official metric for this challenge.
   - [View code here](https://github.com/sriramprog/Sriram-AVEC2019-Master-Thesis/blob/main/calc_scores.py)

## **How to Use**
1. Clone the Repository:
git clone https://github.com/sriramprog/Sriram-AVEC2019-Master-Thesis

2. Install Dependencies: Ensure all required libraries are installed:
pip install -r requirements.txt

3. Run Feature Extraction:
- (a) For audio LLD extraction: python extract_audio_LLDs.py
- (b) For video LLD extraction: python extract_video_LLDs.py

4. Generate BoW Features:
python generate_xbow_egemaps.py

5. Train the Model:
python baseline_lstm.py

6. Evaluate the Model:
python calc_scores.py

## **References**
For a detailed description of the project, including background, data preprocessing, model development, and results, please visit my [Notion Repository](https://prickle-individual-755.notion.site/Project-1-EmoSense-Mood-AI-13ef9c7e943080caa53cd829a7544b6c).
