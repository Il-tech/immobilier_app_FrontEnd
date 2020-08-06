import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:immobilierApp/screens/signUp.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _password;
  String _email;
  bool _isSelected = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildEmail() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: 'Enter your email',
          suffixIcon: new Image.asset('assets/contact.png'),
          border: new UnderlineInputBorder(
              borderSide: new BorderSide(color: Colors.red))),
      validator: (String value) {
        if (value.isEmpty) {
          return 'Email is Required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (String value) {
        _email = value;
      },
    );
  }

  Widget _buildPassword() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Enter your password',
        suffixIcon: new Image.asset('assets/key.png'),
      ),
      keyboardType: TextInputType.visiblePassword,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Password is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _password = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            margin: EdgeInsets.only(top: 154, left: 25),
            height: double.infinity,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Welcome',
                      style: TextStyle(
                          color: const Color(0xff376BFF),
                          fontSize: 30,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold)),
                  Text("you're a new user? join us now!",
                      style: TextStyle(
                          color: const Color(0xff376BFF),
                          fontSize: 15,
                          fontFamily: 'PoppinsRegular',
                          height: 3)),
                  Padding(
                    padding: const EdgeInsets.only(top: 17),
                    child: SizedBox(
                      width: 352,
                      height: 60,
                      child: RaisedButton(
                        elevation: 9,
                        padding: EdgeInsets.symmetric(vertical: 10.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(28.0),
                            side: BorderSide(color: const Color(0xff376BFF))),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUp()));
                        },
                        color: const Color(0xff376BFF),
                        textColor: Colors.white,
                        child: Text("SIGN UP".toUpperCase(),
                            style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                height: 2,
                                letterSpacing: 2,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                  Form(
                    key: _formKey,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 50),
                          _buildEmail(),
                          SizedBox(height: 50),
                          _buildPassword(),
                          SizedBox(height: 50),
                          SizedBox(
                              width: 352,
                              height: 65,
                              child: RaisedButton(
                                  color: Colors.white,
                                  padding: EdgeInsets.symmetric(vertical: 10.0),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30.0),
                                      side: BorderSide(
                                          color: const Color(0xffD7D7DA))),
                                  child: Text('LOG IN',
                                      style: TextStyle(
                                          color: const Color(0xffD7D7DA),
                                          fontSize: 17,
                                          fontFamily: 'Poppins',
                                          height: 2,
                                          letterSpacing: 3,
                                          fontWeight: FontWeight.bold)),
                                  onPressed: () {
                                    if (!_formKey.currentState.validate()) {
                                      return;
                                    }
                                  })),
                        ],
                      ),
                    ),
                  ),
                ])));
  }
}
