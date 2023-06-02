import 'package:uuid/uuid.dart';
enum Category{food,leisure,travel,work}//enum allows us to create custom data type of specific values
const uuid= Uuid();
class Expense{
  Expense({required this.amount,required this.title,required this.date, required this.category}):id=uuid.v4();
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;
}