import 'package:flutter/material.dart';

class CustomTextFormField extends StatefulWidget {
  final TextEditingController controller;
  final bool obscureText;
  final String labelText;
  final IconData preIcon;
  final IconData? suffixIcon;

  const CustomTextFormField({
    Key? key,
    required this.controller,
    required this.obscureText,
    required this.labelText,
    required this.preIcon,
    this.suffixIcon,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscureText == true ? _obscureText : false,
      decoration: InputDecoration(
        labelText: widget.labelText,
        prefixIcon: Icon(widget.preIcon),
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                onPressed: () {
                  // Cambiar el valor de _obscureText y reconstruir el widget
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
      ),
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Debes llenar este campo";
        }
        return null;
      },
    );
  }
}
