import 'dart:collection';
import 'package:flutter/cupertino.dart';
import 'package:immobilierApp/categorie/data/model/category.dart';
import 'package:immobilierApp/categorie/domain/usecases/get_categories.dart';
import 'package:injectable/injectable.dart';

@injectable
class FilterModel extends ChangeNotifier {
  final List<String> _transactiontype = <String>["A vendre", "A louer"];
  final List<Category> _cateogriesList = [];
  GetCategories getCategories;
  String _selectedTransaction;
  Category _selectedCateogry;
  Category get selectedCategory => _selectedCateogry;
  String get selectedTransaction => _selectedTransaction;
  UnmodifiableListView<Category> get categories =>
      UnmodifiableListView(_cateogriesList);
  UnmodifiableListView<String> get items {
    return UnmodifiableListView(this._transactiontype);
  }

  FilterModel(this.getCategories) {
    initProvider();
  }
  set selectedTransaction(final String item) {
    this._selectedTransaction = item;
    notifyListeners();
  }

  set selectedCategory(final Category item) {
    this._selectedCateogry = item;
    notifyListeners();
  }

  void initProvider() async {
    List<Category> result = await getCategories();
    _handleChange(result);
    notifyListeners();
  }

  void _handleChange(List<Category> result) {
    _cateogriesList
      ..clear()
      ..addAll(result);
  }
}
