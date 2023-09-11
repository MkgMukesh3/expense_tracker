import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  ExpensesList(
      {super.key,
      required this.leadingText,
      required this.subTitleText,
      required this.trailingText});
  final String leadingText;
  final String subTitleText;
  final String trailingText;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        leadingText,
        style: TextStyle(fontSize: 20),
      ),
      subtitle: Text(subTitleText),
      trailing: Text(
        "\$${trailingText}",
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
