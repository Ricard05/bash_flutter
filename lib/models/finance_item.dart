import 'package:flutter/material.dart';

//Tipo de dato definido por el usuario
class FinanceItem {
  
  final String title;
  final double amount;
  final IconData icon;
  final Color color;
  

  FinanceItem({
    required this.title,
    required this.amount,
    required this.icon,
    required this.color,
  });
}