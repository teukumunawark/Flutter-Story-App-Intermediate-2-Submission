import 'package:story_app_intermediate_final/localization_bloc.dart';
import 'package:story_app_intermediate_final/presentation/blocs/location_bloc/location_bloc.dart';

import 'presentation/blocs/story_bloc/story_bloc_bloc.dart';
import 'presentation/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'presentation/routes/app_route.dart';
import 'presentation/utils/constants.dart';
import 'package:flutter/material.dart';

import 'injection.dart' as injection;

import 'common.dart';

void main() {
  injection.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => injection.locator<AuthBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<StoryBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<StoriesDetailBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<LocationBloc>(),
        ),
        BlocProvider(
          create: (_) => injection.locator<LocalizationBloc>(),
        ),
      ],
      child: BlocBuilder<LocalizationBloc, Locale>(
        builder: (context, locale) {
          return MaterialApp.router(
            title: 'Story App',
            debugShowCheckedModeBanner: false,

            // Theme
            theme: ThemeData.dark().copyWith(
              textTheme: kTextTheme,
              primaryColor: kBackground,
              scaffoldBackgroundColor: kBackground,
              colorScheme: kColorScheme.copyWith(background: kBackground),
            ),

            // Routing
            routerDelegate: router.routerDelegate,
            routeInformationParser: router.routeInformationParser,
            routeInformationProvider: router.routeInformationProvider,

            // Localizations
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: locale,
          );
        },
      ),
    );
  }
}
