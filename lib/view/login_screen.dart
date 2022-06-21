
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled/resources/components/round_button.dart';
import 'package:untitled/utils/general_utils.dart';
import 'package:untitled/view_model/auth_view_model.dart';


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
    final authViewModel = Provider.of<AuthViewModel>(context);
  print('build called...');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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

            ValueListenableBuilder<bool>(
                valueListenable: _isVisible,
                builder: (context, snap, child){
                  return  TextFormField(
                    controller: _passwordTextController,
                    focusNode: _passwordFocusNode,
                    obscureText: snap,
                    obscuringCharacter: '*',
                    decoration:  InputDecoration(
                      hintText: 'Enter password',
                      label: Text('Password'),
                      prefixIcon: Icon(Icons.lock_clock_outlined),
                      suffix: GestureDetector(
                          onTap: (){
                              _isVisible.value = !_isVisible.value;
                            // snap = !snap;

                          },
                          child: Icon( snap ? Icons.visibility_off : Icons.visibility)),
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
              isLoading: authViewModel.isLoading,
              onPress: (){
                /// Encode email and password into Map body
                Map body = {
                  'email' : _emailTextController.text,
                  'password' : _passwordTextController.text,
                };
                if(_emailTextController.text.isEmpty){
                  Utils.flutterToastMessage('Email is required');
                  Utils.flushBarErrorWidget(context, 'Email is empty');
                }  else if (_passwordTextController.text.isEmpty){
                  Utils.snackBarWidget(context, 'Password is required');
                } else if(_passwordTextController.text.length < 6){
                  Utils.flushBarErrorWidget(context, 'password length must be greater the 6');
                } else{
                  print('API call');
                  authViewModel.postApiService(body, context);
                }
              },


            ),


          ],
        ),
      ),

    );
  }
}