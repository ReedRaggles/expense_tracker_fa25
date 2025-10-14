import'package:expense_tracker_fa25/expenses_list/expenses_list.dart';
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
     builder: (ctx) => Text('Add Expense'),);
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
          ExpensesList(expenses: _registeredExpenses),
        ],
      ),
    );
  }
}
