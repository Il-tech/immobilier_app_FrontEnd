import 'package:immobilierApp/properties/data/model/property/property.dart';
import 'package:immobilierApp/properties/domain/repository/properties_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAll {
  final PropertyRepository propertyRepository;
  GetAll(this.propertyRepository);
  Future<List<Property>> call() async {
    final properties = await propertyRepository.getAllProperties();
    return properties;
  }
}
