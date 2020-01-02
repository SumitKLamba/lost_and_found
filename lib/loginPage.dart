import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'dashboard.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Color(0xFF57606F),
        child: ListView(
          children: <Widget>[
            Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    margin: EdgeInsets.all(90),
                    height: 220,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/app_bar_icon.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          '!Found',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 64,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 4
                          ),
                        ),
                        Text(
                          'All your Stuff Here!',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 4
                          ),
                        ),
                      ],
                    )
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 1.2,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          validator: (input){
                            if(input.isEmpty){
                              return 'Please Type an Email';
                            }
                          },
                          onSaved: (input) {
                            _email = input;
                          },
                          keyboardType: TextInputType.emailAddress,
                          autocorrect: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          validator: (input){
                            if(input.isEmpty){
                              return 'Please Type an Email';
                            }else if(input.length < 6){
                              return 'Password is too short';
                            }
                          },
                          onSaved: (input) {
                            _password = input;
                          },
                          autocorrect: false,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: 'Password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        RawMaterialButton(
                          fillColor: Colors.green,
                          constraints: BoxConstraints(
                            minWidth: MediaQuery.of(context).size.width / 2.5,
                            minHeight: 50,
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(12.0)),
                          onPressed: signIn,
                          child: Text(
                            'Sign In',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          "Don't have account? Sign Up",
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        AuthResult user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context)=> DashBoard()));
      }catch(e){
        print(e.message);
      }
    }
  }
}
