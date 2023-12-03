import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';

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
                  children: const [
                    Text(
                      'Bienvenido a Bash, tu aplicación todo en uno para gestionar gastos e ingresos. '
                      'Nuestra misión es proporcionarte una experiencia sencilla y efectiva para el control '
                      'de tus finanzas personales. Estamos comprometidos a ayudarte a alcanzar tus metas financieras.',
                      style: TextStyle(fontSize: 16.0),
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Características Principales:',
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal),
                    ),
                    ListTile(
                      title: Text('Registro de Gastos e Ingresos'),
                      subtitle: Text(
                          'Mantén un registro detallado de tus transacciones.'),
                    ),
                    ListTile(
                      title: Text('Formulario de Quejas'),
                      subtitle: Text(
                          'Danos tu feedback para mejorar nuestra aplicación.'),
                    ),
                    ListTile(
                      title: Text('Perfil de Usuario'),
                      subtitle: Text(
                          'Personaliza tu perfil y gestiona tu información personal.'),
                    ),
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
