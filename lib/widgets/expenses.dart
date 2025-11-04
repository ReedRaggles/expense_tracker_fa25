import'package:expense_tracker_fa25/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_fa25/models/expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  State<Expenses> createState() {
    return _ExpensesState();
  }
}

class_ExpensesState extends State<Exorenses> {
  void _openAddExpenseOverlay() {
    showModalBottomSheet(context: context,
     builder: (ctx) => NewExpense(onAddExpense: _addExpense,));
  }

void _addExpense(Expense expense)
{
  setState((){
    _registeredExpenses.add(expense);
  });
}
void _removeExpense(Expense expense)
{
  setState((){
    _registeredExpenses.remove(expense);
  });
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(context: Text('Expense Deleted'),
    duration: Duration(seconds: 3),
    action: SnackBarAction(label: 'Undo', 
    onPressed: () {
      setState((){
        _registeredExpenses.insert(expenseIndex, expense);
      });
    }),
    ),
  )
}
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Cheeseburger',
      amount: 12.45,
      date: DateTime.now(),
      category: Category.food,
    ),
    Expense(
      title: 'Movie Ticket',
      amount: 18.99,
      date: DateTime.now(),
      category: Category.lesure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = const Center(
      child: Text("Click the + button to add an Expense!"),
      );

      if (_registeredExpenses.isNotEmpty) {
        maincontent = ExpensesList(
          expenses: _registeredExpenses,
          onRemoveExpense: _removeExpense,
        );
      }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Expense Tracker'),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay, 
            icon: const Icon(Icons.add))],
      ),
      body: Column(
        children: [
          Text("Chart"),
          Expanded(child: mainContent,),
        ],
      ),
    );
  }
}
