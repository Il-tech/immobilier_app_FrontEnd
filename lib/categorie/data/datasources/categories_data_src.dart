import 'package:immobilierApp/categorie/data/model/category.dart';

abstract class CategoryDataSource {
  Future<List<Category>> getCategoriesFromLocal();
}
