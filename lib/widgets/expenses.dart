import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/chart/chart.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
import 'package:personal_expenses_managing_app/widgets/expenses_list/expenses_list.dart';
import 'package:personal_expenses_managing_app/widgets/new_expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  void addExpenses(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void removeExpenses(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: const Text('Message deleted!'),
      duration: const Duration(seconds: 3),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          setState(() {
            _registeredExpenses.insert(expenseIndex, expense);
          });
        },
      ),
    ));
  }

  void _addNewExpense() {
    showModalBottomSheet(
        context: context,
        builder: (ctx) => NewExpense(addNewExpense: addExpenses),
        isScrollControlled: true);
  }

  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter',
        amount: 41.90,
        category: Category.work,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    Widget mainContent = const Center(
      child: Text('No expense found, try adding some!'),
    );
    if (_registeredExpenses.isNotEmpty) {
      mainContent = Expanded(
        child: ExpensesList(
            expenses: _registeredExpenses, onRemoval: removeExpenses),
      );
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter ExpenseTracker'),
        actions: [
          IconButton(
            onPressed: _addNewExpense,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: width < 600
          ? Column(
              children: [
                Chart(expenses: _registeredExpenses),
                mainContent,
              ],
            )
          : Row(
            children: [
              Expanded(child: Chart(expenses: _registeredExpenses),),
              Expanded(
                child: mainContent,
              )
            ],
          ),
    );
  }
}
