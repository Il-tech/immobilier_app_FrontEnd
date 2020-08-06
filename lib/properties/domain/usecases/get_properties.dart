import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/domain/entities/properties_features.dart';
import 'package:immobilierApp/properties/domain/repository/properties_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProperties {
      List<PropertyFeatures> ls ;
  final PropertyRepository propertyRepository;
  GetProperties(this.propertyRepository);
  Future<List<Property>> call(int id) async {
    final properties = await propertyRepository.getProperties(id);
    return properties;
  }
}
