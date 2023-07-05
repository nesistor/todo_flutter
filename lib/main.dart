import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


import 'package:todo_flutter/pages/main_page/main_page.dart';
import 'package:todo_flutter/theme_data.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: todoThemeData,
      home: const MainPage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
