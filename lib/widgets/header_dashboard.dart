import 'package:flutter/material.dart';
import 'package:flutter_bash/widgets/widgets.dart';

final List<Color> colors = [Colors.amber[800]!, Colors.teal[700]!, Colors.red[600]!];

final cardsInfo = [
  {
    "title": "Ahorro",
    "amount": "2,345.00",
    "percentage": "+15%",
  },
  {
    "title": "Ingresos",
    "amount": "1,234.00",
    "percentage": "+3.48%",
  },
  {
    "title": "Gastos",
    "amount": "987.56",
    "percentage": "-3.48%",
  },
];

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Column(
        children: [
          const SizedBox(
            height: 60,
          ),
          const Text(
            'Inicio',
            style: TextStyle(color: Colors.white, fontSize: 30),
          ),
          const SizedBox(
            height: 30,
          ),

          //Cards
          SizedBox(
            height: 300,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemBuilder: (context, index) {
                // Usa el operador % para calcular el índice real y asegurarte de que se repitan
                int realIndex = index % colors.length;
                return CardWidget(
                  amount: cardsInfo[realIndex]['amount'].toString(),
                  title: cardsInfo[realIndex]['title'].toString(),
                  percentage: cardsInfo[realIndex]['percentage'].toString(),
                  color: colors[realIndex],
                  realIndex: realIndex,
                );
              },
              itemCount: 23, // Puedes ajustar esto según la cantidad que desees
              reverse: false,
              pageSnapping: true,
              physics: const BouncingScrollPhysics(),
              controller: PageController(
                initialPage: 3,
                viewportFraction: 0.7,
              ),
            ),
          )
        ],
      ),
    );
  }
}
