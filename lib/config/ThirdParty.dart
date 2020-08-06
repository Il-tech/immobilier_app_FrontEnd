import 'package:http/http.dart';
import 'package:injectable/injectable.dart';

@module
abstract class ThirdParty {
  Client get httpClient => Client();
}
