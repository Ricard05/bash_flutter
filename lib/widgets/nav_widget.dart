import 'package:flutter/material.dart';
import 'package:flutter_bash/widgets/widgets.dart';
import 'package:flutter_bash/router/app_router.dart';

class Nav extends StatelessWidget {
   
  const Nav({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Image.asset('assets/images/logo-bash.png') 
          ),
          CustomList(
            length: AppRouter.menuOptions.length,
            height: 500,
            width: 400,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(AppRouter.menuOptions[index].name),
                leading: Icon(AppRouter.menuOptions[index].icon),
                onTap: (){
                  Navigator.pushNamed(context, AppRouter.menuOptions[index].route);
                },
              );
            },
            axis: Axis.vertical
          )
        ],
      )
    );
  }
}