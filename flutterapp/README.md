# Insurance Cost Predictor

A Flutter application that predicts health insurance costs based on personal information using a machine learning model.

## Features

- User-friendly form to input personal details
- Real-time validation of input values
- Prediction of annual insurance cost
- Personalized recommendations to reduce insurance costs
- Detailed breakdown of potential savings
- Beautiful and responsive UI with Poppins font family

## API Integration

This app integrates with the Insurance Cost Prediction API at:

- https://linear-regression-model-2ez7.onrender.com

## Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK

### Installation

1. Clone this repository
2. Install the dependencies:
   ```
   flutter pub get
   ```
3. Run the app:
   ```
   flutter run
   ```

## Screenshots

- Form Screen: Input your personal details
- Results Screen: View your predicted insurance cost and recommendations

## Dependencies

- Flutter
- HTTP package for API requests
- Intl package for number formatting
- Google Fonts

## How It Works

1. Users enter their personal information (age, gender, BMI, etc.)
2. The app validates the input data
3. The data is sent to the prediction API
4. The API returns a prediction and recommendations
5. Results are displayed in a user-friendly format
