import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';

class ExpensesItems extends StatelessWidget {
  const ExpensesItems({super.key, required this.expense});
  
  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      color:const Color.fromARGB(255, 228, 225, 225),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            child: Text(expense.title),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text('\$${expense.amount.toString()}'),
              ),
              const Spacer(),
              Icon(categoryIcons[expense.category]),
              const SizedBox(
                width: 8,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Text(
                  expense.getFormatter,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
