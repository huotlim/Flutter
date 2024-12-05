import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();
  Category _selectedValue = Category.food;
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void _onCancel() {
    Navigator.pop(context);
  }

  Future<void> _showErrorDialog(String title, String message) async {
    await showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          content: Text(
            message,
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              style: TextButton.styleFrom(
                foregroundColor: Theme.of(context).primaryColor,
              ),
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  void _onAdd() {
    final String title = _titleController.text.trim();
    final double? amount = double.tryParse(_valueController.text.trim());

    if (title.isEmpty) {
      _showErrorDialog('Invalid Title', 'Title must not be empty!');
      return;
    }

    if (amount == null || amount <= 0) {
      _showErrorDialog('Invalid Amount', 'Amount must be a positive number!');
      return;
    }

    if (_selectedDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date!')),
      );
      return;
    }

    final Expense expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedValue,
    );

    widget.onCreated(expense);
    Navigator.pop(context);
  }

  Future<void> _pickDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title Input
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              labelText: 'Title',
              counterText: '',
            ),
          ),
          const SizedBox(height: 10),
          // Amount Input
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: _valueController,
            decoration: const InputDecoration(
              prefixText: '\$ ',
              labelText: 'Amount',
            ),
          ),
          const SizedBox(height: 10),
          // Date Picker
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  _selectedDate != null
                      ? DateFormat('yyyy-MM-dd').format(_selectedDate!)
                      : 'No date selected',
                  style: TextStyle(color: Colors.grey[700]),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: _pickDate,
              ),
            ],
          ),
          const SizedBox(height: 10),
          // Category Dropdown
          Row(
            children: [
              const Text('Category: '),
              Expanded(
                child: DropdownButton<Category>(
                  value: _selectedValue,
                  isExpanded: true,
                  items: Category.values.map((Category category) {
                    return DropdownMenuItem<Category>(
                      value: category,
                      child: Text(category.name),
                    );
                  }).toList(),
                  onChanged: (Category? newValue) {
                    setState(() {
                      if (newValue != null) {
                        _selectedValue = newValue;
                      }
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          // Buttons
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _onCancel,
                style: ElevatedButton.styleFrom(
               
                ),
                child: const Text('Cancel'),
              ),
              ElevatedButton(
                onPressed: _onAdd,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 189, 135, 199),
                ),
                child: const Text('Save Expense'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
