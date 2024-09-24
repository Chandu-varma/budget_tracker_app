import '../services/database_service.dart';
import '../../domain/models/expense.dart';

class ExpenseRepository {
  Future<void> insertExpense(Expense expense) async {
    final db = await DatabaseService.instance.database;
    await db.insert('expenses', expense.toMap());
  }

  Future<List<Expense>> getExpenses() async {
    final db = await DatabaseService.instance.database;
    final result = await db.query('expenses');
    return result.map((expense) => Expense.fromMap(expense)).toList();
  }
}
