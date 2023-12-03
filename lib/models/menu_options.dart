import 'package:flutter/material.dart';

//Tipo de dato definido por el usuario
class MenuOptions {
  
  final String route;
  final IconData icon;
  final String name;
  final Widget screen;

  MenuOptions({
    required this.route,
    required this.icon,
    required this.name,
    required this.screen
  });
}