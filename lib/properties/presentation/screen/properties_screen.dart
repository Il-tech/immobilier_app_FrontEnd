import 'package:flutter/material.dart';
import 'package:immobilierApp/common_widgets/app_bar.dart';
import 'package:immobilierApp/properties/presentation/provider/filter_model.dart';
import 'package:immobilierApp/properties/presentation/provider/properties_model.dart';
import 'package:immobilierApp/common_widgets/app_drawer.dart';
import 'package:immobilierApp/properties/presentation/screen/Property_detail_screen.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:provider/provider.dart';

class ListProperty extends StatefulWidget {
  @override
  _ListPropertyState createState() => _ListPropertyState();
}

class _ListPropertyState extends State<ListProperty> {
  @override
  Widget build(BuildContext context) {
    final int idCat = ModalRoute.of(context).settings.arguments;

    return Scaffold(
        appBar: appBarWidget(context),
        drawer: AppDrawer(),
        backgroundColor: Color(0xFF376BFF),
        body: Consumer<PropertyModel>(builder: (context, model, child) {
          if (model.error != null) {
            return Container(child: Text(model.error));
          }
          model.searchByCat(idCat);
          return ListView(
            children: <Widget>[
              Center(
                child: Text("best deals",
                    style: TextStyle(
                        fontFamily: 'Poppins',
                        letterSpacing: 5,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17.0)),
              ),
              Padding(
                  padding:
                      EdgeInsets.only(top: 30, bottom: 30, left: 50, right: 10),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: Container(
                            height: 40,
                            alignment: Alignment.center,
                            child: TextField(
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Colors.white,
                                prefixIcon: Icon(Icons.search),
                                hintText: 'Search ...',
                                border: UnderlineInputBorder(),
                                enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: const Color(0xFF707070)),
                                    borderRadius: BorderRadius.circular(25.7)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10.0),
                      IconButton(
                        icon: Icon(Icons.filter_list, color: Colors.white),
                        tooltip: 'filtrer',
                        onPressed: () => {
                          Scaffold.of(context)
                              .showBottomSheet((context) => BottomSheet())
                        },
                      ),
                    ],
                  )),
              SizedBox(height: 10.0),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15.0),
                      topRight: Radius.circular(15.0)),
                ),
                child: ListView.builder(
                    itemCount: model.propertiesList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding:
                            const EdgeInsets.only(top: 15, right: 5, left: 5),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailProperty(
                                  property: model.propertiesList[index]),
                            ),
                          ),
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0)),
                            elevation: 5,
                            margin: const EdgeInsets.all(6),
                            color: Colors.white,
                            child: Column(
                              children: <Widget>[
                                new Stack(
                                  children: [
                                    SizedBox(
                                      height: 170,
                                      width: double.infinity,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.vertical(
                                            top: Radius.circular(15.0)),
                                        child: Image.asset(
                                          "assets/images/house.jpg",
                                          fit: BoxFit.fitWidth,
                                        ),
                                      ),
                                    ),
                                    new Positioned(
                                        left: 350,
                                        top: -4,
                                        child: new Icon(
                                          Icons.bookmark_border,
                                          color: Colors.white,
                                          size: 34,
                                        )),
                                    new Positioned(
                                      left: 135,
                                      top: 132,
                                      child: new Container(
                                        width: 135,
                                        height: 40,
                                        decoration: new BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: new BorderRadius.only(
                                                topLeft:
                                                    const Radius.circular(20.0),
                                                topRight: const Radius.circular(
                                                    20.0))),
                                        child: Center(
                                          child: new Text(
                                            (model.propertiesList[index].prix
                                                    .toString() +
                                                " DH"),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: Text(
                                              model.propertiesList[index].slug
                                                  .toUpperCase(),
                                              style: TextStyle(
                                                color: const Color(0xff707070),
                                                fontSize: 15,
                                                fontFamily: 'Poppins',
                                                height: 2.5,
                                                letterSpacing: 2,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ]),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_city,
                                              color: const Color(0xffD7D7DA),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  model.propertiesList[index]
                                                      .titre,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff707070),
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'PoppinsRegular',
                                                    height: 2.5,
                                                  )),
                                            ),
                                            Spacer(),
                                            Icon(
                                              Icons.location_city,
                                              color: const Color(0xffD7D7DA),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  model.propertiesList[index]
                                                      .titre,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff707070),
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'PoppinsRegular',
                                                    height: 2.5,
                                                  )),
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Icon(
                                              Icons.location_on,
                                              color: const Color(0xffD7D7DA),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Text(
                                                  model.propertiesList[index]
                                                              .adresse ==
                                                          null
                                                      ? "not available"
                                                      : model
                                                          .propertiesList[index]
                                                          .adresse,
                                                  style: TextStyle(
                                                    color:
                                                        const Color(0xff707070),
                                                    fontSize: 12,
                                                    fontFamily:
                                                        'PoppinsRegular',
                                                    height: 2,
                                                  )),
                                            ),
                                          ]),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Column(
                                        children: [
                                          Icon(Icons.local_hotel,
                                              color: const Color(0xff376BFF)),
                                          Text(
                                              model.propertiesList[index]
                                                          .nombre_chmbre
                                                          .toString() ==
                                                      null
                                                  ? "not available"
                                                  : model.propertiesList[index]
                                                      .nombre_chmbre
                                                      .toString(),
                                              style: TextStyle(
                                                color: const Color(0xff707070),
                                                fontSize: 12,
                                                fontFamily: 'PoppinsRegular',
                                                height: 2,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.weekend,
                                              color: const Color(0xff376BFF)),
                                          Text(
                                              model.propertiesList[index]
                                                          .nombre_chmbre
                                                          .toString() ==
                                                      null
                                                  ? "not available"
                                                  : model.propertiesList[index]
                                                      .nombre_chmbre
                                                      .toString(),
                                              style: TextStyle(
                                                color: const Color(0xff707070),
                                                fontSize: 12,
                                                fontFamily: 'PoppinsRegular',
                                                height: 2,
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Icon(Icons.business,
                                              color: const Color(0xff376BFF)),
                                          Text(
                                              model.propertiesList[index]
                                                          .nombre_facades
                                                          .toString() ==
                                                      null
                                                  ? "not available"
                                                  : model.propertiesList[index]
                                                      .nombre_facades
                                                      .toString(),
                                              style: TextStyle(
                                                color: const Color(0xff707070),
                                                fontSize: 12,
                                                fontFamily: 'PoppinsRegular',
                                                height: 2,
                                              )),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          );
        }));
  }
}

class BottomSheet extends StatefulWidget {
  BottomSheet({Key key}) : super(key: key);

  @override
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  @override
  Widget build(final BuildContext context) {
    return Consumer<FilterModel>(
      builder: (
        final BuildContext context,
        final FilterModel singleSelectCountry,
        final Widget child,
      ) {
        return Column(children: [
          Row(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text('recherche de propriétés',
                  style: TextStyle(
                    height: 3.0,
                    color: const Color(0xff707070),
                    fontSize: 17,
                    letterSpacing: 1,
                    fontWeight: FontWeight.w700,
                  )),
            ),
          ]),
          Container(
            // width: MediaQuery.of(context).size.width * 2,
            padding: EdgeInsets.only(
              left: 0,
              top: 20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                  ),
                ),
                DropdownButton<String>(
                  hint: const Text("le type de transaction"),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(),
                  style: TextStyle(
                    color: const Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PoppinsRegular',
                    height: 2,
                  ),
                  value: singleSelectCountry.selectedTransaction,
                  onChanged: (final String newValue) {
                    singleSelectCountry.selectedTransaction = newValue;
                  },
                  items:
                      singleSelectCountry.items.map<DropdownMenuItem<String>>(
                    (final String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
          Container(
            // width: MediaQuery.of(context).size.width * 2,
            padding: EdgeInsets.only(
              left: 0,
              top: 20,
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 50,
                  ),
                ),
                DropdownButton<String>(
                  hint: const Text("le type de transaction"),
                  iconSize: 24,
                  elevation: 16,
                  underline: Container(),
                  style: TextStyle(
                    color: const Color(0xff707070),
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'PoppinsRegular',
                    height: 2,
                  ),
                  value: singleSelectCountry.selectedTransaction,
                  onChanged: (final String newValue) {
                    singleSelectCountry.selectedTransaction = newValue;
                  },
                  items:
                      singleSelectCountry.items.map<DropdownMenuItem<String>>(
                    (final String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    },
                  ).toList(),
                ),
              ],
            ),
          ),
        ]);
      },
    );
  }
}
