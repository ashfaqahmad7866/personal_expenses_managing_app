// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
class NewExpense extends StatefulWidget {
  const NewExpense({super.key});
  @override
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  // var enteredValue='';
  final titleController = TextEditingController();
  final amountController = TextEditingController();
    DateTime ? _pickedDate;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
  final selectedDate= await showDatePicker (
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
        setState(() {
        _pickedDate = selectedDate;
        });
  }
  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    amountController.dispose();
  }

  // void _saveINputValue(String add)
  // {
  //    enteredValue=add;
  // }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            //onChanged: _saveINputValue,
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Expanded(child: Text('Title')),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    prefixText: '\$ ',
                    label: Text('Amount'),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    Text(_pickedDate==null? 'No date selected':formatter.format(_pickedDate!)),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ))
            ],
          ),
          Row(
            children: [
              TextButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: Colors.white,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Cancel'),
              ),
              const SizedBox(
                width: 10,
              ),
              //  const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40)),
                    foregroundColor: Colors.black,
                    backgroundColor: const Color.fromARGB(255, 248, 249, 250)),
                onPressed: () {
                  // print(enteredValue);
                  print(titleController.text + ' ' + amountController.text);
                },
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
