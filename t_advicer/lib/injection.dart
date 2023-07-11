import 'package:get_it/get_it.dart';
import 'package:t_advicer/0_data/datasources/advice_remote_datasource.dart';
import 'package:t_advicer/0_data/repositories/advice_repo_impl.dart';
import 'package:t_advicer/1_domain/repositories/advice_repo.dart';
import 'package:t_advicer/1_domain/usecases/advice_usecases.dart';
import 'package:t_advicer/3_application/pages/advice/cubit/advicer_cubit.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.I; //sl is for Service Locator

Future<void> init() async {
  //! Application Layer
  //Factory = Every time is the new/fresh  instance of that class
  sl.registerFactory(() => AdvicerCubit(adviceUseUsecases: sl()));

  //! Domain Layer
  sl.registerFactory(() => AdviceUseUsecases(adviceRepo: sl()));

  //! data Layer
  sl.registerFactory<AdviceRepo>(
      () => AdviceRepoImpl(adviceRemoteDatasource: sl()));
  sl.registerFactory<AdviceRemoteDatasource>(
      () => AdviceRemoteDatasourceImpl(client: sl()));

  //! externs
  sl.registerFactory(() => http.Client());
}
