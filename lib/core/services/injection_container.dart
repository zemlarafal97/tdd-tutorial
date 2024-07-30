import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:tdd_tutorial/src/authentication/data/datasources/authentication_remote_data_source.dart';
import 'package:tdd_tutorial/src/authentication/data/repositories/authentication_repository_impl.dart';
import 'package:tdd_tutorial/src/authentication/domain/repositories/authentication_repository.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/create_user.dart';
import 'package:tdd_tutorial/src/authentication/domain/usecases/get_users.dart';
import 'package:tdd_tutorial/src/authentication/presentation/cubit/authentication_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt
    // App Logic
    ..registerFactory(() => AuthenticationCubit(
          createUser: getIt(),
          getUsers: getIt(),
        ))

    // Use Cases
    ..registerLazySingleton(() => CreateUser(getIt()))
    ..registerLazySingleton(() => GetUsers(getIt()))

    // Repositories
    ..registerLazySingleton<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(getIt()))

    // Data Sources
    ..registerLazySingleton<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImpl(getIt()))

    // External Dependencies
    ..registerLazySingleton(http.Client.new);
}
