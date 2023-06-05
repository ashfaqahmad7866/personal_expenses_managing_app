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
  DateTime? _pickedDate;
  Category _selectedCategory = Category.leisure;
  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      _pickedDate = selectedDate;
    });
  }

  void saveNewExpense() {
    final amountValue = amountController.text;
    final dataEntered = double.tryParse(amountValue);
    final invaliData=dataEntered==null ||dataEntered<=0;
    if (titleController.text.trim().isEmpty||invaliData) {
      showDialog(
        context: context,
        builder: (ctx) { return
          AlertDialog(
            title: const Text('Invalid data entered'),
            content: const Text(
                'Please make sure title, amount, category and date was entered'),
            actions: [
              TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Okay'))
            ],
          );
        },
       
      );
   return;
    }
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
                  Text(_pickedDate == null
                      ? 'No date selected'
                      : formatter.format(_pickedDate!)),
                  IconButton(
                    onPressed: _presentDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Row(
                children: [
                  DropdownButton(
                    value: _selectedCategory,
                    items: Category.values
                        .map(
                          (category) => DropdownMenuItem(
                            value: category,
                            child: Text(category.name),
                          ),
                        )
                        .toList(),
                    onChanged: (value) {
                      if (value == null) {
                        return;
                      }
                      setState(() {
                        _selectedCategory = value;
                      });
                    },
                  )
                ],
              ),
              const Spacer(),
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
                onPressed: saveNewExpense,
                child: const Text('Save Expense'),
              ),
            ],
          )
        ],
      ),
    );
  }
}
