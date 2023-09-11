import 'package:flutter/material.dart';

class AddPageProvider extends ChangeNotifier {
  String _selectedCategory = "Select Category";
  TextEditingController _nameController = TextEditingController();
  TextEditingController _amountController = TextEditingController();
  List<String> categories = [
    'Select Category',
    'Groceries',
    'Transportation',
    'Entertainment',
    'Dining',
    'Utilities',
    'Other',
  ];

  String get selectedCategory => _selectedCategory;
  TextEditingController get nameController => _nameController;
  TextEditingController get amountController => _amountController;

  clear() {
    _nameController.clear();
    _amountController.clear();
    _selectedCategory = "Select Category";
    notifyListeners();
  }

  setSelectedCategory(val) {
    _selectedCategory = val;
    notifyListeners();
  }
}
