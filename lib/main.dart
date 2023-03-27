import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'common.dart';
import 'presentation/blocs/auth_bloc/auth_bloc_bloc.dart';
import 'presentation/blocs/story_bloc/story_bloc_bloc.dart';
import 'presentation/routes/app_route.dart';
import 'presentation/utils/constants.dart';

import 'injection.dart' as injection;

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
      ],
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        title: 'Story App',
        theme: ThemeData.dark().copyWith(
          primaryColor: kBackground,
          scaffoldBackgroundColor: kBackground,
          textTheme: kTextTheme,
          colorScheme: kColorScheme.copyWith(background: kBackground),
        ),
        routerConfig: router,
      ),
    );
  }
}
