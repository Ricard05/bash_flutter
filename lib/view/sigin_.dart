import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView( // Envuelve el Scaffold con SingleChildScrollView
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              colors: [
                Colors.teal[500]!,
                Colors.teal[300]!,
                Colors.teal[100]!,
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 40),

              // Parte principal del dashboard
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Sign in', style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      shadows: [
                        Shadow(
                          offset: Offset(0.2, 0.2),
                          blurRadius: 3.0,
                          color: Colors.black
                        )
                      ]
                    )
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              // Contenido principal
              Container(
                height: MediaQuery.of(context).size.height * 0.828,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        child: Column(
                          children: [
                            Image.asset('assets/images/logo-bash.png', width: 150,),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _usuarioController,
                              decoration: const InputDecoration(
                                labelText: 'Usuario',
                                prefixIcon: Icon(Icons.account_circle)
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _usuarioController,
                              decoration: const InputDecoration(
                                labelText: 'Apellido',
                                prefixIcon: Icon(Icons.account_circle)
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _usuarioController,
                              decoration: const InputDecoration(
                                labelText: 'Correo',
                                prefixIcon: Icon(Icons.email)
                              ),
                            ),
                            const SizedBox(height: 10),
                            TextFormField(
                              controller: _contrasenaController,
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Contraseña',
                                prefixIcon: Icon(Icons.lock),
                                suffixIcon: Icon(Icons.visibility)
                              ),
                            ),
                            const SizedBox(height: 30),
                            ElevatedButton(
                              onPressed: () {
                                QuickAlert.show(
                                    context: context,
                                    title: 'Registro Exitoso',
                                    type: QuickAlertType.success,
                                    text: 'Todos los datos fueron almacenados correctamente',
                                    confirmBtnColor: Colors.teal,
                                  );
                              },
                              child: const Text('Registrar', style: TextStyle(fontSize: 20)),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const SizedBox(height: 90,),
                                const Text('Ya tienes una cuenta?', style: TextStyle(fontSize: 16)),
                                const SizedBox(width: 5,),
                                TextButton(
                                  onPressed: (){
                                    Navigator.pushNamed(context, 'login');
                                 },
                                  child: Text('Inicia sesion', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.teal, fontSize: 16),))
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usuarioController.dispose();
    _contrasenaController.dispose();
    super.dispose();
  }
}
