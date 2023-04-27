import 'package:flutter_riverpod_example/services/api_services.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> registerServices() async {
  getIt.registerLazySingleton<ApiServices>(() => ApiServices());
}
