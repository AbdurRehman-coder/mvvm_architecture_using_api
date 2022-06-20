
import 'package:flutter/material.dart';
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

          SizedBox(height: 16,),

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
          SizedBox(height: 16,),
          ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child){
                return Text(_counter.value.toString(), style: Theme.of(context).textTheme.titleMedium,);
              },),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _counter.value++;
        },
      ),
    );
  }
}