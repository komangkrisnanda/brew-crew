import 'package:brew_crew/pages/services/auth.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {

  final Function toggleView;
  SignUp({ this.toggleView });

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[100],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          elevation: 0.0,
          title: Text('Sign up to Brew Crew'),
            actions: <Widget>[
              FlatButton.icon(
                  icon: Icon(Icons.person),
                  label: Text('Sign In'),
                  onPressed: () {
                    widget.toggleView();
                  }
              )
            ]
        ),
        body: Container(
            padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50),
            child: Form(
                key: _formKey,
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 20.0),
                      TextFormField(
                          validator: (val) => val.isEmpty ? 'Enter an email' : null,
                          onChanged: (val){
                            setState(() => email = val);
                          }
                      ),
                      SizedBox(height: 20.0),
                      TextFormField(
                          validator: (val) => val.length < 6 ? 'Enter a minimum 6 length of password' : null,
                          obscureText: true,
                          onChanged: (val){
                            setState(() => password = val);
                          }
                      ),
                      SizedBox(height: 20.0),
                      RaisedButton(
                        color: Colors.pink[400],
                        child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white)
                        ),
                        onPressed: () async {
                            if(_formKey.currentState.validate()){
                                print(email);
                                print(password);

                                dynamic result = await _auth.registerWithEmailAndPassword(email, password);

                                if(result == null){
                                    setState(() => error = 'Please supply a valid email');
                                }

                            }
                            else{

                            }
                        },
                      ),
                      SizedBox(height: 12.0),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.0),
                      )
                    ]
                )
            )
        )
    );
  }
}
