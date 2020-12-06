import 'package:dress_life/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'login_screen.dart';
import 'package:dress_life/utils/constants.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor:
      SystemUiOverlayStyle.dark.systemNavigationBarColor,
    ),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Firebase.initializeApp(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                title: Constants.LOGIN,
                initialRoute: LoginScreen.id,
                routes:{
                  LoginScreen.id : (context) => LoginScreen(),
                  RegistrationScreen.id : (context) => RegistrationScreen(),
                }
            );
          } else{
            return CircularProgressIndicator();
          }
        }
    );
  }
}
