import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';
import 'package:personal_expenses_managing_app/models/expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({super.key, required this.addNewExpense});
  final Function(Expense expense) addNewExpense;
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
    final invaliData = dataEntered == null || dataEntered <= 0;
    if (titleController.text.trim().isEmpty ||
        invaliData ||
        _pickedDate == null) {
      if (Platform.isIOS) {
        showCupertinoDialog(
          context: context,
          builder: (ctx) {
            return CupertinoAlertDialog(
              title: const Text('Invalid data entered'),
              content: const Text(
                  'Please make sure title, amount, category and date was entered'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Okay'),
                ),
              ],
            );
          },
        );
      } else {
        showDialog(
          context: context,
          builder: (ctx) {
            return AlertDialog(
              title: const Text('Invalid data entered'),
              content: const Text(
                  'Please make sure title, amount, category and date was entered'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(ctx),
                  child: const Text('Okay'),
                ),
              ],
            );
          },
        );
      }
      return;
    }

    widget.addNewExpense(Expense(
        amount: dataEntered,
        title: titleController.text,
        date: _pickedDate!,
        category: _selectedCategory));
    Navigator.pop(context);
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
    final screenSize = MediaQuery.of(context)
        .viewInsets
        .bottom; //viewInsets get screen coverance by different widgets from top, bottom, left or right
    return LayoutBuilder(builder: (ctx, constrainsts) {
      final width = constrainsts.maxWidth;
      return SizedBox(
        // new expense widget will get full height of the screen
        height: double.infinity,
        child: SingleChildScrollView(
          //it will make the screen scrollable
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 48, 20, screenSize + 16),
            child: Column(
              children: [
                if (width >=
                    600) // a special condition in lists where we dont addcurly braces and add a widget after if condition and then else condition
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: TextField(
                          //onChanged: _saveINputValue,
                          controller: titleController,
                          maxLength: 50,
                          decoration: const InputDecoration(
                            label: Expanded(child: Text('Title')),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 26,
                      ),
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
                    ],
                  )
                else
                  TextField(
                    //onChanged: _saveINputValue,
                    controller: titleController,
                    maxLength: 50,
                    decoration: const InputDecoration(
                      label: Expanded(child: Text('Title')),
                    ),
                  ),
                if (width >= 600)
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
                      ),
                      const SizedBox(
                        height: 24,
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
                  )
                else
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
                if (width >= 600)
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          // foregroundColor: Colors.black,
                          // backgroundColor: const Color.fromARGB(255, 248, 249, 250),
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
                          // foregroundColor: Colors.black,
                          // backgroundColor: const Color.fromARGB(255, 248, 249, 250),
                        ),
                        onPressed: saveNewExpense,
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
                else
                  Row(
                    children: [
                      const Spacer(),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          // foregroundColor: Colors.black,
                          // backgroundColor: const Color.fromARGB(255, 248, 249, 250),
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
                          // foregroundColor: Colors.black,
                          // backgroundColor: const Color.fromARGB(255, 248, 249, 250),
                        ),
                        onPressed: saveNewExpense,
                        child: const Text('Save Expense'),
                      ),
                    ],
                  )
                // Row(
                //   children: [
                //     Row(
                //       children: [
                //         DropdownButton(
                //           value: _selectedCategory,
                //           items: Category.values
                //               .map(
                //                 (category) => DropdownMenuItem(
                //                   value: category,
                //                   child: Text(category.name),
                //                 ),
                //               )
                //               .toList(),
                //           onChanged: (value) {
                //             if (value == null) {
                //               return;
                //             }
                //             setState(() {
                //               _selectedCategory = value;
                //             });
                //           },
                //         )
                //       ],
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ),
      );
    });
  }
}
