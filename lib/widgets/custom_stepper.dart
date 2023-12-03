import 'package:flutter/material.dart';

class CustomStepper extends StatefulWidget {
  final List<Map<String, dynamic>> stepsData;
  final String titleText; // Nuevo parámetro para el título

  const CustomStepper({
    Key? key,
    required this.stepsData,
    required this.titleText, // Agregar el nuevo parámetro
  }) : super(key: key);

  @override
  State<CustomStepper> createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      title: Text(widget.titleText, style: const TextStyle(fontWeight: FontWeight.bold)), // Usar el nuevo parámetro para el título
      children: [
        Stepper(
          physics: const ClampingScrollPhysics(),
          currentStep: currentStep,
          onStepContinue: () {
            if (currentStep < widget.stepsData.length - 1) {
              setState(() {
                currentStep += 1;
              });
            }
          },
          onStepCancel: () {
            if (currentStep > 0) {
              setState(() {
                currentStep -= 1;
              });
            }
          },
          steps: List.generate(
            widget.stepsData.length,
            (index) => Step(
              title: Text(widget.stepsData[index]['title'] as String),
              content: Column(
                children: [
                  Image.asset(
                    widget.stepsData[index]['image'] as String,
                    width: 200,
                  ),
                ],
              ),
              isActive: currentStep >= index,
              state: currentStep >= index
                  ? StepState.complete
                  : StepState.disabled,
            ),
          ),
        )
      ],
    );
  }
}
