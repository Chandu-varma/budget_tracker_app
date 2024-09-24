import 'package:flutter/material.dart';
import '../../domain/models/expense.dart';
import '../../data/repository/expense_repository.dart';
import '../../data/services/preferences_service.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];
  double _monthlyBudget = 0.0;
  double _remainingBalance = 0.0;

  List<Expense> get expenses => _expenses;
  double get monthlyBudget => _monthlyBudget;
  double get remainingBalance => _remainingBalance;

  // Load expenses and calculate the remaining balance
  Future<void> loadExpenses() async {
    _expenses = await ExpenseRepository().getExpenses();
    _monthlyBudget = await PreferencesService().getMonthlyBudget();

    // Calculate the total expenses
    double totalExpenses =
        _expenses.fold(0.0, (sum, item) => sum + item.amount);
    _remainingBalance = _monthlyBudget - totalExpenses;

    notifyListeners();
  }

  // Add a new expense and calculate remaining balance
  Future<void> addExpense(Expense expense) async {
    await ExpenseRepository().insertExpense(expense);
    _expenses.add(expense);

    // calculate remaining balance
    double totalExpenses =
        _expenses.fold(0.0, (sum, item) => sum + item.amount);
    _remainingBalance = _monthlyBudget - totalExpenses;

    notifyListeners();
  }

  // Update the monthly budget and calculate remaining balance
  Future<void> updateBudget(double newBudget) async {
    _monthlyBudget = newBudget;
    await PreferencesService().saveMonthlyBudget(newBudget);

    double totalExpenses =
        _expenses.fold(0.0, (sum, item) => sum + item.amount);
    _remainingBalance = _monthlyBudget - totalExpenses;

    notifyListeners();
  }
}
