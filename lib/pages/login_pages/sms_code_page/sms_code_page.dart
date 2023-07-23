import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:todo_flutter/pages/main_page/main_page.dart';
import 'dart:ui';

import 'package:todo_flutter/pages/welcome_page/page_widgets/custom_button.dart';
import 'package:todo_flutter/pages/login_pages/sms_code_page/page_widgets/digit_field.dart';

class SmsCodePage extends StatefulWidget {
  final String verificationId;
  const SmsCodePage({super.key, required this.verificationId});

  @override
  State<SmsCodePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<SmsCodePage> {
  final List<TextEditingController> _controllers =
      List.generate(6, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(6, (_) => FocusNode());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      ImageFiltered(
        imageFilter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Image.asset(
          'assets/background/login_background.png',
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
                    const SizedBox(height: 80.0),
                    Text(AppLocalizations.of(context)!.verification,
                        style: const TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10.0),
                    Text(
                      AppLocalizations.of(context)!.enterTheOTP,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 33.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        SmsInputField(
                            controller: _controllers[0],
                            focusNode: _focusNodes[0],
                            nextFocusNode: _focusNodes[1]),
                        SmsInputField(
                            controller: _controllers[1],
                            focusNode: _focusNodes[1],
                            nextFocusNode: _focusNodes[2]),
                        SmsInputField(
                            controller: _controllers[2],
                            focusNode: _focusNodes[2],
                            nextFocusNode: _focusNodes[3]),
                        SmsInputField(
                            controller: _controllers[3],
                            focusNode: _focusNodes[3],
                            nextFocusNode: _focusNodes[4]),
                        SmsInputField(
                            controller: _controllers[4],
                            focusNode: _focusNodes[4],
                            nextFocusNode: _focusNodes[5]),
                        SmsInputField(
                            controller: _controllers[5],
                            focusNode: _focusNodes[5],
                            nextFocusNode: null),
                      ],
                    ),
                    const SizedBox(height: 33.0),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainPage()));
                          },
                          text: AppLocalizations.of(context)!.verify,
                        )),
                    const SizedBox(height: 10.0),
                    Text(AppLocalizations.of(context)!.didntReceiveAnyCode,
                        style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white)),
                    const SizedBox(height: 10.0),
                    Text(AppLocalizations.of(context)!.resendNewCode,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A237E))),
                  ])))
    ]));
  }
}
