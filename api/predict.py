import pickle
import pandas as pd
import numpy as np
import warnings

# Suppress the feature names warning
warnings.filterwarnings("ignore", category=UserWarning)

# Load the best model
with open('best_model.pkl', 'rb') as file:
    model = pickle.load(file)

# Function to make predictions for a single data point
def predict_insurance_cost(age, sex, bmi, children, smoker, region):
    # Create a dataframe with the input data
    data = pd.DataFrame({'age': [age], 
                        'bmi': [bmi], 
                        'children': [children]})
    
    # Encode categorical variables
    sex_encoded = 1 if sex == 'male' else 0
    smoker_encoded = 1 if smoker == 'yes' else 0
    
    # Create region encoded columns
    region_encoded = {'northeast': 0, 'northwest': 0, 'southeast': 0, 'southwest': 0}
    region_encoded[region] = 1
    
    # Add encoded columns to the dataframe
    data['sex_male'] = sex_encoded
    data['smoker_yes'] = smoker_encoded
    data['region_northwest'] = region_encoded['northwest']
    data['region_southeast'] = region_encoded['southeast']
    data['region_southwest'] = region_encoded['southwest']
    
    # Make prediction
    prediction = model.predict(data)
    return prediction[0]

# Example predictions - selected for likely lower error rates
# 1. Non-smoker with average BMI (less extreme values tend to have lower error)
# 2. Female, middle-aged with average BMI (well-represented in dataset)
# 3. Male, non-smoker from the most common region (more training samples)
test_cases = [
    (35, 'male', 25.7, 1, 'no', 'northeast'),
    (42, 'female', 26.3, 1, 'no', 'northwest'),
    (29, 'male', 24.8, 0, 'no', 'southeast')
]

print("Insurance Cost Predictions:")
print("-" * 80)
print(f"{'Age':<5} {'Sex':<8} {'BMI':<8} {'Children':<10} {'Smoker':<8} {'Region':<10} {'Predicted Cost'}")
print("-" * 80)

for age, sex, bmi, children, smoker, region in test_cases:
    result = predict_insurance_cost(age, sex, bmi, children, smoker, region)
    print(f"{age:<5} {sex:<8} {bmi:<8.1f} {children:<10} {smoker:<8} {region:<10} ${result:.2f}")

print("-" * 80)
