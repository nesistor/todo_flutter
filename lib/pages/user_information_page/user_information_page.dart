import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/provider/auth_provider.dart';

import 'package:todo_flutter/pages/welcome_page/page_widgets/custom_button.dart';
import 'package:todo_flutter/custom_widgets/toast_bar.dart';
import 'package:todo_flutter/model/user_model.dart';

import '../../utils/utils.dart';
import '../main_page/main_page.dart';

class UserInformationPage extends StatefulWidget {
  const UserInformationPage({super.key});

  @override
  State<UserInformationPage> createState() => _UserInformationPageState();
}

class _UserInformationPageState extends State<UserInformationPage> {
  File? image;
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final bioController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    emailController.dispose();
    bioController.dispose();
  }

  // for selecting image
  void selectImage() async {
    image = await pickImage(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final isLoading =
        Provider.of<AuthProvider>(context, listen: true).isLoading;
    return Scaffold(
      body: SafeArea(
        child: isLoading == true
            ? const Center(
                child: CircularProgressIndicator(color: Colors.white))
            : SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                    vertical: 25.0, horizontal: 25.0),
                child: Center(
                  child: Column(
                    children: [
                      const SizedBox(height: 33),
                      InkWell(
                        onTap: () => selectImage(),
                        child: image == null
                            ? const CircleAvatar(
                                backgroundColor: Color(0xFF1A237E),
                                radius: 50,
                                child: Icon(Icons.account_circle,
                                    size: 50, color: Colors.white),
                              )
                            : CircleAvatar(
                                backgroundImage: FileImage(image!),
                                radius: 50,
                              ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 15),
                        margin: const EdgeInsets.only(top: 20),
                        child: Column(
                          children: [
                            textField(
                                hintText: "Kubus Puchatek",
                                icon: Icons.account_circle,
                                textInputType: TextInputType.name,
                                maxLines: 1,
                                controller: nameController),
                            textField(
                                hintText: "ak47@gmail.com",
                                icon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                                maxLines: 1,
                                controller: emailController),
                            textField(
                                hintText: "Enter your bio here",
                                icon: Icons.edit,
                                textInputType: TextInputType.name,
                                maxLines: 2,
                                controller: bioController),
                          ],
                        ),
                      ),
                      const SizedBox(height: 33),
                      SizedBox(
                        height: 50.0,
                        width: MediaQuery.of(context).size.width,
                        child: CustomButton(
                          text: "Continue",
                          onPressed: () => storeData(),
                        ),
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget textField(
      {required String hintText,
      required IconData icon,
      required TextInputType textInputType,
      required int maxLines,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
          cursorColor: Colors.white,
          controller: controller,
          keyboardType: textInputType,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: Container(
              margin: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Color.fromRGBO(25, 25, 25, 0.8),
              ),
              child: Icon(
                icon,
                size: 20,
                color: Colors.white,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(
                color: Colors.white,
              ),
            ),
            hintText: hintText,
            alignLabelWithHint: true,
            border: InputBorder.none,
            fillColor: Colors.grey,
            filled: true,
          )),
    );
  }

  // store user  data to database.
  void storeData() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    UserModel userModel = UserModel(
      name: nameController.text.trim(),
      email: nameController.text.trim(),
      bio: bioController.text.trim(),
      profilePic: "",
      createdAt: "",
      phoneNumber: "",
      uid: "",
    );
    if (image != null) {
      authProvider.saveUserDataToFirebase(
        context: context,
        userModel: userModel,
        profilePic: image!,
        onSucces: () {
          // now we store data localy also
          authProvider.saveUserDataToSP().then(
                (value) => authProvider.setSignedInStatus().then(
                      (value) => Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) => MainPage()),
                          (route) => false),
                    ),
              );
        },
      );
    } else {
      showSnackBar(context, "Please upload your profile photo");
    }
  }
}
