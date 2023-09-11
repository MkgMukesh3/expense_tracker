import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../db/expenses_db.dart';
import '../model/expenses_model.dart';

class ExpenseProvider extends ChangeNotifier {
  List<ExpensesModel>? _expensesData;

  List<ExpensesModel>? get expensesData => _expensesData;
  final getExpensesData = ExpensesDB();

  void preparedData() async {
    _expensesData = await getExpensesData.fetchAll();
    notifyListeners();
  }

  calculateValues(List<ExpensesModel>? val) {
    double addAMount = 0;
    val!.forEach((element) {
      print("addAMount ${element.amount}  ${element.name}");
      addAMount += element.amount;
    });

    return addAMount;
  }
}
