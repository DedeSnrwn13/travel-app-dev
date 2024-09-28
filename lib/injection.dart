import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:travel_app/core/platform/network_info.dart';
import 'package:travel_app/features/destination/data/datasource/destination_local_datasource.dart';
import 'package:travel_app/features/destination/data/datasource/destination_remote_datasource.dart';
import 'package:travel_app/features/destination/data/repositories/destination_repository_impl.dart';
import 'package:travel_app/features/destination/domain/repositories/destination_repository.dart';
import 'package:travel_app/features/destination/domain/usecases/get_all_destination_usecase.dart';
import 'package:travel_app/features/destination/domain/usecases/get_search_destination_usecase.dart';
import 'package:travel_app/features/destination/domain/usecases/get_top_destination_usecase.dart';
import 'package:travel_app/features/destination/presentation/bloc/all_destination/all_destination_bloc.dart';
import 'package:travel_app/features/destination/presentation/bloc/search_destination/search_destination_bloc.dart';
import 'package:travel_app/features/destination/presentation/bloc/top_destination/top_destination_bloc.dart';

final locator = GetIt.instance;

Future<void> initLocator() async {
  // bloc
  locator.registerFactory(() => AllDestinationBloc(locator()));
  locator.registerFactory(() => SearchDestinationBloc(locator()));
  locator.registerFactory(() => TopDestinationBloc(locator()));

  // usecase
  locator.registerLazySingleton(() => GetAllDestinationUsecase(locator()));
  locator.registerLazySingleton(() => GetTopDestinationUsecase(locator()));
  locator.registerLazySingleton(() => SearchDestinationUsecase(locator()));

  // repository
  locator.registerLazySingleton<DestinationRepository>(
    () => DestinationRepositoryImpl(
      networkInfo: locator(),
      localDatasource: locator(),
      remoteDatasource: locator(),
    ),
  );

  // datasource
  locator.registerLazySingleton<DestinationLocalDataSource>(
    () => DestinationLocalDataSourceIpml(locator()),
  );
  locator.registerLazySingleton<DestinationRemoteDataSource>(
    () => DestionationRemoteDataSourceImpl(locator()),
  );

  // platform
  locator.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(locator()),
  );

  // external
  final pref = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => pref);
  locator.registerLazySingleton(() => http.Client());
  locator.registerLazySingleton(() => Connectivity());
}
