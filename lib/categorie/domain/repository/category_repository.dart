import 'package:immobilierApp/categorie/data/model/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}
