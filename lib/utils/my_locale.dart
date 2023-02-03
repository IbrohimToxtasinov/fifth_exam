import 'package:fifth_exam/data/services/api_service/api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

setUp() {
  getIt.registerSingleton<ApiServices>(ApiServices());
}