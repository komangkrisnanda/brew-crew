import 'package:brew_crew/pages/auth/auth.dart';
import 'package:brew_crew/pages/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:brew_crew/models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print(user);

    // return either Home or Auth widget
    if(user == null){
      return Auth();
    }
    else{
      return Home();
    }
  }
}
