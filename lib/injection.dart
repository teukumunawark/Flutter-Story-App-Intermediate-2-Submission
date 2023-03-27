import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:story_app_intermediate_final/presentation/blocs/auth_bloc/auth_bloc_bloc.dart';

import 'domain/repositories/story_repository.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/usecase/create_story.dart';
import 'domain/usecase/create_user_login.dart';
import 'domain/usecase/create_user_register.dart';
import 'domain/usecase/get_all_story.dart';
import 'domain/usecase/get_detail_story.dart';
import 'infrastructure/data_sources/remote_api.dart';
import 'infrastructure/repositories/story_repository_impl.dart';
import 'infrastructure/repositories/user_repository_impl.dart';
import 'presentation/blocs/story_bloc/story_bloc_bloc.dart';

final locator = GetIt.instance;

void init() {
  // BLOC STATE INJECTION
  locator.registerFactory(() => AuthBloc(
        locator(),
        locator(),
      ));
  locator.registerFactory(() => StoryBloc(
        locator(),
        locator(),
        // locator(),
      ));
  locator.registerFactory(() => StoriesDetailBloc(
        locator(),
      ));

  // USE CASE INJECTION
  locator.registerLazySingleton(() => CreateUserRegister(locator()));
  locator.registerLazySingleton(() => CreateUserLogin(locator()));
  locator.registerLazySingleton(() => GetStories(locator()));
  locator.registerLazySingleton(() => CreateStory(locator()));
  locator.registerLazySingleton(() => GetDetailStories(locator()));

  // REPOSITORY INJECTION
  locator.registerLazySingleton<UserRepository>(
    () => UserRepositoryIMPL(dataSource: locator()),
  );
  locator.registerLazySingleton<StoryRepository>(
    () => StoryRepositoryIMPL(dataSource: locator()),
  );

  // API INJECTION
  locator.registerLazySingleton<RemoteDataSource>(
    () => RemoteDataSourceIMPL(dio: locator()),
  );

  // EXTERNAL
  locator.registerLazySingleton(() => Dio());
}
