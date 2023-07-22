import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


import 'package:todo_flutter/pages/welcome_page/welcome_page.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: todoThemeData,
      home: WelcomePage(),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
    );
  }
}
