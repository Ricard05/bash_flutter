import 'package:flutter/material.dart';
import 'package:flutter_bash/view/views.dart';
import 'package:flutter_bash/models/models.dart';

class AppRouter {
  
  //Crear la ruta inicial
  static const initialRoute = 'login';
  
  //Lista de las rutas
  static final menuOptions = <MenuOptions>[
    MenuOptions(
      route: 'dashboard',
      icon: Icons.home,
      name: 'Pagina principal',
      screen: const DashBoardScreen()
    ),
    
    MenuOptions(
      route: 'bills',
      icon: Icons.money_off_csred_outlined,
      name: 'Gastos',
      screen: const BillsScreen()
    ),

    MenuOptions(
      route: 'incomes',
      icon: Icons.monetization_on,
      name: 'Ingresos',
      screen: const IncomesScreen()
    ),

    MenuOptions(
      route: 'profile',
      icon: Icons.account_circle,
      name: 'Perfil',
      screen: ProfileScreen(user: MyAppUser(name: 'Angel Homero', lastname: 'Fuentes Reyes', email: 'homero@gmail.com', password: '1234', imageUrl: 'https://robohash.org/bash1')),
    ),

    MenuOptions(
      route: 'help',
      icon: Icons.help,
      name: 'Ayuda',
      screen: const TutorialScreen()
    ),

    MenuOptions(
      route: 'tips',
      icon: Icons.tips_and_updates,
      name: 'Tips',
      screen: const TipsScreen()
    ),

    MenuOptions(
      route: 'us',
      icon: Icons.people,
      name: 'Nosotros',
      screen: const NosotrosScreen()
    ),

    MenuOptions(
      route: 'support',
      icon: Icons.support_agent,
      name: 'Soporte',
      screen: const SoporteScreen()
    ),

    MenuOptions(
      route: 'exit',
      icon: Icons.exit_to_app,
      name: 'Salir',
      screen: const LoginScreen()
    ),

  ];

  //Map para regresar la ruta correcta segun el arreglo
  static Map<String, Widget Function(BuildContext)>getAppRoutes(){
    Map<String, Widget Function(BuildContext)>appRoutes = {};

    //Ruta al login
    appRoutes.addAll({'login':(BuildContext context) => const LoginScreen()});
    appRoutes.addAll({'sigin':(BuildContext context) => const SigninScreen()});

    //agregar todas las rutas
    for (final option in menuOptions){
      appRoutes.addAll({option.route:(BuildContext context) => option.screen});
    }
    return appRoutes;
  }

  //Funcion por error 404
  /* static Route<dynamic> onGenerateRoute(RouteSettings settings){
    return MaterialPageRoute(builder: (context) => const AlertScreen());
  } */
}