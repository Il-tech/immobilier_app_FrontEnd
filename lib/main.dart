import 'package:flutter/material.dart';
import 'package:immobilierApp/widgets/categorie.dart';
import 'package:immobilierApp/services/serviceLocator.dart';
import 'package:immobilierApp/widgets/signIn.dart';
import 'package:immobilierApp/widgets/signUp.dart';

void main() {
  setupServiceLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xf5f5f5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => ListCategory(),
        'Login': (context) => SignIn(),
        'SignUp': (context) => SignUp(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
          brightness: Brightness.light,
          primaryColor: const Color(0xff376BFF),
          accentColor: Colors.white,
          fontFamily: 'Poppins',
        ),
        home: MyApp());
  }
}
