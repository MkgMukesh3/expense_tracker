import 'package:expense_tracker/bargraph/bar_graph.dart';
import 'package:expense_tracker/provider/expense_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../model/expenses_model.dart';

class ExpenseGraph extends StatelessWidget {
  List<ExpensesModel> expensesData;
  ExpenseGraph({super.key, required this.expensesData});

  @override
  Widget build(BuildContext context) {
    // int diningIndex =
    //     expensesData!.indexWhere((element) => element.categories == "dining");
    // int entertainmentIndex = expensesData!
    //     .indexWhere((element) => element.categories == "entertainment");
    // int groceriesIndex = expensesData!
    //     .indexWhere((element) => element.categories == "groceries");
    // int otherIndex =
    //     expensesData!.indexWhere((element) => element.categories == "other");
    // int transportationIndex = expensesData!
    //     .indexWhere((element) => element.categories == "transportation");
    // int utilitiesIndex = expensesData!
    //     .indexWhere((element) => element.categories == "utilities");
    // double maxY = 0.0;
    // expensesData!.forEach((elment) => maxY += elment.amount);
    return Consumer<ExpenseProvider>(builder: (context, value, child) {
      return Container(
        height: 220,
        child: BarGraph(
          dining: value.calculateValues(expensesData
              .where((element) => element.categories == "Dining")
              .toList()),
          entertainment: value.calculateValues(expensesData
              .where((element) => element.categories == "Entertainment")
              .toList()),
          groceries: value.calculateValues(expensesData
              .where((element) => element.categories == "Groceries")
              .toList()),
          transportation: value.calculateValues(expensesData
              .where((element) => element.categories == "Transportation")
              .toList()),
          utilities: value.calculateValues(expensesData
              .where((element) => element.categories == "Utilities")
              .toList()),
          maxY: value.calculateValues(expensesData),
          other: value.calculateValues(expensesData
              .where((element) => element.categories == "Other")
              .toList()),
        ),
      );
    });
  }
}
