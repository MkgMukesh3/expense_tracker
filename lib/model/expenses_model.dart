import 'package:flutter/foundation.dart';

class ExpensesModel {
  String name;
  double amount;
  String categories;
  String? expendedDate;

  ExpensesModel(
      {required this.name,
      required this.amount,
      required this.categories,
      this.expendedDate});
  factory ExpensesModel.fromDatabase(Map<String, dynamic> map) => ExpensesModel(
      name: map['name'] ?? 0,
      amount: double.parse(map['amount'].toString()),
      categories: map['category'] ?? "",
      expendedDate: map['expandedDate'] ?? "");
}
