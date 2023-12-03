import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MyPieChart extends StatelessWidget {
  const MyPieChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        PieChart(
          swapAnimationDuration: const Duration(milliseconds: 750),    
          PieChartData(
            sections: sections,  
          ),
        ),
        Text(
          '\$1,456.00',
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.bold,
            ),  
        ),
      ],
    );
  }
  
  List<PieChartSectionData> get sections {
    return [
      PieChartSectionData(
        value: 25,
        color: Colors.pinkAccent,
        badgeWidget: const _LegendBadge(
          'Comida',
          verticalOffset: 25,
        ),
        
        badgePositionPercentageOffset: 1.6,    
      ),
      PieChartSectionData(
        value: 25, 
        color: Colors.deepOrange,
        badgeWidget: const _LegendBadge(
         'Transporte',
         verticalOffset: 25,
        ),
        badgePositionPercentageOffset: 1.6,
      ),
      PieChartSectionData(
        value: 20,
        color: Colors.purple,
        badgeWidget: const _LegendBadge(
          'Vivienda',
          verticalOffset: 25,  
        ),
        badgePositionPercentageOffset: 2.0,  
      ),
      PieChartSectionData(
        value: 15, 
        color: Colors.orange,
        badgeWidget: const _LegendBadge(
          'Entretenimiento',
          verticalOffset: 25,
        ),
        badgePositionPercentageOffset: 1.8,
      ),
      PieChartSectionData(
        value: 15,
        color: Colors.green,
        badgeWidget: _LegendBadge(
          'Otros',
          verticalOffset: 25,  
        ),
        badgePositionPercentageOffset: 1.8,
      ),
    ];
  }
}

class _LegendBadge extends StatelessWidget {
  final String text;
  final double verticalOffset;

  const _LegendBadge(
    this.text, {
    required this.verticalOffset,
  });
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: verticalOffset),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold
        )  
      ),
    );
  }
}