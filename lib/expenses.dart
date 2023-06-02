import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
import 'package:personal_expenses_managing_app/expenses_list.dart';
class Expenses extends StatefulWidget {
  const Expenses({super.key});
  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter',
        amount: 22.90,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'London',
        amount: 22.90,
        category: Category.travel,
        date: DateTime.now()),
    Expense(
        title: 'Flutter',
        amount: 22.90,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Pizza',
        amount: 22.90,
        category: Category.food,
        date: DateTime.now()),
    Expense(
        title: 'Busy',
        amount: 22.90,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Free',
        amount: 22.90,
        category: Category.leisure,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children:  [const Text('THe chart'),Expanded(child: ExpensesList(expenses: _registeredExpenses),) ],
      ),
    );
  }
}
