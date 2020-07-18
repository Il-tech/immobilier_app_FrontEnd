import 'package:immobilierApp/models/category.dart';

class CategoryViewModal {
  Category category;
  CategoryViewModal(Category cat) : this.category = cat;
  String get id {
    return category.id;
  }

  String get type {
    return category.type;
  }

  String get image {
    return category.image;
  }
}
