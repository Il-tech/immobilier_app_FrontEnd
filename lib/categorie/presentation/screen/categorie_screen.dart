import 'package:flutter/material.dart';
import 'package:immobilierApp/categorie/presentation/provider/categorie_model.dart';
import 'package:immobilierApp/common_widgets/app_bar.dart';
import 'package:immobilierApp/config/injectable_dependecies.dart';
import 'package:immobilierApp/properties/presentation/provider/PropertiesModel.dart';
import 'package:immobilierApp/properties/presentation/screen/PropertiesScreen.dart';
import 'package:immobilierApp/screens/filterScreen.dart';
import 'package:immobilierApp/common_widgets/app_drawer.dart';
import 'package:provider/provider.dart';

class ListCategory extends StatefulWidget {
  @override
  ListCategory_State createState() => ListCategory_State();
}

// ignore: camel_case_types
class ListCategory_State extends State<ListCategory> {
  GetCategoriesModel model = getIt<GetCategoriesModel>();
  @override
  void initState() {
    model.getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarWidget(context),
      drawer: AppDrawer(),
      body: buildGridView(model),
    );
  }
}

Widget buildGridView(GetCategoriesModel viewModel) {
  return ChangeNotifierProvider<GetCategoriesModel>(
    create: (context) => viewModel,
    child: Consumer<GetCategoriesModel>(
        builder: (context, model, child) => GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(15),
              mainAxisSpacing: 18,
              children: List.generate(model.categories.length, (index) {
                return Container(
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ListProperty(),
                            settings: RouteSettings(
                                arguments: model.categories[index].id)),
                      );
                    },
                    child: Card(
                      elevation: 5,
                      margin: const EdgeInsets.all(6),
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 120,
                            width: 400,
                            child: Image.asset(model.categories[index].image),
                          ),
                          Text(model.categories[index].type,
                              style: TextStyle(
                                color: const Color(0xffD7D7DA),
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                height: 2,
                                letterSpacing: 1,
                              ))
                        ],
                      ),
                    ),
                  ),
                );
              }),
            )),
  );
}
