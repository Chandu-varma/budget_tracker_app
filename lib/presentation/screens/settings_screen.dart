 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/expense_provider.dart';

class SettingsScreen extends StatelessWidget {
  final _budgetController = TextEditingController();

  SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set Monthly Budget'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _budgetController,
              keyboardType: TextInputType.number,
              decoration:
                  const InputDecoration(labelText: 'Enter Monthly Budget'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final budget = double.tryParse(_budgetController.text) ?? 0.0;
                Provider.of<ExpenseProvider>(context, listen: false)
                    .updateBudget(budget);
                Navigator.pop(context);
              },
              child: const Text('Save Budget'),
            ),
          ],
        ),
      ),
    );
  }
}
