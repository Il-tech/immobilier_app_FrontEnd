import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Center(child: Text("Menu")),
            backgroundColor: const Color(0xff376BFF),
            automaticallyImplyLeading: false,
          ),
          DrawerHeader(
            child: Image.asset("assets/images/dropDownMenu.png",
                fit: BoxFit.cover),
          ),
          ListTile(
            leading: Icon(
              Icons.verified_user,
              color: const Color(0xffD7D7DA),
            ),
            title: Text(
              "Login",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'PoppinsRegular',
                height: 2,
                letterSpacing: 2,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("Se connecter");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.person_add,
              color: const Color(0xffD7D7DA),
            ),
            title: Text(
              "S'inscrire",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'PoppinsRegular',
                height: 2,
                letterSpacing: 2,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("propertyList");
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.store,
              color: const Color(0xffD7D7DA),
            ),
            title: Text(
              "Categories",
              style: TextStyle(
                fontSize: 16,
                fontFamily: 'PoppinsRegular',
                height: 2,
                letterSpacing: 2,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed("/");
            },
          ),
        ],
      ),
    );
  }
}
