import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter_bash/widgets/widgets.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({Key? key}) : super(key: key);

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  int currentStep = 0;

  //Arreglo con los datos de los pasos
  final steps1 = [
    {
      'title': 'Si no tienes una cuenta da click en el boton registrate.',
      'image': 'assets/images/btnSignin.gif',
    },
    {
      'title': 'Si ya tienes una cuenta ingresa tus datos para iniciar sesion.',
      'image': 'assets/images/step2login.gif',
    },
    {
      'title': 'Por ultimo, da click en el boton de iniciar sesion y esto te llevara al dashboardprincipal',
      'image': 'assets/images/step3login.gif',
    },
  ];

  final steps2 = [
    {
      'title': 'Una vez en la seccion de gastos se mostrara en la parte superior el total de gastos y la categoria en la que mas se gasta.',
      'image': 'assets/images/billsS1.gif',
    },
    {
      'title': 'En la siguiente parte se muestran los gastos del usuario.',
      'image': 'assets/images/billsS2.gif',
    },
    {
      'title': 'Por ultimo, se muestra una grafica de pastel donde se muestra el porcentaje de cada categoria segun los gastos totales.',
      'image': 'assets/images/billsS3.gif',
    },
  ];

  final steps3 = [
    {
      'title': 'Una vez en la seccion de ingresos se mostrara en la parte superior el total de ingresos y el ingreso mas comun.',
      'image': 'assets/images/billsS1.gif',
    },
    {
      'title': 'En la siguiente parte se muestran los ingresos del usuario.',
      'image': 'assets/images/billsS2.gif',
    },
    {
      'title': 'Por ultimo, se muestra una grafica de pastel donde se muestra el porcentaje de cada categoria segun los ingresos totales.',
      'image': 'assets/images/billsS3.gif',
    },
  ];

  continueStep() {
    if (currentStep < 2) {
      setState(() {
        currentStep = currentStep + 1;
      });
    }
  }

  cancelStep() {
    if (currentStep > 0) {
      setState(() {
        currentStep = currentStep - 1;
      });
    }
  }

  onStepTapped(int value) {
    setState(() {
      currentStep = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preguntas frecuentes'),
      ),
      drawer: Nav(),
      body: FadeInUp(
        duration: Duration(milliseconds: 800),
        child: SingleChildScrollView(
          child: Column(
            children: [
      
              //Login
              CustomStepper(
                titleText: '¿Como iniciar sesion?',
                stepsData: steps1,
              ),
      
              //Bills
              CustomStepper(
                titleText: '¿Como funciona la seccion de gastos?',
                stepsData: steps2,
              ),
      
              CustomStepper(
                titleText: '¿Como funciona la seccion de ingresos?',
                stepsData: steps3,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



/* Stepper(
                  physics: const ClampingScrollPhysics(),
                  currentStep: currentStep,
                  onStepContinue: () => continueStep(),
                  onStepCancel: () => cancelStep(),
                  onStepTapped: onStepTapped, // No ejecutes la función aquí
                  steps: [
                    Step(
                      title: Text(
                          'El primer paso es tener una cuenta. En caso de no tener una, haz clic en el botón de registrarte'),
                      content: Column(
                        children: [
                          Image.asset(
                            'assets/images/btnSignin.gif',
                            width: 200,
                          )
                        ],
                      ),
                      isActive: currentStep >= 0,
                      state: currentStep >= 0 ? StepState.complete : StepState.disabled
                    ),

                    Step(
                      title: Text('Ingresamos nuestro nombre de usuario y contraseña'),
                      content: Column(
                        children: [
                          Image.asset(
                            'assets/images/step2login.gif',
                            width: 200,
                          )
                        ],
                      ),
                      isActive: currentStep >= 1,
                      state: currentStep >= 1 ? StepState.complete : StepState.disabled
                    ),

                    Step(
                      title: Text('Damos click en el boton de iniciar sesion y nos va a llevar al dashboard principal'),
                      content: Column(
                        children: [
                          Image.asset(
                            'assets/images/step3login.gif',
                            width: 200,
                          )
                        ],
                      ),
                      isActive: currentStep >= 1,
                      state: currentStep >= 2 ? StepState.complete : StepState.disabled
                    ),
                  ],
                ), */
