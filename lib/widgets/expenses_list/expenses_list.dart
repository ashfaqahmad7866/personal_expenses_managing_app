import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
import 'package:personal_expenses_managing_app/widgets/expenses_list/expenses_items.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses, required this.onRemoval});
  final List<Expense> expenses;
  final void Function(Expense expense) onRemoval;
  @override
  Widget build(context) {

    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        child: ExpensesItems(expense: expenses[index]),
        onDismissed: (direction) => onRemoval( expenses[index]), 
      ), 
    ); 
  } 
} 
