import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseRemoved,
  });

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;

  @override
  State<ExpensesList> createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  void _removeExpense(Expense expense) {
    setState(() {
      widget.expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${expense.title} removed.'),
        duration: const Duration(seconds: 3),
        action: SnackBarAction(
          label: 'UNDO',
          onPressed: () {
            setState(() {
              widget.expenses.insert(0, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.expenses.isEmpty) {
      return Center(
        child: Text(
          'No expenses found .Start adding some!',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: ListView.builder(
        itemCount: widget.expenses.length,
        itemBuilder: (context, index) {
          final expense = widget.expenses[index];
          return Dismissible(
            key: Key(expense.id),
            onDismissed: (direction) {
              // Remove the expense when dismissed
              _removeExpense(expense);
              widget.onExpenseRemoved(expense);
            },
            child: ExpenseItem(expense),
          );
        },
      ),
    );
  }
}
