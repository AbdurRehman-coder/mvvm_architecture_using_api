import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:untitled/repository/auth_repository.dart';
import 'package:untitled/utils/general_utils.dart';

class AuthViewModel extends ChangeNotifier{

  /// bool for showing indicator while loading data from server
    bool _isLoading = false;
   /// getter
   bool get isLoading => _isLoading;
   /// setting loading
   setLoading(bool value){
     _isLoading = value;
     notifyListeners();
   }

  final AuthRepository repositoryService = AuthRepository();
   /// Trigger the postApi method in AuthRepository and then from
    /// AuthRepository it will trigger the main Network class post method
  Future<dynamic> postApiService(dynamic body, BuildContext context) async{
    setLoading(true);
    await repositoryService.postApi(body).then((value) {
      setLoading(false);
      Utils.flushBarErrorWidget(context, 'Login Successfully');
      if(kDebugMode){
        print('view model response value: ${value}');
      }
    }).onError((error, stackTrace){
      setLoading(false);
      print('Error: :${error}');
      Utils.flushBarErrorWidget(context, error.toString());
      Utils.snackBarWidget(context, error.toString());
    });
  }
}