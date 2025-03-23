# Insurance Cost Prediction API with User-Friendly Interface

This API provides an endpoint to predict medical insurance costs based on personal factors such as age, BMI, smoking status, etc., and offers personalized recommendations for cost reduction.

## Features

- FastAPI-based RESTful API
- **User-friendly HTML form interface** - No JSON required!
- Input data validation with Pydantic
- CORS middleware enabled for cross-origin requests
- Cost reduction recommendations based on lifestyle changes
- Powered by a trained Random Forest regression model

## Installation

1. Clone the repository
2. Install the required dependencies:

```bash
pip install -r requirements.txt
```

3. Ensure the `best_model.pkl` file is in the same directory as the API script or at `../summative/linear_regression/best_model.pkl`

## Running the API

```bash
uvicorn predict:app --host 0.0.0.0 --port 8000 --reload
```

Once running, you can access:

- **User-friendly HTML Form**: http://localhost:8000/
- API Documentation: http://localhost:8000/docs
- API Endpoint for programmatic access: http://localhost:8000/api/predict

## Using the HTML Form Interface

The main interface at `http://localhost:8000/` provides a clean, user-friendly HTML form with:

1. Proper input validation

   - Age must be between 18-100
   - BMI must be between 15-50
   - Children must be between 0-10

2. Dropdown menus for all categorical fields

   - Sex (male/female)
   - Smoking status (yes/no)
   - Region (northeast/northwest/southeast/southwest)

3. Instant results display with:
   - Predicted insurance cost
   - Cost reduction recommendations with savings calculated in dollars and percentages

Simply fill out the form, click "Predict Insurance Cost", and view your results instantly without dealing with any JSON!

## API Endpoints

### HTML Form Interface

```
GET /
```

Returns a user-friendly HTML form for insurance cost prediction.

### Form Submission

```
POST /predict_form
```

Accepts form data with the following fields:

| Field    | Type    | Description                  | Constraints                                           |
| -------- | ------- | ---------------------------- | ----------------------------------------------------- |
| age      | integer | Age of the insured person    | 18-100                                                |
| sex      | string  | Gender of the insured person | "male" or "female"                                    |
| bmi      | float   | Body Mass Index              | 15-50                                                 |
| children | integer | Number of dependent children | 0-10                                                  |
| smoker   | string  | Smoking status               | "yes" or "no"                                         |
| region   | string  | Residential region in the US | "northeast", "northwest", "southeast", or "southwest" |

### API Endpoint (for programmatic access)

```
POST /api/predict
```

Accepts JSON input with the same fields as the form endpoint.

Both endpoints return a JSON response:

```json
{
  "predicted_cost": 12345.67,
  "recommendations": [
    {
      "scenario": "Quitting smoking",
      "reduced_cost": 5678.9,
      "savings": 6666.77,
      "savings_percentage": 54.0
    },
    {
      "scenario": "Reducing BMI by 5% (from 27.5 to 26.1)",
      "reduced_cost": 11234.56,
      "savings": 1111.11,
      "savings_percentage": 9.0
    }
  ]
}
```

The recommendations section provides personalized advice on how to reduce insurance costs, including:

- The impact of quitting smoking
- The effect of reducing BMI (for those with BMI > 25)
- The combined effect of multiple lifestyle changes

## Example API Request

For programmatic access, you can use:

```bash
curl -X 'POST' \
  'http://localhost:8000/api/predict' \
  -H 'accept: application/json' \
  -H 'Content-Type: application/json' \
  -d '{
  "age": 35,
  "sex": "male",
  "bmi": 27.5,
  "children": 1,
  "smoker": "yes",
  "region": "northeast"
}'
```

## Deployment

This API can be deployed to various cloud platforms like Render, Heroku, or AWS. For detailed deployment instructions, refer to the documentation of your preferred platform.

For deployment on Render:

1. Create a new Web Service
2. Link your GitHub repository
3. Set the build command: `pip install -r requirements.txt`
4. Set the start command: `uvicorn predict:app --host 0.0.0.0 --port $PORT`
5. Add the environment variable: `PYTHON_VERSION=3.9.0`

Once deployed, you can access the user-friendly form at: `https://your-app-name.onrender.com/`
