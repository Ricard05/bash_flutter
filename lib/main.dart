import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bash/view/views.dart';
import 'package:flutter_bash/themes/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bash/router/app_router.dart';
import 'package:flutter_bash/providers/provider.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => GmailProvider()),
        // Agrega otros proveedores según sea necesario
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
