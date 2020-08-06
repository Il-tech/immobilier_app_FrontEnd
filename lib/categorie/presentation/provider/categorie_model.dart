import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:injectable/injectable.dart';
import 'package:immobilierApp/categorie/domain/usecases/get_categories.dart';
@injectable
class GetCategoriesModel extends ChangeNotifier {
  GetCategories getCategories;
  // List<Category> get cat => get;
  final List<Category> _cateogriesList = [];
  String _error;
  String get error => _error;
  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_cateogriesList);
  GetCategoriesModel(this.getCategories) {
    initProvider();
  }
  void initProvider() async {
    List<Category> result = await getCategories();
    _handleChange(result);
    if (result == null) {
      _handleError("error babe");
    }
    notifyListeners();
  }

  void _handleChange(List<Category> result) {
    _cateogriesList
      ..clear()
      ..addAll(result);
  }

  void _handleError(String message) {
    _error = "Failed to retrieve data from server";
    notifyListeners();
  }
}
