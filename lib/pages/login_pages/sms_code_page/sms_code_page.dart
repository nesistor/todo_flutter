import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/custom_widgets/toast_bar.dart';
import 'package:todo_flutter/pages/main_page/main_page.dart';
import 'dart:ui';
import 'package:pinput/pinput.dart';

import 'package:todo_flutter/pages/welcome_page/page_widgets/custom_button.dart';
import 'package:todo_flutter/pages/login_pages/sms_code_page/page_widgets/digit_field.dart';
import 'package:todo_flutter/provider/auth_provider.dart';
import 'package:todo_flutter/pages/profile_page/profile_page.dart';

class SmsCodePage extends StatefulWidget {
  final String verificationId;
  const SmsCodePage({super.key, required this.verificationId});

  @override
  State<SmsCodePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<SmsCodePage> {
  String? otpCode;

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: Stack(
        children: [
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
          isLoading == true
              ? const Center(
                  child: CircularProgressIndicator(color: Colors.white))
              : Padding(
                  padding: const EdgeInsets.only(
                      top: 40.0, left: 25.0), // Add top padding here
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(),
                      child: const Icon(Icons.arrow_back, color: Colors.white),
                    ),
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
                  Pinput(
                    length: 6,
                    showCursor: true,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Colors.white,
                        ),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onCompleted: (value) {
                      setState(() {
                        otpCode = value;
                      });
                    },
                  ),
                  const SizedBox(height: 33.0),
                  SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: CustomButton(
                        onPressed: () {
                          if (otpCode != null) {
                            verifyOtp(context, otpCode!);
                          } else {
                            toastBar(context, "Enter 6 digit code");
                          }
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
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void verifyOtp(BuildContext context, String userOtp) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    authProvider.verifyOtp(
      context: context,
      verificationId: widget.verificationId,
      userOtp: userOtp,
      onSuccess: () {
        authProvider.checkExistingUser().then((value) async {
          if (value == true) {

          } else {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => ProfilePage()),
                (route) => false);
          }
        });
      },
    );
  }
}
