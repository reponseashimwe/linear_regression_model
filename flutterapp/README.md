# Health Insurance Cost Predictor

A Flutter mobile application that predicts health insurance costs based on personal information. This app serves as the front-end component of a complete machine learning project that includes data analysis, model training, and API deployment.

## Features

- Clean, minimalist UI with green color scheme and Poppins font
- User-friendly form with input validation
- Prediction of annual and monthly insurance costs
- Personalized recommendations to reduce insurance costs
- Detailed breakdown of potential savings with percentages
- Responsive design for various screen sizes

## App Structure

```
lib/
├── main.dart                  # App entry point and splash screen
├── models/                    # Data models
│   ├── insurance_prediction.dart  # Model for prediction results
│   └── cost_reduction.dart       # Model for recommendations
├── screens/                   # App screens
│   ├── prediction_form_screen.dart  # Form for user inputs
│   └── results_screen.dart       # Display prediction results
├── services/                  # API services
│   └── prediction_service.dart    # Handles API communication
└── theme/                     # App theming
    └── app_theme.dart           # Colors, text styles, and themes
```

## API Integration

This app integrates with the Insurance Cost Prediction API at:

- https://linear-regression-model-2ez7.onrender.com

The API provides:

- Insurance cost predictions based on personal attributes
- Personalized recommendations for cost reduction
- Context information for each recommendation

## Getting Started

### Prerequisites

- Flutter SDK (2.0.0 or higher)
- Dart SDK (2.12.0 or higher)
- An IDE (Visual Studio Code, Android Studio, or IntelliJ IDEA)

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/reponseashimwe/linear_regression_model.git
   cd linear_regression_model/flutterapp
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Run the app:
   ```bash
   flutter run
   ```

### Building for Production

To create a release build:

#### Android

```bash
flutter build apk --release
# The APK will be at build/app/outputs/flutter-apk/app-release.apk
```

#### iOS

```bash
flutter build ios --release
# Then use Xcode to distribute the app
```

## Usage

1. Launch the app and wait for the splash screen to transition to the form
2. Fill in the required fields:
   - Age (18-100)
   - Gender (Male/Female)
   - BMI (Body Mass Index)
   - Number of children
   - Smoking status (Yes/No)
   - Region (Northeast, Northwest, Southeast, Southwest)
3. Tap "Calculate" to submit the form
4. View the results screen with:
   - Estimated annual insurance cost
   - Monthly cost breakdown
   - Personalized recommendations for reducing costs
   - Potential savings for each recommendation
5. Tap "Calculate Again" to return to the form and make changes

## Dependencies

- `flutter`: The UI framework
- `http`: For API communication
- `intl`: For currency and number formatting
- Custom fonts: Poppins (Regular, Medium, Bold, Light)

## Part of a Larger Project

This Flutter app is part of a comprehensive project that includes:

1. Data analysis and model training (Python, scikit-learn)
2. API development (FastAPI)
3. Mobile app development (Flutter)

For more information, see the [main project README](https://github.com/reponseashimwe/linear_regression_model).
