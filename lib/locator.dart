import 'package:loginform/service.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

setUpLocator()
{
  getIt.registerSingleton(AppService());
}