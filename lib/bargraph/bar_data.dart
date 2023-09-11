import 'package:expense_tracker/bargraph/single_bar.dart';
import 'package:expense_tracker/widgets/expenses_list.dart';

class BarData {
  double groceries;
  double transportation;
  double entertainment;
  double dining;
  double utilities;
  double other;

  BarData(
      {required this.dining,
      required this.entertainment,
      required this.groceries,
      required this.other,
      required this.transportation,
      required this.utilities});
  List<SingleBar> barData = [];

  void initializeBarData() {
    barData = [
      SingleBar(x: 0, y: groceries),
      SingleBar(x: 1, y: transportation),
      SingleBar(x: 2, y: entertainment),
      SingleBar(x: 3, y: dining),
      SingleBar(x: 4, y: utilities),
      SingleBar(x: 5, y: other),
    ];
  }
}
