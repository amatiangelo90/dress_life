import 'package:dress_life/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:dress_life/utils/constants.dart';

class LoginScreen extends StatelessWidget {
  static const id = '/';
  final _auth = FirebaseAuth.instance;
  UserCredential registeredUser;
  UserCredential loggedInUser;

  Widget build(BuildContext context) {

    return FlutterLogin(
      title: '',
      logo: 'images/appstore.png',
      theme: LoginTheme(
          primaryColor: Colors.black,
          accentColor: Colors.black,
          bodyStyle: TextStyle(
            color: Colors.teal,
          )),
      emailValidator: (value) {
        if (!value.contains('@') || !value.endsWith('.com')) {
          return Constants.ERROR_0000_WRONG_EMAIL;
        }
        return null;
      },
      passwordValidator: (value) {
        if (value.isEmpty) {
          return Constants.ERROR_0001_EMPTY_EMAIL;
        }
        if(value.length < 6){
          return Constants.ERROR_0003_6_CHAR_MIN_PASS;
        }
        return null;
      },
      onLogin: (loginData) async {
        return _signInUser(loginData);
      },
      onSignup: (loginData) async {
        return _createUser(loginData);
      },
      onSubmitAnimationCompleted: (){
        if(registeredUser != null){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        }else
        {
          print('asdasdasd');
        }
        if(loggedInUser != null){
          Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ));
        }else
        {
          print('asdasdasd');
        }
      },
      onRecoverPassword: (name) {
        return _recoverPassword(name);
      },
    );
  }

  Future<String> _signInUser(LoginData data) async {
    try{
      loggedInUser = await _auth.signInWithEmailAndPassword(
          email: data.name,
          password: data.password);
      return null;
    }catch(e){
      return Constants.ERROR_0003_USER_OR_PASS_WRONG;
    }
  }

  Future<String> _createUser(LoginData data) async {
    try{
      registeredUser = await _auth.createUserWithEmailAndPassword(
          email: data.name,
          password: data.password);
      return null;
    }catch(e){
      print(e);
      return Constants.ERROR_0003_USER_OR_PASS_WRONG;;
    }
  }

  Future<String> _recoverPassword(String name) {
    return null;
  }
}
