import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common.dart';
import '../../localization_bloc.dart';

class FlagIconWidget extends StatelessWidget {
  const FlagIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final localizationBloc = BlocProvider.of<LocalizationBloc>(context);
    return DropdownButtonHideUnderline(
      child: BlocBuilder<LocalizationBloc, Locale>(
        builder: (context, locale) {
          return DropdownButton(
            icon: const Icon(Icons.flag),
            items: AppLocalizations.supportedLocales.map((Locale locale) {
              final flag = getFlagFromLanguageCode(locale.languageCode);
              return DropdownMenuItem(
                value: locale,
                child: Center(
                  child: Text(
                    flag,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                ),
                onTap: () {
                  localizationBloc.add(SetLocale(locale));
                },
              );
            }).toList(),
            onChanged: (_) {},
          );
        },
      ),
    );
  }
}

String getFlagFromLanguageCode(String languageCode) {
  final flags = {
    'en': '🇺🇸',
    'id': '🇮🇩',
  };
  return flags[languageCode] ?? '';
}
