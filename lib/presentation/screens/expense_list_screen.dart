 import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../application/providers/expense_provider.dart';

class ExpenseListScreen extends StatelessWidget {
  const ExpenseListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense List'),
      ),
      body: expenseProvider.expenses.isEmpty
          ? const Center(child: Text('No expenses added yet.'))
          : ListView.builder(
              itemCount: expenseProvider.expenses.length,
              itemBuilder: (ctx, index) {
                final expense = expenseProvider.expenses[index];
                return ListTile(
                  title: Text(expense.title),
                  subtitle: Text(
                    '${expense.category} - ₹${expense.amount.toStringAsFixed(2)}',
                  ),
                  trailing: Text(
                    expense.date.toString(),
                    style: const TextStyle(fontSize: 12),
                  ),
                );
              },
            ),
    );
  }
}
