import 'package:cropmedic/Register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'MainPage.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _email, _password;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
          key: _formKey,
          child: SingleChildScrollView(
              child: Column(
            children: <Widget>[
              // Image(
              //   image: AssetImage("assets/def.png"),
              //   fit: BoxFit.fitHeight,
              // ),
              SizedBox(
                height: 200,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f3),
                  filled: true,
                  labelText: "Email ID",
                  prefixIcon:
                      Icon(Icons.email, color: Colors.blue.shade700),
                ),
                validator: validateEmail,
                autovalidate: false,
                onSaved: (input) => _email = input,
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: validatePassword,
                onSaved: (input) => _password = input,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  fillColor: Color(0xfff3f3f4),
                  filled: true,
                  labelText: "Password",
                  prefixIcon: Icon(
                    Icons.lock,
                    color: Colors.blue.shade700,
                  ),
                ),
                obscureText: true,
              ),
              SizedBox(
                height: 30,
              ),
              SizedBox(
                  height: 50,
                  width: 380,
                  child: RaisedButton(
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(10.0),
                        side: BorderSide(color: Colors.blue.shade700)),
                    onPressed: signIn,
                    color: Colors.blue.shade700,
                    textColor: Colors.white,
                    child: Text("Sign In".toUpperCase(),
                        style: TextStyle(fontSize: 16)),
                  )),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                alignment: Alignment.bottomCenter,
                child: Center(
                    child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 95,
                    ),
                    Text(
                      'Don\'t have an account ?',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Register()));
                      },
                      child: Text(
                        'Register',
                        style: TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 16,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                )),
              ),
              SizedBox(
                height: 60.0,
                width: 100.0,
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                },
                child: Text(
                  'Skip', 
                  textAlign: TextAlign.end,
                  style: TextStyle(color: Colors.black, fontSize: 18.0),
                ),
              ),
            ],
          )
          )
          )
    );
  }

  // Firebase authentication
  Future<void> signIn() async {
    final formState = _formKey.currentState;
    if (formState.validate()) {
      formState.save();
      try {
        AuthResult user = await FirebaseAuth.instance
            .signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MainPage()));
      } catch (e) {
        print(e.message);
      }
    }
  }

  // Email Validation
  String validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}'
        r'\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (value.isEmpty) {
      return 'Please enter the email address';
    } else if (!regex.hasMatch(value)) {
      return 'Invalid Email! Please Enter the Valid Email address';
    }
  }

  // Password length Validation
  String validatePassword(String value) {
    if (value.isEmpty) {
      return ' Please enter the Password';
    } else if (value.length < 6) {
      return "Your password needs to be atleast 6 characters";
    }
  }
}
