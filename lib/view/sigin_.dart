import 'package:flutter/material.dart';
import 'package:flutter_bash/widgets/widgets.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:flutter_bash/services/firebase_service.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _contrasenaController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();

  //Metodo para registrar al usuario
  void handleSignIn() async {
    final String usuario = _usuarioController.text.trim();
    final String contrasena = _contrasenaController.text.trim();
    final String email = _emailController.text.trim();
    final String lastname = _lastnameController.text.trim();

    if (usuario.isEmpty ||
        contrasena.isEmpty ||
        email.isEmpty ||
        lastname.isEmpty) {
      QuickAlert.show(
        context: context,
        title: 'Hubo un problema!',
        type: QuickAlertType.error,
        text: 'Debes llenar todos los campos',
        confirmBtnColor: Colors.teal,
      );
    } else {
      //Se ejecuta la funcion para registrar un usuario y se le mandan como parametro los estados
      final response = await addUser(usuario, contrasena, lastname, email);

      //Si la respuesta es true entonces el usuario se registro y se muestran los datos
      if (response == true) {
        // ignore: use_build_context_synchronously
        QuickAlert.show(
          context: context,
          title: 'Registro Exitoso',
          type: QuickAlertType.success,
          text: 'Todos los datos fueron almacenados correctamente',
          confirmBtnColor: Colors.teal,
        );

        //Reiniciar los estados
        _usuarioController.clear();
        _contrasenaController.clear();
        _emailController.clear();
        _lastnameController.clear();
      } else {
        // ignore: use_build_context_synchronously
        QuickAlert.show(
          context: context,
          title: 'Hubo un problema!',
          type: QuickAlertType.error,
          text: 'El correo ya esta registrado con otro usuario!',
          confirmBtnColor: Colors.teal,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    //Informacion de los campos de los inputs
    final List inputsData = [
      {
        "controller": _usuarioController,
        "obscureText": false,
        "labelText": 'Usuario',
        "type": TextInputType.name,
        "icon": Icons.account_circle,
      },
      {
        "controller": _lastnameController,
        "obscureText": false,
        "labelText": 'Apellido',
        "type": TextInputType.name,
        "icon": Icons.group,
      },
      {
        "controller": _emailController,
        "obscureText": false,
        "keyboardType": TextInputType.emailAddress,
        "labelText": 'Correo Electronico',
        "icon": Icons.mail,
      },
      {
        "controller": _contrasenaController,
        "obscureText": true,
        "labelText": 'Contraseña',
        "type": TextInputType.text,
        "icon": Icons.lock,
      },
    ];

    return Scaffold(
      body: SingleChildScrollView(
        // Envuelve el Scaffold con SingleChildScrollView
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

              // Header del registro
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Sign in',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 40,
                            shadows: [
                              Shadow(
                                  offset: Offset(0.2, 0.2),
                                  blurRadius: 3.0,
                                  color: Colors.black)
                            ])),
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
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Form(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Image.asset(
                                'assets/images/logo-bash.png',
                                width: 130,
                              ),

                              //Se generan de forma dinamica los textformfield
                              CustomList(
                                  length: inputsData.length,
                                  height:
                                      MediaQuery.of(context).size.height * 0.45,
                                  width: MediaQuery.of(context).size.width,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        CustomTextFormField(
                                          controller: inputsData[index]
                                              ['controller'],
                                          labelText: inputsData[index]
                                              ['labelText'],
                                          obscureText: inputsData[index]
                                              ['obscureText'],
                                          preIcon: inputsData[index]['icon'],
                                          suffixIcon: index == 3 ? Icons.visibility : null,
                                        ),
                                      ],
                                    );
                                  },
                                  axis: Axis.vertical),

                              const SizedBox(height: 20),
                              ElevatedButton(
                                onPressed: handleSignIn,
                                child: const Text('Registrar',
                                    style: TextStyle(fontSize: 20)),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  const Text('Ya tienes una cuenta?',
                                      style: TextStyle(fontSize: 16)),
                                  const SizedBox(
                                    width: 5,
                                  ),

                                  //Es el boton para ir a la seccion de registro
                                  TextButton(
                                      onPressed: () {
                                        Navigator.pushNamed(context, 'login');
                                      },
                                      child: const Text(
                                        'Inicia sesion',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.teal,
                                            fontSize: 16),
                                      ))
                                ],
                              )
                            ],
                          ),
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
