
import 'package:flutter/material.dart';
import 'package:untitled/resources/components/round_button.dart';
import 'package:untitled/utils/general_utils.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  /// TextEditingController to save input text in it
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();

  /// Focus node to shift focus from one text field to
  /// another one, when clicked enter
   FocusNode _emailFocusNode = FocusNode();
   FocusNode _passwordFocusNode = FocusNode();

   /// ValueNotifier [built_in]  to listen to value changes
  /// Used for password visibility
  final ValueNotifier<bool> _isVisible = ValueNotifier<bool>(true);

  final ValueNotifier<int> _counter = ValueNotifier<int>(0);


  @override
  Widget build(BuildContext context) {
  print('build called...');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: _emailTextController,
            focusNode: _emailFocusNode,
            decoration: const InputDecoration(
              hintText: 'Enter email',
              label: Text('Email'),
              prefixIcon: Icon(Icons.alternate_email_rounded),
            ),
            onFieldSubmitted: (value){
              FocusScope.of(context).requestFocus(_passwordFocusNode);
            },
            onEditingComplete: (){
              print('Editing completed: ${_emailTextController}');
            },
          ),

          ValueListenableBuilder(
              valueListenable: _isVisible,
              builder: (context, value, child){
                return  TextFormField(
                  controller: _passwordTextController,
                  focusNode: _passwordFocusNode,
                  obscureText: _isVisible.value,
                  obscuringCharacter: '*',
                  decoration:  InputDecoration(
                    hintText: 'Enter password',
                    label: Text('Password'),
                    prefixIcon: Icon(Icons.lock_clock_outlined),
                    suffix: GestureDetector(
                        onTap: (){
                            _isVisible.value = !_isVisible.value;

                        },
                        child: Icon(_isVisible.value? Icons.visibility_off : Icons.visibility)),
                  ),
                  onFieldSubmitted: (value){
                    Utils.flutterToastMessage('done: $value');
                  },
                );
              },
          ),
          const SizedBox(height: 26,),

          RoundButton(
            title: 'Login',
            onPress: (){
              if(_emailTextController.text.isEmpty){
                Utils.flutterToastMessage('Email is required');
                Utils.flushBarErrorWidget(context, 'Email is empty');
              } else if(_emailTextController.text.contains('@')){
                Utils.flushBarErrorWidget(context, 'Yes contained: \'@\'');
              } else if (_passwordTextController.text.isEmpty){
                Utils.snackBarWidget(context, 'Password is required');
              } else if(_passwordTextController.text.length < 6){
                Utils.flushBarErrorWidget(context, 'password length must be greater the 6');
              } else{
                print('API call');
              }
            },


          ),


        ],
      ),

    );
  }
}