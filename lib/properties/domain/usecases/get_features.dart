import 'package:immobilierApp/properties/data/model/features/features.dart';
import 'package:immobilierApp/properties/domain/repository/properties_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetFeatures {
  final PropertyRepository propertyRepository;
  GetFeatures(this.propertyRepository);
  Future<List<Features>> call(int id) async {
    final features = await propertyRepository.getFeatures(id);
    return features;
  }
}
