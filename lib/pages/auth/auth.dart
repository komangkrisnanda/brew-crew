import 'package:brew_crew/pages/auth/sign_in.dart';
import 'package:brew_crew/pages/auth/sign_up.dart';
import 'package:flutter/material.dart';

class Auth extends StatefulWidget{
  @override
  _AuthState createState() => _AuthState();
}

class _AuthState extends State<Auth>{

  bool showSignIn = true;
  void toggleView(){
    setState(() => showSignIn = !showSignIn);
  }


  @override
  Widget build(BuildContext context){
    if(showSignIn){
      return SignIn(toggleView: toggleView);
    }
    else{
      return SignUp(toggleView: toggleView);
    }
  }
}
