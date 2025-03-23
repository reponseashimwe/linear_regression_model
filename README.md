# Medical Insurance Cost Prediction

## Project Overview

This project predicts medical insurance costs based on personal attributes using machine learning models. The system consists of three main components:

1. A data analysis and model training pipeline
2. A FastAPI backend deployment for predictions
3. A Flutter mobile application for user-friendly access

## Dataset

The dataset used is from Kaggle: [Medical Insurance Cost Prediction](https://www.kaggle.com/datasets/rahulvyasm/medical-insurance-cost-prediction).

Features include:

- Age: Age of the primary beneficiary
- Sex: Gender of the insurance contractor (female or male)
- BMI: Body Mass Index, a measure of body fat based on height and weight
- Children: Number of children/dependents covered by the insurance
- Smoker: Whether the beneficiary is a smoker (yes or no)
- Region: The beneficiary's residential area in the US (northeast, southeast, southwest, northwest)
- Charges: Individual medical costs billed by health insurance (target variable)

## Project Structure

```
.
├── api/                  # FastAPI backend
│   └── predict.py        # API endpoint definitions
├── flutterapp/           # Flutter mobile application
├── summative/            # Model training and analysis
│   └── linear_regression/
│       ├── multivariate.py        # Model training script
│       └── multivariate.ipynb     # Jupyter notebook version
├── requirements.txt      # Python dependencies
└── README.md
```

## Models Implemented

1. Linear Regression
2. Decision Tree
3. Random Forest

The models are compared based on Mean Squared Error (MSE) and R² score, and the best-performing model is saved for future predictions.

## Setup and Installation

### Backend (Python API)

1. Clone the repository:

```bash
git clone https://github.com/your-username/linear_regression_model.git
cd linear_regression_model
```

2. Create and activate a virtual environment:

```bash
# For Windows
python -m venv venv
venv\Scripts\activate

# For macOS/Linux
python3 -m venv venv
source venv/bin/activate
```

3. Install required dependencies:

```bash
pip install -r requirements.txt
```

### Flutter App

1. Make sure Flutter is installed on your system: [Flutter Installation Guide](https://docs.flutter.dev/get-started/install)

2. Navigate to the Flutter app directory and get dependencies:

```bash
cd flutterapp
flutter pub get
```

3. Run the app in debug mode:

```bash
flutter run
```

## Usage

### Training Models

To train all models and compare their performance:

```bash
python summative/linear_regression/multivariate.py
```

You can also explore the Colab notebook: [multivariate.ipynb](https://colab.research.google.com/github/reponseashimwe/linear_regression_model/blob/main/summative/linear_regression/multivariate.ipynb)

### Running the API Locally

```bash
cd api
uvicorn predict:app --reload
```

### Public API Endpoint

The API is publicly deployed at: [https://linear-regression-model-2ez7.onrender.com/docs](https://linear-regression-model-2ez7.onrender.com/docs)

You can test predictions using this cURL example:

```bash
curl -X 'GET' \
  'https://linear-regression-model-2ez7.onrender.com/predict?age=30&sex=male&bmi=28.5&children=2&smoker=yes&region=northeast' \
  -H 'accept: application/json'
```

## Mobile Application

The Flutter application provides a user-friendly interface to:

- Input personal details
- Get insurance cost predictions
- View cost-saving recommendations

### App Features:

- Clean, modern UI with Poppins font
- Form validation for inputs
- Results display with annual and monthly costs
- Recommendations for potential cost savings

## Demo

Watch a video demonstration of the project: [YouTube Demo](https://youtu.be/your-video-id)

## Resources

- GitHub Repository: [linear_regression_model](https://github.com/reponseashimwe/linear_regression_model)
- Kaggle Dataset: [Medical Insurance Cost Prediction](https://www.kaggle.com/datasets/rahulvyasm/medical-insurance-cost-prediction)
- API Documentation: [Swagger UI](https://linear-regression-model-2ez7.onrender.com/docs)
- Colab Notebook: [multivariate.ipynb](https://colab.research.google.com/github/reponseashimwe/linear_regression_model/blob/main/summative/linear_regression/multivariate.ipynb)

## License

This project is licensed under the MIT License.
