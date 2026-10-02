import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class BudgetTab extends StatelessWidget {
  const BudgetTab({super.key});

  @override
  Widget build(BuildContext context) {
    final budgets = [
      {'cat': 'Groceries & Dining', 'spent': '\$420', 'limit': '\$600', 'prog': 0.70},
      {'cat': 'Transport & Fuel', 'spent': '\$180', 'limit': '\$250', 'prog': 0.72},
      {'cat': 'Entertainment', 'spent': '\$95', 'limit': '\$200', 'prog': 0.47},
      {'cat': 'Utilities & Bills', 'spent': '\$310', 'limit': '\$350', 'prog': 0.88},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Monthly Budgets'), centerTitle: true),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: budgets.length,
        itemBuilder: (ctx, i) {
          final b = budgets[i];
          final prog = b['prog'] as double;
          return Card(
            margin: const EdgeInsets.only(bottom: 12),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(b['cat'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
                      Text('${b['spent']} / ${b['limit']}', style: const TextStyle(color: AppTheme.textSecondary)),
                    ],
                  ),
                  const SizedBox(height: 10),
                  LinearProgressIndicator(
                    value: prog,
                    backgroundColor: Colors.white12,
                    color: prog > 0.85 ? Colors.redAccent : AppTheme.primary,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
