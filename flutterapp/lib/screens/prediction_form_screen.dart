import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../services/insurance_service.dart';
import '../theme/app_theme.dart';
import 'results_screen.dart';

class PredictionFormScreen extends StatefulWidget {
  const PredictionFormScreen({super.key});

  @override
  State<PredictionFormScreen> createState() => _PredictionFormScreenState();
}

class _PredictionFormScreenState extends State<PredictionFormScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;

  // Form controllers with default values
  final TextEditingController _ageController = TextEditingController(text: "30");
  final TextEditingController _bmiController = TextEditingController(text: "24.5");

  // Selected values with defaults
  String _selectedSex = 'female';
  String _selectedSmoker = 'no';
  String _selectedRegion = 'northeast';
  int _selectedChildren = 0;

  // Options for dropdowns
  final List<String> _sexOptions = ['male', 'female'];
  final List<String> _smokerOptions = ['yes', 'no'];
  final List<String> _regionOptions = ['northeast', 'northwest', 'southeast', 'southwest'];
  final List<int> _childrenOptions = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

  @override
  void dispose() {
    _ageController.dispose();
    _bmiController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        final insuranceService = InsuranceService();
        final prediction = await insuranceService.getPrediction(
          age: int.parse(_ageController.text),
          sex: _selectedSex,
          bmi: double.parse(_bmiController.text),
          children: _selectedChildren,
          smoker: _selectedSmoker,
          region: _selectedRegion,
        );

        if (mounted) {
          setState(() {
            _isLoading = false;
          });

          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultsScreen(prediction: prediction),
            ),
          );
        }
      } catch (e) {
        setState(() {
          _isLoading = false;
        });
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${e.toString()}'),
            backgroundColor: AppTheme.errorColor,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            margin: const EdgeInsets.all(16),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _isLoading
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: AppTheme.primaryColor,
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Calculating your prediction...',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
            )
          : SafeArea(
              child: Column(
                children: [
                  // Simple header
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 30),
                    child: Column(
                      children: [
                        // Title
                        const Text(
                          'Health Insurance Calculator',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: AppTheme.textPrimaryColor,
                          ),
                        ),
                        
                        const SizedBox(height: 8),
                        
                        // Subtitle
                        const Text(
                          'Enter your details to estimate your insurance cost',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppTheme.textSecondaryColor,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  
                  // Form content - scrollable
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Form(
                          key: _formKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Age Field
                              TextFormField(
                                controller: _ageController,
                                decoration: InputDecoration(
                                  labelText: 'Age',
                                  hintText: 'Enter your age (18-100)',
                                  prefixIcon: const Icon(Icons.cake),
                                ),
                                keyboardType: TextInputType.number,
                                inputFormatters: [
                                  FilteringTextInputFormatter.digitsOnly,
                                  LengthLimitingTextInputFormatter(3),
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your age';
                                  }
                                  int? age = int.tryParse(value);
                                  if (age == null) {
                                    return 'Please enter a valid age';
                                  }
                                  if (age < 18 || age > 100) {
                                    return 'Age must be between 18 and 100';
                                  }
                                  return null;
                                },
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Gender Dropdown
                              DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Gender',
                                  prefixIcon: Icon(Icons.people),
                                ),
                                value: _selectedSex,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                items: _sexOptions.map((String sex) {
                                  return DropdownMenuItem<String>(
                                    value: sex,
                                    child: Text(
                                      sex.substring(0, 1).toUpperCase() + sex.substring(1),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _selectedSex = newValue;
                                    });
                                  }
                                },
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // BMI Field
                              TextFormField(
                                controller: _bmiController,
                                decoration: InputDecoration(
                                  labelText: 'BMI (Body Mass Index)',
                                  hintText: 'Enter your BMI (15-50)',
                                  prefixIcon: const Icon(Icons.fitness_center),
                                  suffixIcon: Tooltip(
                                    message: 'Body Mass Index is a measure of body fat based on height and weight',
                                    child: Icon(
                                      Icons.info_outline,
                                      color: AppTheme.textSecondaryColor,
                                    ),
                                  ),
                                ),
                                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                                inputFormatters: [
                                  FilteringTextInputFormatter.allow(RegExp(r'^\d*\.?\d{0,2}')),
                                  LengthLimitingTextInputFormatter(5),
                                ],
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your BMI';
                                  }
                                  double? bmi = double.tryParse(value);
                                  if (bmi == null) {
                                    return 'Please enter a valid BMI';
                                  }
                                  if (bmi < 15 || bmi > 50) {
                                    return 'BMI must be between 15 and 50';
                                  }
                                  return null;
                                },
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Children Dropdown
                              DropdownButtonFormField<int>(
                                decoration: const InputDecoration(
                                  labelText: 'Number of Children',
                                  prefixIcon: Icon(Icons.child_care),
                                ),
                                value: _selectedChildren,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                items: _childrenOptions.map((int count) {
                                  return DropdownMenuItem<int>(
                                    value: count,
                                    child: Text(count.toString()),
                                  );
                                }).toList(),
                                onChanged: (int? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _selectedChildren = newValue;
                                    });
                                  }
                                },
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Smoker Dropdown
                              DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Smoker',
                                  prefixIcon: Icon(Icons.smoke_free),
                                ),
                                value: _selectedSmoker,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                items: _smokerOptions.map((String smoker) {
                                  return DropdownMenuItem<String>(
                                    value: smoker,
                                    child: Text(
                                      smoker.substring(0, 1).toUpperCase() + smoker.substring(1),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _selectedSmoker = newValue;
                                    });
                                  }
                                },
                              ),
                              
                              const SizedBox(height: 16),
                              
                              // Region Dropdown
                              DropdownButtonFormField<String>(
                                decoration: const InputDecoration(
                                  labelText: 'Region',
                                  prefixIcon: Icon(Icons.place),
                                ),
                                value: _selectedRegion,
                                isExpanded: true,
                                borderRadius: BorderRadius.circular(10),
                                items: _regionOptions.map((String region) {
                                  return DropdownMenuItem<String>(
                                    value: region,
                                    child: Text(
                                      region.substring(0, 1).toUpperCase() + region.substring(1),
                                    ),
                                  );
                                }).toList(),
                                onChanged: (String? newValue) {
                                  if (newValue != null) {
                                    setState(() {
                                      _selectedRegion = newValue;
                                    });
                                  }
                                },
                              ),
                              
                              const SizedBox(height: 32),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Submit button fixed at bottom
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ElevatedButton(
                      onPressed: _submitForm,
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        minimumSize: const Size(double.infinity, 56),
                      ),
                      child: const Text('Calculate My Insurance Cost'),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
} 