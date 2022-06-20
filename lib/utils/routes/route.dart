
import 'package:flutter/material.dart';
import 'package:untitled/utils/routes/route_name.dart';
import 'package:untitled/view/home_screen.dart';
import 'package:untitled/view/login_screen.dart';

class Routes {

  /// Route is data type
  static Route<dynamic> generateRoute(RouteSettings settings){

    switch(settings.name){
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomeScreen());

      case RouteName.login:
        return MaterialPageRoute(builder: (BuildContext context) => LoginScreen());

      default:
        return MaterialPageRoute(builder: (BuildContext context) {
          return const Scaffold(
            body: Center(
              child: Text('No route directory'),
            ),
          );
        });

    }
  }
}