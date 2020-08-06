import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:immobilierApp/properties/data/model/features/features.dart';
import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/data/model/user.dart';
import 'package:immobilierApp/properties/domain/usecases/get_current_user.dart';
import 'package:immobilierApp/properties/domain/usecases/get_features.dart';
import 'package:immobilierApp/properties/domain/usecases/get_properties.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@injectable
class PropertyModel extends ChangeNotifier {
  GetProperties getProperties;
  GetFeatures getFeatures;
  GetUser getUser;
  String _error;
  String get error => _error;
  int _id;

  int get id => _id;

  set idSet(int id) {
    _id = id;
  }

  final List<Property> _properties = [];
  UnmodifiableListView<Property> get propertiesList =>
      UnmodifiableListView(_properties);
  final List<Features> _features = [];
  UnmodifiableListView<Features> get featuresList =>
      UnmodifiableListView(_features);
  final List<User> _userList = [];
  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);
  PropertyModel(this.getProperties, this.getFeatures, this.getUser) {
    initProvider();
  }

  void initProvider() async {}

  void searchByCat(int keyWord) async {
    final result = await getProperties(keyWord);
    if (result == null) {
      _handleError('Something failed !');
      return;
    }
    _handleChange(result);
  }

  void findFeatures(int keyWord) async {
    final features = await getFeatures(keyWord);
    final filtered = features
        .where((element) => element.feature_value == "available")
        .toList();
    if (filtered == null) {
      _handleError('Something failed !');
      return;
    }
    _features
      ..clear()
      ..addAll(filtered);
    _error = null;
    notifyListeners();
  }

  void getCurrentUser(int keyWord) async {
    final User currentUser = await getUser(keyWord);
    if (currentUser == null) {
      _handleError('Something failed !');
      return;
    }
    _userList
      ..clear()
      ..add(currentUser);
    _error = null;
    notifyListeners();
  }

  void _handleError(String s) {
    _error = "Failed to retrieve data from server";

    notifyListeners();
  }

  void _handleChange(List<Property> result) {
    _properties
      ..clear()
      ..addAll(result);

    _error = null;

    notifyListeners();
  }
}
