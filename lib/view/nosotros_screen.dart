import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';

final characteristicsData = [
  {
    "title": "Registro de gastos e ingresos",
    "description": "'Mantén un registro detallado de tus transacciones.'",
  },
  {
    "title": "Perfil de usuario",
    "description":
        "'Personaliza tu perfil y gestiona tu información personal.'",
  },
  {
    "title": "Soporte técnico",
    "description":
        "'Solicita ayuda y soporte para resolver dudas o problemas.'",
  },
];

class NosotrosScreen extends StatelessWidget {
  const NosotrosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text('Sobre Nosotros'),
      ),
      drawer: const Nav(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                color: Colors.teal.shade200,
                width: MediaQuery.of(context).size.width,
                height: 300,
                child: FadeIn(
                  duration: const Duration(seconds: 1),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/finance.png',
                        height: 260,
                        fit: BoxFit.fitHeight,
                      )
                    ],
                  ),
                )),
            FadeInUp(
              duration: const Duration(seconds: 1),
              child: Container(
                color: Colors.white,
                height: 500,
                child: ListView(
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    const Text(
                      'Bienvenido a Bash, tu aplicación todo en uno para gestionar gastos e ingresos. '
                      'Nuestra misión es proporcionarte una experiencia sencilla y efectiva para el control '
                      'de tus finanzas personales. Estamos comprometidos a ayudarte a alcanzar tus metas financieras.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      'Características Principales:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                    CustomList(
                        length: 3,
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title:
                                Text('${characteristicsData[index]['title']}'),
                            subtitle: Text(
                                '${characteristicsData[index]['description']}'),
                          );
                        },
                        axis: Axis.vertical),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
