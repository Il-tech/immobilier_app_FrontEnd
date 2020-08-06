import 'package:immobilierApp/properties/data/model/user.dart';
import 'package:immobilierApp/properties/domain/repository/properties_repositories.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUser {
  final PropertyRepository propertyRepository;
  GetUser(this.propertyRepository);
  Future<User> call(int id) async {
    final user = await propertyRepository.getUser(id);
    return user;
  }
}
