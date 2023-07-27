import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'package:todo_flutter/pages/welcome_page/page_widgets/custom_button.dart';
import 'package:todo_flutter/pages/login_pages/phone_number_page/phone_number_page.dart';
import 'package:todo_flutter/pages/main_page/main_page.dart';
import 'package:todo_flutter/provider/auth_provider.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
        body: Stack(children: [
      ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Image.asset(
          'assets/background/login_background_new2.png',
          color: Colors.white.withOpacity(0.8),
          colorBlendMode: BlendMode.modulate,
          fit: BoxFit.cover,
          width: double.infinity,
          height: double.infinity,
        ),
      ),
      Center(
          child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 25),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 88.0),
                    Text(AppLocalizations.of(context)!.letsGetStarted,
                        style: const TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10.0),
                    Text(AppLocalizations.of(context)!.neverABetterTime,
                        style: const TextStyle(fontSize: 16)),
                    const SizedBox(height: 66.0),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          onPressed: () {
                            if (authProvider.isSignedIn == true) {
                              //when true then fetch shared preference data
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MainPage(),
                                ),
                              );
                            } else {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => PhoneNumberPage(),
                                ),
                              );
                            }
                          },
                          text: AppLocalizations.of(context)!.getStarted,
                        ))
                  ])))
    ]));
  }
}
