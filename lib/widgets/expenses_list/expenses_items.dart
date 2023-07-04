import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';

class ExpensesItems extends StatelessWidget {
  const ExpensesItems({super.key, required this.expense});

  final Expense expense;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Text(
            expense.title,
            style: Theme.of(context).textTheme.titleLarge,
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
