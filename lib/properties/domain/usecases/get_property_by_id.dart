import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/domain/repository/properties_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetById {
  final PropertyRepository propertyRepository;
  GetById(this.propertyRepository);
  Future<Property> call(int id) async {
    final property = await propertyRepository.getPropertyById(id);
    return property;
  }
}
