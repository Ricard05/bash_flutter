import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';

final cardData = [
   {
      "title": 'Presupuesta Inteligentemente',
      "description": 'Establece un presupuesto realista que te permita cubrir tus necesidades esenciales y ahorra para metas a largo plazo.',
      "imagePath": 'assets/images/img1.jpg',
    },

    {
      "title": "Ahorra Regularmente",
      "description": "Crea el hábito de ahorrar una parte de tus ingresos regularmente. Automatiza tus ahorros si es posible.",
      "imagePath": "assets/images/img2.jpg"
    },
    
    {
      "title": 'Elimina Deudas',
      "description": 'Prioriza el pago de deudas de alto interés. Utiliza estrategias como el método de bola de nieve para pagar deudas más rápido.',
      "imagePath": 'assets/images/img3.jpg',
    },

    {
      "title": 'Invierte para el Futuro',
      "description": 'Considera invertir parte de tus ahorros en opciones de inversión a largo plazo, como acciones o fondos indexados. La inversión puede ayudarte a hacer crecer tu patrimonio con el tiempo.',
      "imagePath": 'assets/images/img4.png',
    },
];

class TipsScreen extends StatelessWidget {
  const TipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consejos Financieros'),
        backgroundColor: Colors.teal,
      ),
      drawer: Nav(),
      body: FadeInUp(
        duration: const Duration(seconds: 1),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: CustomList(
            length: 4, 
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            itemBuilder: (context, index) {
              return _buildTipCard(
                title: cardData[index]['title'].toString(),
                description: cardData[index]['description'].toString(),
                imagePath: cardData[index]['imagePath'].toString(),
              );
            }, 
            axis: Axis.vertical
          ),
        )
      ),
    );
  }

  Widget _buildTipCard(
      {required String title,
      required String description,
      required String imagePath}) {
    return Card(
      elevation: 8.0,
      margin: const EdgeInsets.symmetric(vertical: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(12.0)),
            child: Image.asset(
              imagePath,
              height: 200.0,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.teal),
                ),
                const SizedBox(height: 8.0),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}