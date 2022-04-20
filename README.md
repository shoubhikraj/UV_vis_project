## Prediction of UV-vis absorption maxima (excitation energies) with combined TD-DFT and Machine Learning

This github repo contains all of my input and output files, and python code that I used for my master's project. In the research due to practical time constraints, an approximation to TD-DFT called sTD-xTB was used for the main part of the study. Therefore the bulk of the contents are in the xTB folder here. In the TD-DFT folder, only the inputs and outputs for the benchmarking using full TD-DFT are there.

The idea is that the ML model is fitted to the error between sTD-xTB results and the experimental excitation energies, so that it can act as an error-correction model for sTD-xTB, and provide high quality results with low computational cost (as sTD-xTB is fast, and ML-correction does not take more than half a second to calculate). The ML models take molecular fingerprints/descriptors as input. In this case, the best model was found to be SVM with ECFP6 fingerprint. With SVM/ECFP6 corrections added, the predictions for test set (i.e. unseen data) shows very high accuracy (MAE = 0.04 eV) compared to just sTD-xTB without any error-correction (MAE = 0.23 eV).

The main calculations are all done in xTB/training/Statistical_model_with_stdxtb.ipynb jupyter notebook. All of the output files are also uploaded in their proper directories, so if you wish to run the calculations again, simply download the repo and then run the jupyter notebook from the start. To run it, rdkit, scikit-learn, mordred, pandas, numpy and optuna are required.