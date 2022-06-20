
import 'package:flutter/material.dart';
import 'package:untitled/utils/general_utils.dart';


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
        title: const Text('Login'),
      ),
      body: Container(
        color:  Colors.blueGrey,
        child: InkWell(
          onTap: (){
            /// show flutter toast snackbar of package
            // Utils.flutterToastMessage('No internet Connection');
            /// Show flutter snackbar widget
            // Utils.snackBarWidget(context, 'User name invalid');

            /// show Flushbar
            Utils.flushBarErrorWidget(context, 'UnAuthorized User');



            // Navigator.pushNamed(context, RouteName.home);
          },
          child: const Center(
            child: Text('Login'),
          ),
        ),
      ),
    );
  }
}