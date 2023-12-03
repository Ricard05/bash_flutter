import 'package:flutter/material.dart';

//Tipo de dato definido por el usuario
class IndexedItem {
  
  final String title;
  final String subtitle;
  final IconData icon;

  IndexedItem({
    required this.title,
    required this.subtitle,
    required this.icon
  });
}