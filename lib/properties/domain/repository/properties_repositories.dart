import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:immobilierApp/properties/data/model/features/features.dart';
import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/data/model/user.dart';

abstract class PropertyRepository {
  Future<List<Property>> getProperties(int id);
  Future<List<Features>> getFeatures(int id);
  Future<User> getUser(int id);
}
