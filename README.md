# Medical Insurance Cost Prediction

## Mission

This project aims to predict medical insurance costs based on various personal attributes, helping both insurance companies and individuals understand the factors that influence healthcare expenses. By accurately predicting insurance charges, we can assist people in planning their finances and insurance companies in setting appropriate premiums.

## Dataset

The dataset used in this project is from Kaggle: [Medical Insurance Cost](https://www.kaggle.com/datasets/mirichoi0218/insurance).

It contains the following features:

- Age: Age of the primary beneficiary
- Sex: Gender of the insurance contractor (female or male)
- BMI: Body Mass Index, a measure of body fat based on height and weight
- Children: Number of children/dependents covered by the insurance
- Smoker: Whether the beneficiary is a smoker (yes or no)
- Region: The beneficiary's residential area in the US (northeast, southeast, southwest, northwest)
- Charges: Individual medical costs billed by health insurance (target variable)

## Project Structure

- `summative/linear_regression/multivariate.py`: Main script for model training, comparison, and evaluation
- `api/predict.py`: Script for making predictions using the trained model
- `summative/insurance.csv`: The dataset file

## Models Implemented

1. Linear Regression
2. Decision Tree
3. Random Forest

The models are compared based on Mean Squared Error (MSE) and R² score, and the best-performing model is saved for future predictions.

## Installation

To set up and run this project:

1. Clone the repository
2. Install the required dependencies:

```
pip install -r requirements.txt
```

## Usage

### Training Models

To train all models and compare their performance:

```
python mulrivariate.py
```

This script will:

- Load and preprocess the data
- Train Linear Regression, Decision Tree, and Random Forest models
- Compare performance metrics
- Save all models and the best-performing one
- Generate visualization plots

### Making Predictions

To make predictions using the best model:

```
python predict.py <age> <sex> <bmi> <children> <smoker> <region>
```

Example:

```
python predict.py 35 male 29.5 2 yes northwest
```

If no arguments are provided, the script will use example values.

## Results

The training script generates various visualizations:

- Correlation heatmap of numeric features
- Distribution of insurance charges
- Relationship between age/BMI and charges
- Learning curves for each model
- Model comparison based on MSE
- Actual vs. predicted charges for Linear Regression

The best-performing model is saved and can be used for future predictions.

## License

This project is licensed under the MIT License - see the LICENSE file for details.
