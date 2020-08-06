// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:injectable/get_it_helper.dart';

import '../categorie/data/datasources/categories_data_src_imp.dart';
import '../categorie/data/repository/CategorieRepositorie.dart';
import '../categorie/domain/repository/category_repository.dart';
import '../categorie/domain/usecases/get_categories.dart';
import '../categorie/presentation/provider/categorie_model.dart';
import '../properties/data/datasources/property_data_source.dart';
import '../properties/data/datasources/property_data_source_impl.dart';
import '../properties/data/repository/property_repository_imp.dart';
import '../properties/domain/repository/properties_repositories.dart';
import '../properties/domain/usecases/get_current_user.dart';
import '../properties/domain/usecases/get_features.dart';
import '../properties/domain/usecases/get_properties.dart';
import '../properties/presentation/provider/PropertiesModel.dart';
import 'ThirdParty.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

void $initGetIt(GetIt g, {String environment}) {
  final gh = GetItHelper(g, environment);
  final thirdParty = _$ThirdParty();
  gh.lazySingleton<CategoryDataSourceImpl>(() => CategoryDataSourceImpl());
  gh.lazySingleton<CategoryRepository>(
      () => CategorieRepositoryImp(g<CategoryDataSourceImpl>()));
  gh.factory<Client>(() => thirdParty.httpClient);
  gh.lazySingleton<GetCategories>(() => GetCategories(g<CategoryRepository>()));
  gh.factory<GetCategoriesModel>(() => GetCategoriesModel(g<GetCategories>()));
  gh.lazySingleton<SourcePropertyData>(
      () => PropertyDataSourceImpl(g<Client>()));
  gh.lazySingleton<PropertyRepository>(
      () => PropertyRepositoryImp(g<SourcePropertyData>()));
  gh.lazySingleton<GetFeatures>(() => GetFeatures(g<PropertyRepository>()));
  gh.lazySingleton<GetProperties>(() => GetProperties(g<PropertyRepository>()));
  gh.lazySingleton<GetUser>(() => GetUser(g<PropertyRepository>()));
  gh.factory<PropertyModel>(() => PropertyModel(
        g<GetProperties>(),
        g<GetFeatures>(),
        g<GetUser>(),
      ));
}

class _$ThirdParty extends ThirdParty {}
