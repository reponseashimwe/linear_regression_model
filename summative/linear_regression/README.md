# Medical Insurance Cost Prediction

## Project Overview

This project develops a predictive model to estimate individual medical insurance costs based on demographic and lifestyle factors. The goal is to provide insights for insurance providers and individuals about the factors that influence insurance costs and to predict these costs accurately.

## Dataset Description

The dataset used in this project is the "Medical Cost Personal Datasets" from Kaggle. It contains information about insurance beneficiaries, including their demographic information, lifestyle factors, and the insurance charges they incurred.

Source: [Medical Cost Personal Datasets on Kaggle](https://www.kaggle.com/datasets/mirichoi0218/insurance)

### Dataset Features:

- **age**: Age of the primary beneficiary (numeric)
- **sex**: Gender of the insurance contractor (female, male)
- **bmi**: Body mass index (weight in kg / height in m²), an objective measure of body weight relative to height (numeric)
- **children**: Number of dependents covered by health insurance (numeric)
- **smoker**: Smoking status (yes, no)
- **region**: Beneficiary's residential area in the US (northeast, southeast, southwest, northwest)
- **charges**: Individual medical costs billed by health insurance (numeric, target variable)

## Analysis and Model Development

### Exploratory Data Analysis

The project begins with an exploratory data analysis to understand the relationships between various features and the target variable "charges". Key visualizations include:

1. **Correlation Heatmap**: Shows the correlation between all numerical features, helping identify which variables have the strongest relationship with insurance charges.
2. **Pairplot of Numerical Features**: Visualizes the relationships between age, BMI, number of children, and insurance charges, colored by smoking status.
3. **Boxplots for Categorical Variables**: Displays how insurance charges vary across different categories like smoking status, gender, and region.
4. **Distribution of Charges**: Shows the distribution of the target variable.

### Model Development

Three regression models were implemented and compared:

1. **Linear Regression**: A simple parametric approach using gradient descent (as implemented by scikit-learn)
2. **Decision Tree Regressor**: A non-parametric approach that can capture non-linear relationships
3. **Random Forest Regressor**: An ensemble method that combines multiple decision trees for improved stability and accuracy

### Model Evaluation

The models were evaluated using Mean Squared Error (MSE) on both training and testing datasets. A lower MSE indicates better performance. The best-performing model was saved for future predictions.

## Files in this Project

- `multivariate.py`: Main script containing data loading, preprocessing, model training, evaluation, and visualization
- `insurance.csv`: Dataset file
- `predict_insurance_cost.py`: Script for making predictions with the best model for a single data point
- Various visualization outputs (PNG files)
- Saved model file in the `models/` directory

## Usage

### Running the Analysis

To run the complete analysis:

```
python multivariate.py
```

### Making Predictions

To predict insurance costs for a single individual:

```
python predict_insurance_cost.py
```

## Key Findings

(Findings will be populated after running the analysis)

## Requirements

- pandas
- numpy
- scikit-learn
- matplotlib
- seaborn
