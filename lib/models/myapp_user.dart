import 'package:flutter/material.dart';

class MyAppUser {
  final String name;
  final String lastname;
  final String email;
  final String password;
  final String imageUrl;

  MyAppUser({
    required this.name,
    required this.email,
    required this.imageUrl,
    required this.password,
    required this.lastname    
  });
}