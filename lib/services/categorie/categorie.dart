import 'package:flutter/material.dart';

class CategorieScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
          child: GridView.count(
        crossAxisCount: 2,
        children: List.generate(50, (index) {
          return Container(
            child: Card(
              color: Colors.blue,
              
            ),
          );
        }),
      ),
    );
  }
}
