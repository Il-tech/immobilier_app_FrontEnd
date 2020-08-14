import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/data/model/user.dart';

abstract class SourcePropertyData {
  Future<List<dynamic>> getPropertiesFromRemote(int id);
  Future<Property> getPropertiesById(int id);
  Future<List<dynamic>> getProperties();
  Future<List<dynamic>> getFeaturesFromRemote(int id);
  Future<User> getUsersFromRemote(int id);
}
