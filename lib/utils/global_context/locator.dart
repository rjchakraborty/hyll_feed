import 'package:get_it/get_it.dart';
import 'package:hyll/utils/global_context/navigation_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  if (!locator.isRegistered(instance: NavigationService())) {
    locator.registerLazySingleton(() => NavigationService());
  }
}
