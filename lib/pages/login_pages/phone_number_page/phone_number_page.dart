import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dart:ui';
import 'package:country_picker/country_picker.dart';
import 'package:provider/provider.dart';

import 'package:todo_flutter/pages/welcome_page/page_widgets/custom_button.dart';
import 'package:todo_flutter/pages/login_pages/sms_code_page/sms_code_page.dart';
import 'package:todo_flutter/provider/auth_provider.dart';

class PhoneNumberPage extends StatefulWidget {
  @override
  State<PhoneNumberPage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<PhoneNumberPage> {
  final TextEditingController phoneController = TextEditingController();

  Country selectedCountry = Country(
      phoneCode: "48",
      countryCode: "PL",
      e164Sc: 0,
      geographic: true,
      level: 1,
      name: "Poland",
      example: "Poland",
      displayName: "Poland",
      displayNameNoCountryCode: "PL",
      e164Key: "");

  @override
  Widget build(BuildContext context) {
    phoneController.selection = TextSelection.fromPosition(
      TextPosition(
        offset: phoneController.text.length,
      ),
    );

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
                    const SizedBox(height: 80.0),
                    Text(AppLocalizations.of(context)!.register,
                        style: const TextStyle(
                            fontSize: 40.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(height: 10.0),
                    Text(
                      AppLocalizations.of(context)!.addYourPhoneNumber,
                      style: const TextStyle(fontSize: 16),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 33.0),
                    Container(
                      padding: const EdgeInsets.all(12.5),
                      child: TextFormField(
                          cursorColor: Colors.white,
                          keyboardType: TextInputType.phone,
                          controller: phoneController,
                          style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                          decoration: InputDecoration(
                            hintText: "Enter phone number",
                            hintStyle: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w300),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(color: Colors.white),
                            ),
                            prefixIcon: Container(
                                padding: const EdgeInsets.all(12.5),
                                child: InkWell(
                                    onTap: () {
                                      showCountryPicker(
                                          context: context,
                                          countryListTheme:
                                              const CountryListThemeData(
                                                  bottomSheetHeight: 500),
                                          onSelect: (value) {
                                            setState(() {
                                              selectedCountry = value;
                                            });
                                          });
                                    },
                                    child: Text(
                                        "${selectedCountry.flagEmoji} + ${selectedCountry.phoneCode}",
                                        style: const TextStyle(
                                            fontSize: 18,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold)))),
                            suffixIcon: phoneController.text.length >= 9
                                ? Container(
                                    padding: const EdgeInsets.all(12.5),
                                    child: Container(
                                        decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Colors.green),
                                        child: const Icon(
                                          Icons.done,
                                          color: Colors.white,
                                          size: 20,
                                        )))
                                : null,
                          )),
                    ),
                    const SizedBox(height: 33.0),
                    SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: CustomButton(
                          onPressed: () => sendPhoneNumber(),
                          text: AppLocalizations.of(context)!.login,
                        ))
                  ])))
    ]));
  }
  void sendPhoneNumber() {
    //+48123456789
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    String phoneNumber = phoneController.text.trim();
    authProvider.signInWithPhone(context, "+${selectedCountry.phoneCode}$phoneNumber" );
  }
}
