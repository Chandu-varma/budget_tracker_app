import 'package:flutter/material.dart';
import '../../domain/models/expense.dart';

class ExpenseCard extends StatelessWidget {
  final Expense expense;

  const ExpenseCard({super.key, required this.expense});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        title: Text(expense.title),
        subtitle: Text(
            'Category: ${expense.category}\nDate: ${expense.date.toLocal()}'),
        trailing: Text('₹${expense.amount.toStringAsFixed(2)}'),
      ),
    );
  }
}
