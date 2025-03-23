import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/insurance_models.dart';
import '../theme/app_theme.dart';

class ResultsScreen extends StatelessWidget {
  final InsurancePrediction prediction;
  final currencyFormatter = NumberFormat.currency(symbol: '\$');

  ResultsScreen({super.key, required this.prediction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Your Results'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: Column(
        children: [
          // Annual cost section
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              children: [
                const Text(
                  'Annual Insurance Cost',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textSecondaryColor,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  currencyFormatter.format(prediction.predictedCost),
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Monthly: ',
                      style: TextStyle(
                        color: AppTheme.textSecondaryColor,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      currencyFormatter.format(prediction.predictedCost / 12),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Divider
          const Divider(),
          
          // Show "How to Save Money" section only if there are recommendations
          if (prediction.recommendations.isNotEmpty) Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 24.0, bottom: 16.0),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.lightbulb,
                            color: AppTheme.primaryColor,
                            size: 20,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'How to Save Money',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    
                    // Recommendations cards
                    ...prediction.recommendations.map((recommendation) => 
                      _buildRecommendationCard(context, recommendation)
                    ).toList(),
                    
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
          
          // Empty space if no recommendations
          if (prediction.recommendations.isEmpty) Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 64,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Your insurance cost is optimal',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: AppTheme.textPrimaryColor,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'We don\'t have any recommendations for reducing your costs at this time.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: AppTheme.textSecondaryColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Calculate Another Estimate'),
          ),
        ),
      ),
    );
  }

  Widget _buildRecommendationCard(BuildContext context, CostReduction recommendation) {
    final savingsPercentage = recommendation.savingsPercentage;
    
    // Determine impact based on savings percentage
    String impact;
    Color impactColor;
    
    if (savingsPercentage > 70) {
      impact = 'Huge Impact';
      impactColor = AppTheme.secondaryColor;
    } else if (savingsPercentage > 30) {
      impact = 'Significant Impact';
      impactColor = Colors.orange;
    } else {
      impact = 'Moderate Impact';
      impactColor = AppTheme.primaryColor;
    }
    
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade200),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: recommendation.scenario.toLowerCase().contains('smoking') 
                  ? AppTheme.secondaryColor
                  : AppTheme.primaryColor,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(9),
                topRight: Radius.circular(9),
              ),
            ),
            child: Row(
              children: [
                Icon(
                  recommendation.scenario.toLowerCase().contains('smoking')
                      ? Icons.smoke_free
                      : Icons.trending_down,
                  color: Colors.white,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    recommendation.scenario,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Text(
                        '${savingsPercentage.toStringAsFixed(1)}%',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: recommendation.scenario.toLowerCase().contains('smoking')
                              ? AppTheme.secondaryColor
                              : AppTheme.primaryColor,
                        ),
                      ),
                      Icon(
                        Icons.arrow_downward,
                        size: 12,
                        color: recommendation.scenario.toLowerCase().contains('smoking')
                            ? AppTheme.secondaryColor
                            : AppTheme.primaryColor,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          // Impact badge
          Align(
            alignment: Alignment.centerRight,
            child: Container(
              margin: const EdgeInsets.only(top: 12, right: 16),
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: impactColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: impactColor.withOpacity(0.3),
                ),
              ),
              child: Text(
                impact,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: impactColor,
                ),
              ),
            ),
          ),
          
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cost comparison
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.account_balance_wallet,
                                size: 16,
                                color: AppTheme.textSecondaryColor,
                              ),
                              const SizedBox(width: 8),
                              const Text(
                                'New Cost',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.textSecondaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            currencyFormatter.format(recommendation.reducedCost),
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: AppTheme.textPrimaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.savings,
                                size: 16,
                                color: recommendation.scenario.toLowerCase().contains('smoking')
                                    ? AppTheme.secondaryColor
                                    : AppTheme.primaryColor,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'You Save',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: recommendation.scenario.toLowerCase().contains('smoking')
                                      ? AppTheme.secondaryColor
                                      : AppTheme.primaryColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 4),
                          Text(
                            currencyFormatter.format(recommendation.savings),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: recommendation.scenario.toLowerCase().contains('smoking')
                                  ? AppTheme.secondaryColor
                                  : AppTheme.primaryColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                
                // Context information
                if (recommendation.context != null) ...[
                  const Divider(height: 32),
                  
                  // Why This Matters section
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 16,
                        color: recommendation.scenario.toLowerCase().contains('smoking')
                            ? AppTheme.secondaryColor
                            : AppTheme.primaryColor,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Why This Matters',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: recommendation.scenario.toLowerCase().contains('smoking')
                                    ? AppTheme.secondaryColor
                                    : AppTheme.primaryColor,
                              ),
                            ),
                            const SizedBox(height: 6),
                            Text(
                              recommendation.context!['note'] as String,
                              style: const TextStyle(
                                fontSize: 14,
                                color: AppTheme.textPrimaryColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Health Benefits section
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: recommendation.scenario.toLowerCase().contains('smoking')
                          ? AppTheme.secondaryColor.withOpacity(0.05)
                          : AppTheme.primaryColor.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(
                          Icons.favorite,
                          size: 16,
                          color: recommendation.scenario.toLowerCase().contains('smoking')
                              ? AppTheme.secondaryColor
                              : AppTheme.primaryColor,
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Health Benefits',
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: recommendation.scenario.toLowerCase().contains('smoking')
                                      ? AppTheme.secondaryColor
                                      : AppTheme.primaryColor,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                recommendation.context!['health_impact'] as String,
                                style: const TextStyle(
                                  fontSize: 14,
                                  color: AppTheme.textPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
} 