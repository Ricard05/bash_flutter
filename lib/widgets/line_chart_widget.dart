import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class LineChartWidget extends StatelessWidget {

  const LineChartWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => LineChart(
    LineChartData(
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      gridData: FlGridData(
        show: true,
        drawVerticalLine: false,
        getDrawingHorizontalLine: (value) {
          return const FlLine(
            color: Colors.black12,
          );
        },
      ),
      titlesData:  FlTitlesData(
        topTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        rightTitles: AxisTitles(sideTitles: SideTitles(showTitles: false)),
        bottomTitles: AxisTitles(
  sideTitles: SideTitles(
    showTitles: true, 
    getTitlesWidget: (value, meta) {
      switch(value.toInt()) {
        case 0:
          return const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('L'),
          );
        case 2: 
          return const Padding(
            padding: EdgeInsets.only(top: 8.0), 
            child: Text('M'),
          );  
        case 4:
          return const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('X'),
          );
        case 6:
          return const Padding(
            padding: EdgeInsets.only(top: 8.0), 
            child: Text('J'),
          );
        case 8:
          return const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('V'),  
          );
        case 10:
          return const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('S'),  
          );
        case 12:
          return const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text('D'),  
          );
        default:
          return const Text('');
      }
    })
  ),
),         
      borderData: FlBorderData(
        show: true,
        border: const Border(
          bottom: BorderSide(
            color: Colors.white,
            width: 2
          )
        )
      ),
      lineBarsData: [
        LineChartBarData(
          spots: [
            const FlSpot(0, 3),
            const FlSpot(2.6, 2),
            const FlSpot(4.9, 5),
            const FlSpot(6.8, 2.5),
            const FlSpot(11, 2.5),
          ],
          isCurved: true,
          gradient: LinearGradient(
          colors: [
            Colors.teal[400]!,
            Colors.teal[700]!,
            Colors.teal[400]!,
          ],
          begin: Alignment.center),
          barWidth: 5,
          isStrokeCapRound: true, 
        ),

        LineChartBarData(
          spots: [
            const FlSpot(0, 1),
            const FlSpot(2.6, 2),
            const FlSpot(4, 3),
            const FlSpot(6, 2),
            const FlSpot(8, 3),
            const FlSpot(10, 2),
            const FlSpot(11, 5),
          ],
          isCurved: true,
          gradient: LinearGradient(
          colors: [
            Colors.red[400]!,
            Colors.red[700]!,
            Colors.redAccent[400]!,
          ],
          begin: Alignment.center),
          barWidth: 5, 
        ),
      ]
    ),
  );
}