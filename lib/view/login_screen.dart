
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/routes/route_name.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Container(
        color:  Colors.blueGrey,
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, RouteName.home);
          },
          child: Center(
            child: Text('Login'),
          ),
        ),
      ),
    );
  }
}