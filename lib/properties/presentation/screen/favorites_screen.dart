import 'package:flutter/material.dart';
import 'package:immobilierApp/common_widgets/app_bar.dart';
import 'package:immobilierApp/common_widgets/app_drawer.dart';
import 'package:immobilierApp/properties/presentation/provider/properties_model.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
  static const String routeName = '/favoriteScreen';
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool isFavorite;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBarWidget(context),
        drawer: AppDrawer(),
        backgroundColor: Colors.white,
        body: Consumer<PropertyModel>(
          builder: (context, model, child) {
            if (model.error != null) {
              return Container(child: Text(model.error));
            }
            model.searchByIdforFavorites();

            return Column(children: [
              Row(children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.only(left: 32),
                  child: Text('Liste des favories',
                      style: TextStyle(
                        height: 3.0,
                        color: const Color(0xff707070),
                        fontSize: 15.2,
                        fontWeight: FontWeight.bold,
                      )),
                )),
              ]),
              Expanded(
                  child: Container(
                child: ListView.builder(
                  itemCount: model.favoriteList.length,
                  padding: const EdgeInsets.all(16),
                  itemBuilder: (context, index) {
                    return Container(
                      height: 100,
                      child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            ListTile(
                              title: Text(model.propertiesList[index].slug,
                                  style:
                                      TextStyle(fontWeight: FontWeight.w500)),
                              subtitle: Padding(
                                padding: const EdgeInsets.only(top: 16.0),
                                child:
                                    Text(model.propertiesList[index].adresse),
                              ),
                              leading: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: ConstrainedBox(
                                  constraints: BoxConstraints(
                                    minWidth: 44,
                                    minHeight: 44,
                                    maxWidth: 50,
                                    maxHeight: 50,
                                  ),
                                  child: Image.asset("assets/images/house.png",
                                      fit: BoxFit.cover),
                                ),
                              ),
                              trailing: Icon(
                                Icons.favorite,
                                color: Colors.red[200],
                              ),
                              onLongPress: () => {
                                setState(() {
                                  model.removeFromFavorites(
                                      model.favoriteList[index]);
                                })
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ))
            ]);
          },
        ));
  }
}
