import 'package:expense_tracker/bargraph/bar_data.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class BarGraph extends StatelessWidget {
  double groceries;
  double transportation;
  double entertainment;
  double dining;
  double utilities;
  double other;
  double maxY;
  BarGraph(
      {super.key,
      required this.dining,
      required this.entertainment,
      required this.groceries,
      required this.other,
      required this.transportation,
      required this.utilities,
      required this.maxY});

  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      groceries: groceries,
      transportation: transportation,
      entertainment: entertainment,
      dining: dining,
      utilities: utilities,
      other: other,
    );
    myBarData.initializeBarData();
    print("maxY $maxY");
    return BarChart(
      BarChartData(
        maxY: maxY == 0.0 ? 200 : maxY,
        minY: 0,
        titlesData: FlTitlesData(
          show: true,
          topTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          leftTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          rightTitles: AxisTitles(
            sideTitles: SideTitles(showTitles: false),
          ),
          bottomTitles: AxisTitles(
            sideTitles: SideTitles(
              reservedSize: 45,
              showTitles: true,
              getTitlesWidget: getBootomTitles,
            ),
          ),
        ),
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        barGroups: myBarData.barData
            .map(
              (e) => BarChartGroupData(
                x: e.x,
                barRods: [
                  BarChartRodData(
                      toY: e.y,
                      width: 20,
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(5),
                      backDrawRodData: BackgroundBarChartRodData(
                          color: Colors.white,
                          show: true,
                          toY: maxY == 0.0 ? 200 : maxY)),
                ],
              ),
            )
            .toList(),
      ),
    );
  }
}

Widget getBootomTitles(double val, TitleMeta meta) {
  Widget text;
  switch (val.toInt()) {
    case 0:
      text = const Text('G');
      break;
    case 1:
      text = const Text('T');
      break;
    case 2:
      text = const Text('E');
      break;
    case 3:
      text = const Text('D');
      break;
    case 4:
      text = const Text('U');
      break;
    case 5:
      text = const Text('O');
      break;
    default:
      text = const Text('Others');
      break;
  }
  return SideTitleWidget(child: text, axisSide: meta.axisSide);
}
