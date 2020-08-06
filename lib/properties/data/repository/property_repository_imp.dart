import 'package:immobilierApp/properties/data/datasources/property_data_source.dart';
import 'package:immobilierApp/properties/data/model/features/features.dart';
import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/data/model/user.dart';
import 'package:immobilierApp/properties/domain/repository/properties_repositories.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PropertyRepository)
class PropertyRepositoryImp implements PropertyRepository {
  SourcePropertyData propertyDataSource;
  List<Property> propertiesList;

  PropertyRepositoryImp(this.propertyDataSource);
  @override
  Future<List<Property>> getProperties(int id) async {
    final List<Property> remoteProperties =
        await propertyDataSource.getPropertiesFromRemote(id);
    if (remoteProperties == null) return null;
    return remoteProperties;
  }

  @override
  Future<List<Features>> getFeatures(int id) async {
    final List<Features> remoteFeatures =
        await propertyDataSource.getFeaturesFromRemote(id);
    if (remoteFeatures == null) return null;
    return remoteFeatures;
  }

  @override
  Future<User> getUser(int id) async {
    final User remoteCurrentUser =
        await propertyDataSource.getUsersFromRemote(id);
    if (remoteCurrentUser == null) return null;
    return remoteCurrentUser;
  }
}
