import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
import 'package:personal_expenses_managing_app/widgets/expenses_list/expenses_items.dart';
class ExpensesList extends StatelessWidget{
const ExpensesList({super.key,required this.expenses});
final List<Expense> expenses;
  @override
  Widget build(context)
  {
    return ListView.builder(itemCount: expenses.length,itemBuilder: (context, index) =>ExpensesItems(expense: expenses[index]) );
  }
}