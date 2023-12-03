import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({
    super.key,
    required this.realIndex,
    required this.title,
    required this.amount,
    required this.percentage,
    required this.color,
  });
  
  final String title;
  final String amount;
  final String percentage;
  final Color color; 
  final int realIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(25),
      ),
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          ListTile(
            title: Text('Total $title', style: TextStyle(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold)),
            trailing: IconButton(onPressed: (){}, icon: const Icon(Icons.arrow_drop_down_circle_sharp))
          ),
          const SizedBox(height: 20,),
          
          Row(
            children: [
              const SizedBox(width: 15,),
              Icon(Icons.monetization_on, size: 40, color: Colors.white, shadows: [
                Shadow(
                  offset: Offset(2.0, 2.0),
                  blurRadius: 3.0,
                  color: Colors.black.withOpacity(0.5)
                )
              ]
            ,),
            Text(amount, style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white, shadows: [Shadow(
              offset: Offset(2.0, 2.0), // Ajusta los valores de desplazamiento según tus preferencias
              blurRadius: 3.0, // Ajusta el radio de desenfoque según tus preferencias
              color: Colors.black.withOpacity(0.5), // Ajusta el color de la sombra según tus preferencias
            ),
          ]
        ),
      ),
          ],
        ),

        const SizedBox(height: 20,),

        Row(
          children: [
            const SizedBox(width: 5,),
            const Icon(Icons.arrow_upward_outlined, size: 20, color: Colors.white),
            const SizedBox(width: 5,),
            Text(percentage,style: const TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
            const SizedBox(width: 5,),
            Text('Desde el mes pasado', style: TextStyle(fontSize: 13, color: Colors.grey[100]),)
          ],
        )
      ],
    ),
      );
  }
}