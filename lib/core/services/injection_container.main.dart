part of 'injection_container.dart';

final sl = GetIt.instance;

Future<void> init() async {
  sl
    ..registerFactory(() => AuthBloc(signIn: sl(), signUp: sl(), signOut: sl()))
    ..registerLazySingleton(() => SignIn(repository: sl()))
    ..registerLazySingleton(() => SignOut(repository: sl()))
    ..registerLazySingleton(() => SignUp(repository: sl()))
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
    )
    ..registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(supabase: sl()),
    )
    ..registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(networkInfo: sl()),
    )
    ..registerLazySingleton(()=>Supabase.instance.client)
    ..registerLazySingleton(InternetConnection.new);
}
