import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:injectable/injectable.dart';
import 'package:immobilierApp/categorie/domain/repository/category_repository.dart';

@lazySingleton
class GetCategories {
  final CategoryRepository categoryRepository;
  GetCategories(this.categoryRepository);
  Future<List<Category>> call() async {
    List<Category> listCat = await categoryRepository.getCategories();
    listCat = listCat.map((cat) => (cat)).toList();
    return listCat;
  }
}
