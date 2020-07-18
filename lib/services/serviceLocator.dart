import 'package:get_it/get_it.dart';
import 'package:immobilierApp/viewmodel/categorieProvider.dart';

GetIt serviceLocator = GetIt.instance;
void setupServiceLocator() {
  serviceLocator.registerFactory<CategoryProvider>(() => CategoryProvider());
}
