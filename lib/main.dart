import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'application/providers/expense_provider.dart';
import 'presentation/screens/home_screen.dart';
import 'presentation/screens/add_expense_screen.dart';
import 'presentation/screens/settings_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ExpenseProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Personal Budget Tracker',
      theme: ThemeData(primarySwatch: Colors.blue),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/addExpense': (context) => const AddExpenseScreen(),
        '/settings': (context) => SettingsScreen(),
      },
    );
  }
}
