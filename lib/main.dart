import 'package:flutter/material.dart';
import 'package:immobilierApp/properties/presentation/provider/filter_model.dart';
import 'package:immobilierApp/properties/presentation/provider/properties_model.dart';
import 'package:immobilierApp/properties/presentation/screen/properties_screen.dart';
import 'package:immobilierApp/screens/signIn.dart';
import 'package:immobilierApp/screens/signUp.dart';
import 'package:immobilierApp/config/injectable_dependecies.dart';
import 'package:provider/provider.dart';
import 'package:immobilierApp/categorie/presentation/provider/categorie_model.dart';
import 'categorie/presentation/screen/categorie_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: const Color(0xf5f5f5),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        'Login': (context) => SignIn(),
        'SignUp': (context) => SignUp(),
        'propertyList': (context) => ListProperty(),
        // '/favoriteScreen': (context) => FavoriteScreen(),
        'Catégories': (context) => ListCategory(),
      },
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => getIt<GetCategoriesModel>()),
          ChangeNotifierProvider(create: (_) => getIt<PropertyModel>()),
          ChangeNotifierProvider(create: (_) => getIt<FilterModel>()),
        ],
        child: MaterialApp(home: ListCategory()),
      ),
    );
  }
}
