import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:intl/intl.dart';
enum Category{food,leisure,travel,work}//enum allows us to create custom data type of specific values
const uuid= Uuid();
final formatter=DateFormat.yMd();
const categoryIcons={ 
  Category.food:Icons.lunch_dining,
  Category.travel:Icons.flight_takeoff,
  Category.work:Icons.work,
  Category.leisure:Icons.movie_creation
};
class Expense{
  Expense({required this.amount,required this.title,required this.date, required this.category}):id=uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
  String get getFormatter
  {
    return formatter.format(date);
  }
}
class ExpenseBucket{
  const ExpenseBucket({required this.category, required this.expenses});
  final Category category;
  final List<Expense> expenses;
  double get totalExpenses{
    double sum=0;
    for(final expense in expenses)
    {
      sum+=expense.amount;
    }
    return sum;
  }
  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
  :expenses=allExpenses.where((expense) =>expense.category==category ).toList();
}
