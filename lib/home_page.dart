import 'package:expense_tracker/add_page.dart';
import 'package:expense_tracker/provider/expense_provider.dart';
// import 'package:expense_tracker/widgets/bar_graph.dart';
import 'package:expense_tracker/widgets/expense_graph.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) =>
        Provider.of<ExpenseProvider>(context, listen: false).preparedData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Home Page"),
      ),
      backgroundColor: Colors.grey[300],
      body:
          Consumer<ExpenseProvider>(builder: (context, expenseProvider, child) {
        return Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ExpenseGraph(
                expensesData: expenseProvider.expensesData ?? [],
              ),
              Expanded(
                child: ListView(
                  padding: EdgeInsets.only(bottom: 45),
                  children: [
                    ...List.generate(
                        expenseProvider.expensesData != null
                            ? expenseProvider.expensesData!.length
                            : 0,
                        (index) => ExpensesList(
                            leadingText:
                                expenseProvider.expensesData![index].name,
                            subTitleText: expenseProvider
                                .expensesData![index].categories
                                .toString(),
                            trailingText: expenseProvider
                                .expensesData![index].amount
                                .toString())),
                  ],
                ),
              )
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPage(),
            ),
          );
        },
        label: const Text("Add Expeses"),
        icon: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
