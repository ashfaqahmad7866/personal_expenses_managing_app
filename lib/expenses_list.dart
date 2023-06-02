import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
class ExpensesList extends StatelessWidget{
const ExpensesList({super.key,required this.expenses});
final List<Expense> expenses;
  @override
  Widget build(context)
  {
    return ListView.builder(itemCount: expenses.length,itemBuilder: (context, index) => Text(expenses[index].title),);
  }
}