# Radiomics-AI-tool

This repositery is used to generate AI features and combine with radiomics features to give the survival probability of each new patient.

## Generate Radiomics Features

1. The baseline contrast-enhanced CT images are acquired and saved as dicom format.

2. The ITK-SNAP or 3D Slicer software is used to manually segment the 3D ROI of the tumors on corticomedullary phase (CMP) and nephrographic phase (NP) images, and nrrd or nifti format ROIs are saved.

3. The radiomics features are derived from 3D ROIs, and extracted from Pyradiomics software (Version 3.0). The code is based on the pyradiomics python package. It could be easily achieved by 3D slicer, LIFEx, or other programs.

## Generate AI Features

1. Select the cross section of CT which contains the largest ROI of the tumors.

2. Crop it to a square figure, in which the tumor occupy the most part of the figure.

3. Convert the cropped figure into numpy format and saved as files in the Preprocess directory.

4. run the python script "AI-features.py". The AI features would be calculated and printed.

## Combine Radiomics and AI scores

DLR_score is calculated using the formula shown in the DLR——scoreformula.docx. Calculate the DLR_score based on the formulation.

## Survival rate prediction

The 1-, 3-, and 5- year unrecurrence rate can be calculated by running the "probabilityCalculation.R". The survaival_train4.csv is the set of patients used in our paper. You could add new patients in the survival_newDATA.csv to predict your patients.


