import 'package:flutter/material.dart';

class Filter_Screen extends StatefulWidget {
  @override
  _Filter_Screen createState() => _Filter_Screen();
}

class _Filter_Screen extends State<Filter_Screen> {
  String _name;
  bool _isSelected = false;
  String _address;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildName() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _name = value;
      },
    );
  }

  Widget _buildAddress() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Name'),
      maxLength: 10,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Name is Required';
        }

        return null;
      },
      onSaved: (String value) {
        _address = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          title: Flexible(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  'Filtrer propriété',
                  style: TextStyle(height: 1),
                )),
          ),
          backgroundColor: const Color(0xff376BFF),
        ),
        body: Container(
            margin: EdgeInsets.all(20),
            height: double.infinity,
            child: Column(children: <Widget>[
              Card(
                  elevation: 20,
                  color: Colors.white,
                  child: Column(children: <Widget>[
                    Form(
                        key: _formKey,
                        child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(height: 20),
                                Text("Recherche de propriétés".toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 15,
                                        color: const Color(0xFF9A9A9C),
                                        fontFamily: 'Poppins',
                                        height: 2,
                                        letterSpacing: 2,
                                        fontWeight: FontWeight.normal)),
                                SizedBox(height: 20),
                                new DropdownButton<String>(
                                   hint: Text('Type du logement'),
                                    items: <String>['Ahvvvvvmed', 'Bvvvvvvvvvvvvv', 'Cvvvvvvvvvv', 'D']
                                        .map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value),
                                      );
                                    }).toList(),
                                    onChanged: (_) {}),
                                SizedBox(height: 10),
                                _buildAddress(),
                              ],
                            )))
                  ]))
            ])));
  }
}
