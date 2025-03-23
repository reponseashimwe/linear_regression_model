# Insurance Cost Prediction API

This API provides predictions for medical insurance costs based on personal factors like age, BMI, and smoking status. It also offers personalized recommendations for cost reduction.

## Part of a Larger Project

This API serves as the backend for:

1. A data science project analyzing factors affecting insurance costs
2. A Flutter mobile application providing a user-friendly interface

For the complete project, visit the [main repository](https://github.com/reponseashimwe/linear_regression_model).

## Features

- FastAPI-based RESTful API
- Input data validation with Pydantic
- CORS middleware enabled for cross-origin requests
- Cost reduction recommendations based on lifestyle changes
- Powered by a trained regression model

## Public API Endpoint

The API is deployed at: [https://linear-regression-model-2ez7.onrender.com/](https://linear-regression-model-2ez7.onrender.com/)

- Interactive API documentation: [https://linear-regression-model-2ez7.onrender.com/docs](https://linear-regression-model-2ez7.onrender.com/docs)

## Local Installation

1. Create and activate a virtual environment:

```bash
# For Windows
python -m venv venv
venv\Scripts\activate

# For macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

2. Install the required dependencies:

```bash
pip install -r requirements.txt
```

3. Ensure the `best_model.pkl` file is in the same directory as the API script or at `../summative/linear_regression/best_model.pkl`

## Running the API Locally

```bash
uvicorn predict:app --host 0.0.0.0 --port 8000 --reload
```

Once running, you can access:

- API Documentation: http://localhost:8000/docs

## API Endpoints

### Health Check

```
GET /
```

Returns a welcome message and links to documentation.

### Predict Insurance Cost

```
GET /predict
```

Accepts query parameters with the following fields:

| Field    | Type    | Description                  | Constraints                                           |
| -------- | ------- | ---------------------------- | ----------------------------------------------------- |
| age      | integer | Age of the insured person    | 18-100                                                |
| sex      | string  | Gender of the insured person | "male" or "female"                                    |
| bmi      | float   | Body Mass Index              | 15-50                                                 |
| children | integer | Number of dependent children | 0-10                                                  |
| smoker   | string  | Smoking status               | "yes" or "no"                                         |
| region   | string  | Residential region in the US | "northeast", "northwest", "southeast", or "southwest" |

### Response Format

The API returns a JSON response:

```json
{
  "predicted_cost": 12345.67,
  "recommendations": [
    {
      "scenario": "Quitting smoking",
      "reduced_cost": 5678.9,
      "savings": 6666.77,
      "savings_percentage": 54.0,
      "context": {
        "average_smoker_cost": 14956.0,
        "average_non_smoker_cost": 2100.0,
        "note": "Based on industry data, smokers typically pay 3-7 times more for health insurance than non-smokers with similar demographic profiles.",
        "health_impact": "Beyond insurance savings, quitting smoking reduces risk of heart disease by 50% after one year and lung cancer risk by 50% after 10 years."
      }
    },
    {
      "scenario": "Reducing BMI by 5% (from 27.5 to 26.1)",
      "reduced_cost": 11234.56,
      "savings": 1111.11,
      "savings_percentage": 9.0,
      "context": {
        "average_current_bmi_cost": 12345.67,
        "average_healthy_bmi_cost": 9876.54,
        "note": "A BMI between 18.5 and 24.9 is considered healthy. Even small reductions can improve health outcomes and reduce insurance costs.",
        "health_impact": "A 5-10% reduction in weight can significantly reduce risks of diabetes, heart disease, and joint problems."
      }
    }
  ]
}
```

## Example API Requests

Using cURL:

```bash
curl -X 'GET' \
  'https://linear-regression-model-2ez7.onrender.com/predict?age=30&sex=male&bmi=28.5&children=2&smoker=yes&region=northeast' \
  -H 'accept: application/json'
```

Using Python requests:

```python
import requests

params = {
    "age": 30,
    "sex": "male",
    "bmi": 28.5,
    "children": 2,
    "smoker": "yes",
    "region": "northeast"
}

response = requests.get(
    "https://linear-regression-model-2ez7.onrender.com/predict",
    params=params
)

print(response.json())
```

## Integration with Mobile App

This API serves as the backend for a Flutter mobile application that provides a user-friendly interface for insurance cost prediction. The mobile app communicates with this API to:

1. Send user input data
2. Receive and display predictions
3. Show personalized recommendations

For details on the mobile app, see the main project README.
