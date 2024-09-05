import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:recipe_app/Features/login/cubit/login_cubit.dart';
import 'package:recipe_app/Features/login/data/repo/login_repo.dart';
import 'package:recipe_app/config/local_db/local_db.dart';
import 'package:recipe_app/core/network/api_consumer.dart';
import 'package:recipe_app/core/network/api_interceptors.dart';
import 'package:recipe_app/core/network/dio_consumer.dart';

final sl = GetIt.instance;
Future<void> init()async{
  // login
  //cubit
  sl.registerFactory(()=>LoginCubit(loginRepo: sl()));
  //repo
  sl.registerLazySingleton(() => LoginRepo());
  //config
    sl.registerLazySingleton(() => SqlDb());
 //core
  sl.registerLazySingleton<ApiConsumer>(() => DioConsumer(client: sl()));

  sl.registerLazySingleton(() => AppInterceptors());
  sl.registerLazySingleton(() => LogInterceptor(
      request: true,
      requestBody: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
      error: true));
  sl.registerLazySingleton(() => Dio());
}
