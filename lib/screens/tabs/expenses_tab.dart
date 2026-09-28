import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class ExpensesTab extends StatefulWidget {
  const ExpensesTab({super.key});

  @override
  State<ExpensesTab> createState() => _ExpensesTabState();
}

class _ExpensesTabState extends State<ExpensesTab> {
  final List<Map<String, dynamic>> _items = [
    {"name": "Supermarket Groceries", "amount": 64.20, "cat": "Food"},
    {"name": "Coffee Shop", "amount": 4.50, "cat": "Food"},
    {"name": "Metro Transit Card", "amount": 35.00, "cat": "Transport"},
    {"name": "Cloud Subscription", "amount": 12.99, "cat": "Bills"},
  ];

  void _add() {
    setState(() {
      _items.insert(0, {"name": "Quick Expense", "amount": 15.00, "cat": "General"});
    });
  }

  @override
  Widget build(BuildContext context) {
    double total = _items.fold(0.0, (acc, item) => acc + (item['amount'] as double));
    return Scaffold(
      appBar: AppBar(title: const Text('EasyBudget Tracker'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  const Text('Total Spent This Month', style: TextStyle(color: AppTheme.textSecondary)),
                  const SizedBox(height: 8),
                  Text('\$${total.toStringAsFixed(2)}', style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold, color: AppTheme.primary)),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          ..._items.map((it) => Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: CircleAvatar(backgroundColor: AppTheme.surface, child: const Icon(Icons.attach_money, color: AppTheme.primary)),
              title: Text(it['name'] as String, style: const TextStyle(fontWeight: FontWeight.bold)),
              subtitle: Text(it['cat'] as String),
              trailing: Text('-\$${(it['amount'] as double).toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.redAccent)),
            ),
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _add,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
