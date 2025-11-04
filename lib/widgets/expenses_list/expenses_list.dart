import'package:expense_tracker_fa25/models/expense.dart';
import 'package:flutter/material.dart';
import 'package:expense_tracker_fa25/widgets/expenses_list/expense_item.dart';

class ExpensesList extends StatelessWidget{
  const ExpensesList({super.key, required this.expenses, required this.onRemoveExpenses,});

  final Function onRemoveExpense;
  final List<Expense> expenses;
  @override
  Widget build(BuildContext context){
    return ListView.builder(
      itemCount: expenses.length,
      itemBuilder: (ctx, index) => Dismissible(
        key: ValueKey(expenses[index]),
        background:Container(
          // margin: EdgeInsets.symmetric9
          // horizontal: Theme.of(context).cardTheme.margin!.horizontal
          // ),
          color: Theme.of(context).colorScheme.error
        ),
        onDismissed: (direction) {
          onRemoveExpense(expenses[index]);
        }
        onDismissed:onRemoveExpenses(expenses[index]),
        child: ExpenseItem(expense: expenses[index])),
    );
  }
}