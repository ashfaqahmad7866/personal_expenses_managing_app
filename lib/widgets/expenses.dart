import 'package:flutter/material.dart';
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
  void addExpenses(Expense expense)
  {
setState(() {
  _registeredExpenses.add(expense);
});
  }
  void removeExpenses(Expense expense)
  {
    setState(() {
       _registeredExpenses.remove(expense);
    });
    
  }
  void _addNewExpense()
  {
    showModalBottomSheet(context: context, builder: (ctx) => NewExpense(addNewExpense: addExpenses), isScrollControlled: true);
  }
  
  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter',
        amount: 41.90,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'London',
        amount: 15.90,
        category: Category.travel,
        date: DateTime.now()),
    Expense(
        title: 'Flutter',
        amount: 90.90,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Pizza',
        amount: 12.51,
        category: Category.food,
        date: DateTime.now()),
    Expense(
        title: 'Busy',
        amount: 21.10,
        category: Category.work,
        date: DateTime.now()),
    Expense(
        title: 'Free',
        amount: 25.90,
        category: Category.leisure,
        date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('Flutter ExpenseTracker'),
        actions: [IconButton(onPressed:_addNewExpense, icon:const Icon(Icons.add),
      ),
      ],
      ),
      body: Column(
        children:  [const Text('THe chart'),Expanded(child: ExpensesList(expenses: _registeredExpenses,onRemoval: removeExpenses),) ],
      ),
    );
  }
}
