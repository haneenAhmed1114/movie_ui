import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:movie_app/firebase/firebase_services.dart';
import 'package:movie_app/movies/model_view/user_model.dart';

class UserProvider extends ChangeNotifier{
  UserModel?userModel;
  bool loading = false;
  bool islogin= false;
  Future login(String email,String password)async{
    try{
      loading =true;
      notifyListeners();
      userModel =await FirebaseServices.login(email,password);
      loading =false;
      islogin=true;
      notifyListeners();
    }
    catch (e) {
      loading = false;
      islogin = false;
      notifyListeners();
      Fluttertoast.showToast(
          msg: "Invalid email or password",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
   Future signup(UserModel userModel, String password) async {
    try {
      loading = true;
      notifyListeners();
      userModel = await FirebaseServices.signup(userModel, password);
      loading = false;
      islogin = true;
      notifyListeners();
    } catch (e) {
      loading = false;
      islogin = false;
      notifyListeners();
      Fluttertoast.showToast(
          msg: "Invalid email or password or name",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }
    }

  

