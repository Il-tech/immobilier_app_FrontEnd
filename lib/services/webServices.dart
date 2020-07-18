import 'dart:convert';
import 'package:immobilierApp/models/category.dart';
import 'package:flutter/services.dart' show rootBundle;

class Webservice {
  Category categorie;
  List<Category> articles = List<Category>();


    Future<List<Category>> listCategories() async {
      try {
        String response;
        response =
            await rootBundle.loadString('assets/jsonFiles/Categories.json');
        final results = jsonDecode(response);
        Iterable list = results["Categories"];
        return list.map((categorie) => Category.fromJson(categorie)).toList();
      } catch (e) {

      }
    }
  
}
