import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/data/model/user.dart';

abstract class SourcePropertyData {
  Future<List<dynamic>> getPropertiesFromRemote(int id);
  Future<List<dynamic>> getFeaturesFromRemote(int id);
  Future<User> getUsersFromRemote(int id);
}
