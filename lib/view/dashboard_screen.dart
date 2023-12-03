import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';
import 'package:draggable_home/draggable_home.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  State<DashBoardScreen> createState() => _DashBoardScreenState();
}

final bills = [
  {
    "amount": "324.00",
    "icon": Icons.money_off,
    "description": "Uber"
  },

  {
    "amount": "324.00",
    "icon": Icons.money_off,
    "description": "Uber"
  },

  {
    "amount": "324.00",
    "icon": Icons.money_off,
    "description": "Uber"
  },

  {
    "amount": "324.00",
    "icon": Icons.money_off,
    "description": "Uber"
  },

  {
    "amount": "324.00",
    "icon": Icons.money_off,
    "description": "Uber"
  },

  {
    "amount": "324.00",
    "icon": Icons.money_off,
    "description": "Uber"
  },

  {
    "amount": "324.00",
    "icon": Icons.money_off,
    "description": "Uber"
  },
];

class _DashBoardScreenState extends State<DashBoardScreen> {
  @override
  Widget build(BuildContext context) {
    return DraggableHome(
        title: const Text('Dashboard'),
        drawer: const Nav(),
        headerExpandedHeight: 0.53,
        headerWidget: FadeInUp(
          duration: Duration(milliseconds: 800),
          child: const Header()
        ), 
        body: [
          //Grafica
          const SizedBox(height: 20,),
          const Text('Status semanal', style: TextStyle(fontSize: 20),),
          FadeInUp(
            duration: Duration(milliseconds: 800),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: const AspectRatio(
                aspectRatio: 1,
                child: LineChartWidget(),
              ),
            ),
          ),

          const SizedBox(height: 10,),
          const Text('Gastos recientes', style: TextStyle(fontSize: 20),),
          const SizedBox(height: 10,),

          //Lista de items
          CustomList(
            length: bills.length,
            height: 250,
            width: 400,
            itemBuilder: (context, index) {
              return RegisterItem(
                title: bills[index]['amount'].toString(),
                icon: Icons.money_off,
                subtitle: bills[index]['description'].toString(),
                leadingColor: Colors.red[600]!,
              );
            },
            axis: Axis.vertical)
        ]
      );
  }
}