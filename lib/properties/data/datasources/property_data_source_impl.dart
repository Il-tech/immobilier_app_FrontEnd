import 'package:immobilierApp/properties/data/datasources/property_data_source.dart';
import 'package:immobilierApp/properties/data/model/features/features.dart';
import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/data/model/user.dart';
import 'package:injectable/injectable.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

@LazySingleton(as: SourcePropertyData)
class PropertyDataSourceImpl implements SourcePropertyData {
  final http.Client httpClient;
  PropertyDataSourceImpl(this.httpClient);

  @override
  Future<List<Property>> getPropertiesFromRemote(int id) async {
    try {
      final response =
          await http.get("http://192.168.1.7:9100/categories/$id/properties");
      return (json.decode(response.body)['_embedded']['properties'] as List)
          .map((e) => Property.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<List<Features>> getFeaturesFromRemote(int id) async {
    try {
      final response =
          await http.get("http://192.168.1.7:9100/properties/$id/features");
      return (json.decode(response.body)['_embedded']['features'] as List)
          .map((e) => Features.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<User> getUsersFromRemote(int id) async {
    try {
      final response =
          await http.get("http://192.168.1.7:9100/properties/$id/user");
      var parsedJson = json.decode(response.body);
      var user = User.fromJson(parsedJson);
      return user;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<Property> getPropertiesById(int id) async {
    try {
      final response = await http.get("http://192.168.1.7:9100/properties/$id");

      var parsedJson = json.decode(response.body);

      var property = Property.fromJson(parsedJson);
      return property;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  @override
  Future<List<Property>> getProperties() async {
    try {
      final response = await http.get("http://192.168.1.7:9100/properties");
      return (json.decode(response.body)['_embedded']['properties'] as List)
          .map((e) => Property.fromJson(e))
          .toList();
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
