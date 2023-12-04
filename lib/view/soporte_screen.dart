import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
// ignore: depend_on_referenced_packages

class SoporteScreen extends StatefulWidget {
  const SoporteScreen({super.key});

  @override
  State<SoporteScreen> createState() => _SoporteScreenState();
}

class _SoporteScreenState extends State<SoporteScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      drawer: Nav(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 400,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: -40,
                    height: 400,
                    width: width,
                    child: FadeInUp(
                      duration: const Duration(seconds: 1),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    height: 400,
                    width: width + 20,
                    child: FadeInUp(
                      duration: const Duration(milliseconds: 1000),
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/background-2.png'),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeInUp(
                    duration: const Duration(milliseconds: 1500),
                    child: const Text(
                      "Soporte",
                      style: TextStyle(
                        color: Colors.teal,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1700),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                        border: Border.all(color: Colors.teal.shade50),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.teal.shade200,
                            blurRadius: 20,
                            offset: const Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: Colors.teal.shade200,
                                ),
                              ),
                            ),
                            child: TextFormField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.email),
                                border: InputBorder.none,
                                hintText: "Correo Electronico",
                                hintStyle:
                                    TextStyle(color: Colors.grey.shade700),
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.all(10),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(
                                minHeight: 50,
                              ),
                              child: TextField(
                                maxLines: null,
                                keyboardType: TextInputType.multiline,
                                decoration: InputDecoration(
                                  prefixIcon: const Icon(Icons.message),
                                  border: InputBorder.none,
                                  hintText: "Mensaje",
                                  hintStyle:
                                      TextStyle(color: Colors.grey.shade700),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FadeInUp(
                    duration: const Duration(milliseconds: 1900),
                    child: MaterialButton(
                      onPressed: () {
                        QuickAlert.show(
                            context: context,
                            type: QuickAlertType.success,
                            title: 'Pregunta o solicitud enviada',
                            text: 'Se envio correctamente la solicitud realizada.',
                            confirmBtnColor: Colors.teal);
                      },
                      color: Colors.teal,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      height: 50,
                      child: const Center(
                        child: Text(
                          "Enviar",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
