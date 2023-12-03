import 'package:flutter/material.dart';

class RegisterItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color leadingColor;
  final String trailingText;
  
  const RegisterItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.icon,
    this.leadingColor = Colors.teal, // Valor predeterminado para leadingColor
    this.trailingText = 'Categoria', // Valor predeterminado para trailingText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      contentPadding: EdgeInsets.all(5),
      leading: Container(
        width: 5.0,
        color: leadingColor,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontStyle: FontStyle.italic,
          color: Colors.grey,
        ),
      ),
      trailing: Icon(icon, size: 40, color: leadingColor),
    );
  }
}
