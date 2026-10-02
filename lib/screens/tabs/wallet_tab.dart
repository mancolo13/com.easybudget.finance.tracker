import 'package:flutter/material.dart';
import '../../theme/app_theme.dart';

class WalletTab extends StatelessWidget {
  const WalletTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Accounts'), centerTitle: true),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: ListTile(
              leading: const Icon(Icons.account_balance_rounded, color: AppTheme.primary, size: 36),
              title: const Text('Checking Account'),
              subtitle: const Text('Primary spending account'),
              trailing: const Text('\$4,892.50', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
          const SizedBox(height: 12),
          Card(
            child: ListTile(
              leading: const Icon(Icons.savings_rounded, color: AppTheme.secondary, size: 36),
              title: const Text('Emergency Vault'),
              subtitle: const Text('High-yield savings'),
              trailing: const Text('\$12,450.00', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
