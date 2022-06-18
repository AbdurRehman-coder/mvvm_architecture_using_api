
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:untitled/utils/routes/route_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Container(
        color:  Colors.amberAccent,
        child: InkWell(
          onTap: (){
            Navigator.pushNamed(context, RouteName.login);
          },
          child: const Center(
            child: Text('Home'),
          ),
        ),
      ),
    );
  }
}