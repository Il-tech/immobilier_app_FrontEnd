import 'package:flutter/material.dart';
import 'package:immobilierApp/screens/signIn.dart';
Widget appBarWidget(context) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Color(0xFF376BFF),
    automaticallyImplyLeading: true,
    centerTitle: true,
    title: Flexible(
      child: Center(
        // child: Text('FORT',
        //     style: TextStyle(
        //         fontFamily: 'Poppins',
        //         letterSpacing: 5,
        //         color: Colors.white,
        //         fontWeight: FontWeight.bold,
        //         fontSize: 17.0)),
      ),
    ),
    actions: <Widget>[
      IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => SignIn()),
          );
        },
        icon: Icon(
          Icons.account_circle,
          color: Colors.white,
          size: 30.0,
        ),
        color: Color(0xFF323232),
      ),
    ],
  );
}
