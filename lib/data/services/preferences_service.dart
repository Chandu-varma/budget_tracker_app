import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  Future<void> saveMonthlyBudget(double budget) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('monthly_budget', budget);
  }

  Future<double> getMonthlyBudget() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getDouble('monthly_budget') ?? 0.0;
  }
}
