import 'package:flutter/material.dart';
import 'package:flutter_bash/view/views.dart';
import 'package:flutter_bash/themes/theme.dart';
import 'package:flutter_bash/router/app_router.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bash',
      home: const LoginScreen(),
      theme: AppThemes.ThemeApp,
      initialRoute: AppRouter.initialRoute,
      routes: AppRouter.getAppRoutes(),
    );
  }
}
