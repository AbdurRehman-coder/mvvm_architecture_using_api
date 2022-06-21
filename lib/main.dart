import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/utils/routes/route.dart';
import 'package:untitled/utils/routes/route_name.dart';
import 'package:untitled/view_model/auth_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthViewModel()),
        ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),

      initialRoute: RouteName.login,
      onGenerateRoute: Routes.generateRoute,
    ),);
  }
}