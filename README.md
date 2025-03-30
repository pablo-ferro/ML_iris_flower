# Iris Flower Dataset Analysis

This repository contains two complementary approaches to analyzing the famous Iris dataset:  
1. **Machine Learning Classification (Python)** - Predicting species using scikit-learn.  
2. **Statistical Analysis (R)** - Hypothesis testing and exploratory data analysis (EDA).

---

## 1. Machine Learning Classification (Python)

### Overview
A step-by-step workflow to classify Iris flower species (`setosa`, `versicolor`, `virginica`) using scikit-learn's K-Nearest Neighbors (KNN) algorithm.

### Key Steps
- **Data Exploration**: Visualizing feature distributions and pairwise relationships.  
- **Model Training**: Implementing KNN classification.  
- **Evaluation**: Scoring model accuracy and analyzing confusion matrices.

### Results
Achieved **96% accuracy** in species prediction using KNN (k=3).

---

## 2. Statistical Analysis (R)

### Overview
A rigorous statistical examination of the Iris dataset, including:  
- **ANOVA** to test for significant differences in sepal/petal measurements across species.  
- **Tukey HSD post-hoc tests** to identify which species pairs differ.  
- **Data Visualization**: Boxplots, confidence intervals, and pairwise comparison plots.

### Key Findings
- **Sepal Length**: Highly significant differences between all species (ANOVA *p* < 0.001).  
- **Petal Width**: *Virginica* petals are significantly wider than *versicolor* and *setosa* (Tukey *p* < 0.01).  

---

## Why Both Approaches?
- **Machine Learning (Python)**: Focuses on *predictive accuracy* for species classification.  
- **Statistical Analysis (R)**: Explains *why* the model works by quantifying biological differences between species.

---

## Dependencies
- **Python**: scikit-learn, pandas, matplotlib, Jupyter.  
- **R**: ggplot2, rstatix, dplyr.  
