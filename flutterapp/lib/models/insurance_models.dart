import 'dart:convert';

class InsurancePrediction {
  final double predictedCost;
  final List<CostReduction> recommendations;

  InsurancePrediction({
    required this.predictedCost,
    required this.recommendations,
  });

  factory InsurancePrediction.fromJson(Map<String, dynamic> json) {
    return InsurancePrediction(
      predictedCost: json['predicted_cost'].toDouble(),
      recommendations: (json['recommendations'] as List)
          .map((e) => CostReduction.fromJson(e))
          .toList(),
    );
  }
}

class CostReduction {
  final String scenario;
  final double reducedCost;
  final double savings;
  final double savingsPercentage;
  final Map<String, dynamic>? context;

  CostReduction({
    required this.scenario,
    required this.reducedCost,
    required this.savings,
    required this.savingsPercentage,
    this.context,
  });

  factory CostReduction.fromJson(Map<String, dynamic> json) {
    return CostReduction(
      scenario: json['scenario'],
      reducedCost: json['reduced_cost'].toDouble(),
      savings: json['savings'].toDouble(),
      savingsPercentage: json['savings_percentage'].toDouble(),
      context: json['context'],
    );
  }
} 