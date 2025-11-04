import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expense_tracker_fa25/models/expense.dart';

final formatter = DateFormat.yMd();

class NewExpense extends StatefulWidget{
  const NewExpense({super.key, required this.onAddExpense});
final void Function(Expense expense) onAddExpense;
  State<NewExpense> createState() {
    return _NewExpenseState();
  }
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  Category _selectedCategory = Category.leisure;

  @override
  void dispose(){
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

void _submitExpenseData() {
  final enteredAmount = double.tryParse(_amountController.text);
  final amountIsInvalid 
}

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState((){
      _selectedDate = pickedDate;
    });
  }

@override
Widget build(BuildContext context) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Column(
      children: [
      TextField(
        controller: _titleController,
        maxLength: 50,
        keyboardType: TextInputType.name,
        decoration: InputDecoration(label: Text('Title')),
        ),
        Row(
          children: [
            Expanded(child: TextField(
          controller: _amountController,
          maxLength: 50,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            prefixText: '\$',
            label: Text("Amount")
            ),
        ),
            ),
            const SizedBox(width: 16),
            Expanded(
               child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _selectedDate == null
                ? 'Select A Date'
              : formatter.format(_selectedDate!),
              ),
              IconButton(
                onPressed: _presentDatePicker,
                icon: const Icon(Icons.calendar_month),
                ),
            ],
            ),
            ),
          ],
        ),
        Row(children: [
          DropdownButton(
            items: Category.values.map(
              (category) => DropDownMenuItem(
                child: Text(category.name.toString(),)
              )
            ).toList() 
          
          , onChanged: onChanged),
          Spacer(),
          ElevatedButton(onPressed: (){
            print(_titleController.text);
            print(_amountController.text);
            }, 
            child: Text('Save Expense'),
            ),
        ],
        ),
    ],
    ),
    );
}
}
