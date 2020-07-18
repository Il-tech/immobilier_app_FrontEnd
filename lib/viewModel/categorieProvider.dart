import 'package:flutter/material.dart';
import 'package:immobilierApp/models/category.dart';
import 'package:immobilierApp/services/webServices.dart';
import 'package:immobilierApp/viewmodel/categoryViewModel.dart';

class CategoryProvider with ChangeNotifier {
  List<CategoryViewModal> _categorie = List<CategoryViewModal>();
  List<CategoryViewModal> get cat => _categorie;
  void fetchCategories() async {
    List<Category> listCat = await Webservice().listCategories();
    print(listCat);
    _categorie = listCat.map((cat) => CategoryViewModal(cat)).toList();
    notifyListeners();
  }
}
