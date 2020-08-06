import 'package:immobilierApp/categorie/data/datasources/categories_data_src_imp.dart';
import 'package:injectable/injectable.dart';
import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:immobilierApp/categorie/domain/repository/category_repository.dart';

@LazySingleton(as: CategoryRepository)
class CategorieRepositoryImp implements CategoryRepository {
  final CategoryDataSourceImpl categorieDataSource;
  CategorieRepositoryImp(this.categorieDataSource);
  List<Category> categoryList;
  Future<void> _initCategories() async {
    categoryList =
        categoryList ?? await categorieDataSource.getCategoriesFromLocal();
  }

  @override
  Future<List<Category>> getCategories() async {
    await _initCategories();
    return this.categoryList;
  }
}
