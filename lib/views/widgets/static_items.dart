import 'package:flutter/material.dart';

import 'package:ihydrate_application/boxes/box.dart';
import 'package:ihydrate_application/models/category/data_base.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WaterProgressChart extends StatefulWidget {
  const WaterProgressChart({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WaterProgressChartState createState() => _WaterProgressChartState();
}

class _WaterProgressChartState extends State<WaterProgressChart> {
  int _waterGoal = 0;
  int _waterCount = 0;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  void _loadData() async {
    final waterGoalBox = WaterGoal.getdata();
    final drinkBox = Boxes.getdata();

    setState(() {
      _waterGoal = waterGoalBox.get(0)!.goal;
      _waterCount = drinkBox.values.fold(0, (sum, drink) => sum + drink.water);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SfCircularChart(
            series: <CircularSeries>[
              PieSeries<ChartData, String>(
                dataSource: <ChartData>[
                  ChartData('Water Count', _waterCount),
                  ChartData('Remaining', _waterGoal - _waterCount),
                ],
                //water count
                xValueMapper: (ChartData data, _) => data.category,
                //reming
                yValueMapper: (ChartData data, _) => data.value,
                //convert percetage in data
                dataLabelMapper: (ChartData data, _) =>
                    //fixed using in number show
                    '${((data.value / _waterGoal) * 100).toStringAsFixed(0)}%',
                //data show down side
                dataLabelSettings: const DataLabelSettings(
                  isVisible: true,
                  textStyle: TextStyle(fontSize: 16),
                ),
              ),
            ],
            //show detiles in list count and reming
            legend: const Legend(isVisible: true),
          ),

          // Display the percentage of the total goal completed
          Text(
              '${(_waterCount / _waterGoal * 100).toStringAsFixed(0)}%Complete of Goal'),
          const SizedBox(height: 16),
          // Display the percentage of remaining water
          Text(
              '${((_waterGoal - _waterCount) / _waterGoal * 100).toStringAsFixed(0)}% of water remaining'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ChartData {
  final String category;
  final int value;

  ChartData(this.category, this.value);
}
