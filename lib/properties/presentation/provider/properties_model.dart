import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:immobilierApp/properties/data/model/features/features.dart';
import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/data/model/user.dart';
import 'package:immobilierApp/properties/domain/usecases/get_all.dart';
import 'package:immobilierApp/properties/domain/usecases/get_current_user.dart';
import 'package:immobilierApp/properties/domain/usecases/get_features.dart';
import 'package:immobilierApp/properties/domain/usecases/get_properties.dart';
import 'package:immobilierApp/properties/domain/usecases/get_property_by_id.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class PropertyModel extends ChangeNotifier {
  GetProperties getProperties;
  GetAll allProperties;
  GetFeatures getFeatures;
  GetById propertybyId;
  GetUser getUser;
  String _error;
  String get error => _error;
  int _id;

  int get id => _id;

  set idSet(int id) {
    _id = id;
  }

  final List<Property> _properties = [];

  final List<Property> _favorites = [];

  final List<Property> _allProperties = [];

  final List<Property> _favoritesDisplay = [];

  UnmodifiableListView<Property> get propertiesList =>
      UnmodifiableListView(_properties);

  UnmodifiableListView<Property> get favoriteList =>
      UnmodifiableListView(_favoritesDisplay);

  final List<Features> _features = [];

  UnmodifiableListView<Features> get featuresList =>
      UnmodifiableListView(_features);

  final List<User> _userList = [];

  UnmodifiableListView<User> get userList => UnmodifiableListView(_userList);

  PropertyModel(this.getProperties, this.getFeatures, this.getUser,
      this.allProperties, this.propertybyId) {
    findAll();
  }

  void findAll() async {
    final result = await allProperties();
    _allProperties
      ..clear()
      ..addAll(result);
    notifyListeners();
  }

  void searchByCat(int keyWord) async {
    final result = await getProperties(keyWord);
    print(result);
    if (result == null) {
      _handleError('Something failed !');
      return;
    }
    _handleChange(result);
  }

  void searchByIdforFavorites() async {
    findAll();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _allProperties.forEach((element) {
      if (element.id == prefs.getInt(element.titre)) {
        if (!_favoritesDisplay.contains(element))
          _favoritesDisplay.add(element);
      }
    });
    notifyListeners();
    if (_favoritesDisplay == null) {
      _handleError('Something failed !');
    }
    _error = null;
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

  bool getFavoriteStatus(int id) {
    for (Property property in _favorites) {
      if (id == property.id) {
        return true;
      }
    }
    return false;
  }

  void toggleFavoriteStatus(Property element, bool isFavorite) {
    final toggleFavorite = !isFavorite;
    if (toggleFavorite) {
      addToFavorites(element);
    } else {
      removeFromFavorites(element);
    }
    notifyListeners();
  }

  void addToFavorites(Property element) async {
    _favorites.add(element);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    for (Property p in _favorites) {
      await prefs.setInt(p.titre, p.id);
    }
  }

  void removeFromFavorites(Property element) async {
    _favorites.remove(element);
    _favoritesDisplay.remove(element);
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(element.titre);
    notifyListeners();
  }
}
