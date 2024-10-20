import 'package:coding_task/blocs/auth_bloc/auth_bloc.dart';
import 'package:coding_task/repos/auth_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupLocator() {
  getIt.registerLazySingleton<AuthService>(() => AuthService());
  getIt.registerLazySingleton<AuthBloc>(() => AuthBloc(getIt<AuthService>()));
}
