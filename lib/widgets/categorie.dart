import 'package:flutter/material.dart';
import 'package:immobilierApp/services/serviceLocator.dart';
import 'package:immobilierApp/viewmodel/categorieProvider.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatefulWidget {
  @override
  ListCategory_State createState() => ListCategory_State();
}

// ignore: camel_case_types
class ListCategory_State extends State<ListCategory> {
  CategoryProvider model = serviceLocator<CategoryProvider>();
  @override
  void initState() {
    model.fetchCategories();
    super.initState();
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
                  'Categorie',
                  style: TextStyle(height: 1),
                )),
          ),
          backgroundColor: const Color(0xff376BFF),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: buildGridView(model),
    );
  }
}

Widget buildGridView(CategoryProvider viewModel) {
  return ChangeNotifierProvider<CategoryProvider>(
      create: (context) => viewModel,
      child: Consumer<CategoryProvider>(
          builder: (context, model, child) => GridView.count(
                crossAxisCount: 2,
                padding: const EdgeInsets.all(15),
                mainAxisSpacing: 18,
                children: List.generate(model.cat.length, (index) {
                  return Container(
                      child: Card(
                          elevation: 5,
                          margin: const EdgeInsets.all(6),
                          color: Colors.white,
                          child: Column(
                            children: <Widget>[
                              SizedBox(
                                height: 120,
                                width: 400,
                                child: Image.asset(model.cat[index].image),
                              ),
                              Text(model.cat[index].type,
                                  style: TextStyle(
                                    color: const Color(0xffD7D7DA),
                                    fontSize: 12,
                                    fontFamily: 'Poppins',
                                    height: 2,
                                    letterSpacing: 1,
                                  ))
                            ],
                          )));
                }),
              )));
}
