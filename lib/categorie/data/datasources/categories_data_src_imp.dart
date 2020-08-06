import 'package:immobilierApp/categorie/data/datasources/categories_data_src.dart';
import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;

@lazySingleton
class CategoryDataSourceImpl implements CategoryDataSource {
  Category categorie;
  List<Category> articles = List<Category>();
  Future<List<Category>> getCategoriesFromLocal() async {
    try {
      String response =
          await rootBundle.loadString('assets/jsonFiles/Categories.json');
      final results = jsonDecode(response);
      Iterable list = results["Categories"];
      return list.map((categorie) => Category.fromJson(categorie)).toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
