import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/insurance_models.dart';

class InsuranceService {
  static const String baseUrl = 'https://linear-regression-model-2ez7.onrender.com';

  Future<InsurancePrediction> getPrediction({
    required int age,
    required String sex,
    required double bmi,
    required int children,
    required String smoker,
    required String region,
  }) async {
    final queryParams = {
      'age': age.toString(),
      'sex': sex,
      'bmi': bmi.toString(),
      'children': children.toString(),
      'smoker': smoker,
      'region': region,
    };

    final uri = Uri.parse('$baseUrl/predict').replace(queryParameters: queryParams);

    try {
      final response = await http.get(uri);
      
      if (response.statusCode == 200) {
        return InsurancePrediction.fromJson(json.decode(response.body));
      } else {
        throw Exception('Failed to load prediction: ${response.statusCode} - ${response.body}');
      }
    } catch (e) {
      throw Exception('Network error: $e');
    }
  }
} 