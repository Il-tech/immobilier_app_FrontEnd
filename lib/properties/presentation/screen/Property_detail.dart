import 'package:flutter/material.dart';
import 'package:immobilierApp/common_widgets/app_bar.dart';
import 'package:immobilierApp/common_widgets/app_drawer.dart';
import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/presentation/provider/PropertiesModel.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailProperty extends StatefulWidget {
  final Property property;

  DetailProperty({Key key, @required this.property}) : super(key: key);

  @override
  _DetailPropertyState createState() => _DetailPropertyState();
}

class _DetailPropertyState extends State<DetailProperty> {
  Future<void> _launched;

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBarWidget(context),
        drawer: AppDrawer(),
        body: Consumer<PropertyModel>(builder: (context, model, child) {
          model.findFeatures(this.widget.property.id);
          model.getCurrentUser(this.widget.property.id);
          return ListView(children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                elevation: 5,
                color: Colors.white,
                child: Column(
                  children: <Widget>[
                    new Stack(children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(40.0)),
                          child: Image.asset(
                            "assets/images/" + this.widget.property.imageHeader,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ]),
                    Container(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, right: 8),
                                  child: Text("Description",
                                      style: TextStyle(
                                        color: const Color(0xff707070),
                                        fontSize: 15,
                                        fontFamily: 'Poppins',
                                        height: 3,
                                      )))
                            ]),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 16, left: 16),
                              child: Text(
                                  widget.property.titre == null
                                      ? "not available"
                                      : widget.property.slug,
                                  style: TextStyle(
                                    color: const Color(0xff707070),
                                    fontSize: 17,
                                    fontFamily: 'PoppinsRegular',
                                    height: 3,
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16),
                                child: Text(
                                    widget.property.adresse == null
                                        ? "not available"
                                        : widget.property.adresse,
                                    style: TextStyle(
                                      color: const Color(0xff707070),
                                      fontSize: 15,
                                      fontFamily: 'PoppinsRegular',
                                      height: 3,
                                    )),
                              ),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: 16, top: 6),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.9,
                                    child: Text(
                                      widget.property.description == null
                                          ? "not available"
                                          : widget.property.description,
                                      style: TextStyle(
                                        color: const Color(0xff707070),
                                        fontSize: 12,
                                        letterSpacing: 1,
                                        fontFamily: 'PoppinsRegular',
                                        height: 1.5,
                                      ),
                                      textAlign: TextAlign.justify,
                                    ),
                                  )),
                            ]),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 8),
                                child: Icon(
                                  Icons.location_city,
                                  color: const Color(0xffD7D7DA),
                                ),
                              ),
                              Text(
                                  widget.property.ville == null
                                      ? "not available"
                                      : widget.property.ville,
                                  style: TextStyle(
                                    color: const Color(0xff707070),
                                    fontSize: 15,
                                    fontFamily: 'PoppinsRegular',
                                    height: 3,
                                  )),
                              Spacer(),
                              Icon(
                                Icons.calendar_today,
                                color: const Color(0xffD7D7DA),
                              ),
                              Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                      widget.property.renewed_at.toString(),
                                      style: TextStyle(
                                        color: const Color(0xff707070),
                                        fontSize: 12,
                                        fontFamily: 'PoppinsRegular',
                                        height: 2.5,
                                      ))),
                            ]),
                      ],
                    )),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 16, right: 8),
                          child: Text("Equipements :",
                              style: TextStyle(
                                color: const Color(0xff707070),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                height: 3,
                              )))
                    ]),
                    Container(
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 16, left: 16, right: 16, bottom: 0),
                        child: GridView.count(
                          crossAxisCount: 3,
                          children:
                              List.generate(model.featuresList.length, (index) {
                            return Card(
                              elevation: 0,
                              color: Colors.white,
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    child: Icon(
                                      Icons.check,
                                      color: const Color(0xffD7D7DA),
                                    ),
                                  ),
                                  Center(
                                    child: Text(
                                        model.featuresList[index].feature_name,
                                        style: TextStyle(
                                          color: const Color(0xff707070),
                                          fontSize: 12,
                                          fontFamily: 'PoppinsRegular',
                                          height: 2,
                                          letterSpacing: 1,
                                        )),
                                  ),
                                ],
                              ),
                            );
                          }),
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                      Padding(
                          padding: const EdgeInsets.only(left: 16, right: 8),
                          child: Text("Propriétaire :",
                              style: TextStyle(
                                color: const Color(0xff707070),
                                fontSize: 15,
                                fontFamily: 'Poppins',
                                height: 3,
                              )))
                    ]),
                    Divider(),
                    Container(
                        child: Card(
                      elevation: 1,
                      color: Colors.white,
                      child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 200,
                            width: 450,
                            child: Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(50.0),
                                        child: new Image.asset(
                                          "assets/images/" +
                                              this.widget.property.imageHeader,
                                          width: 100.0,
                                          height: 100.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.perm_identity,
                                            color: const Color(0xffD7D7DA),
                                          ),
                                          Text(model.userList[0].name,
                                              style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'PoppinsRegular',
                                                height: 2,
                                                letterSpacing: 1,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.location_on,
                                            color: const Color(0xffD7D7DA),
                                          ),
                                          Container(
                                            width: 200,
                                            child: Expanded(
                                              child: Text(
                                                model.userList[0].adresse ==
                                                        null
                                                    ? "there is no address "
                                                    : model.userList[0].adresse,
                                                textAlign: TextAlign.justify,
                                                maxLines: 4,
                                                style: TextStyle(
                                                  fontSize: 12,
                                                  fontFamily: 'PoppinsRegular',
                                                  height: 2,
                                                  letterSpacing: 1,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ),
                                          ),
                                          Divider(),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Row(
                                        children: [
                                          Container(
                                              width: 200,
                                              child: Expanded(
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15, right: 15),
                                                  child: Center(
                                                    child: RaisedButton(
                                                      onPressed: () =>
                                                          setState(() {
                                                        _launched = _makePhoneCall(
                                                            "tel:" +
                                                                model
                                                                    .userList[0]
                                                                    .telephone);
                                                      }),
                                                      child: Center(
                                                        child: const Text(
                                                          'Make phone call',
                                                          style: TextStyle(
                                                            fontSize: 12,
                                                            fontFamily:
                                                                'PoppinsRegular',
                                                            height: 2,
                                                            letterSpacing: 1,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              )),
                                          Divider(),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                  ],
                ))
          ]);
        }));
  }
}
