import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import '../models/budget_model.dart';

class PieChartWidget extends StatelessWidget {
  final BudgetModel budget;

  PieChartWidget({required this.budget});

  @override
  Widget build(BuildContext context) {
    Map<String, double> dataMap = {
      "Akomodasi": budget.hotel * budget.days,
      "Makan": budget.food * budget.days,
      "Transportasi": budget.transport,
      "Wisata": budget.tour,
      "Lain-lain": budget.others,
    };

    return PieChart(
      dataMap: dataMap,
      chartRadius: MediaQuery.of(context).size.width / 2,
      chartType: ChartType.disc,
      legendOptions: LegendOptions(showLegends: true),
    );
  }
}
