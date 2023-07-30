import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todo_flutter/pages/user_information_page/user_information_page.dart';
import 'package:todo_flutter/provider/auth_provider.dart';
import 'package:todo_flutter/pages/welcome_page/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/pages/profile_page/page_widgets/custom_button.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void signOutAndNavigateToWelcomePage(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context,
      listen: false); // Replace this with your actual AuthProvider instance

  authProvider.userSignOut().then(
        (value) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
    ),
  );
}

// ... existing code

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 25, 25, 0.8),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250, // Height of the expanded container
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
                child: Image.asset(
                  'assets/background/login_background_new1.png',
                  color: Colors.white.withOpacity(0.8),
                  colorBlendMode: BlendMode.modulate,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Transform.translate(
                  offset: Offset(0, -120), // Move the content up
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 120), // Space for the background image
                      CircleAvatar(
                        radius: 70,
                        backgroundImage:
                        NetworkImage(authProvider.userModel.profilePic),
                      ),
                      SizedBox(height: 60),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CustomProfileButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const UserInformationPage(),
                                  ),
                                );
                              },
                              text: "Profile",
                              icon: const Icon(Icons.person),
                            ),
                            SizedBox(height: 10),
                            CustomProfileButton(
                              onPressed: () {},
                              text: "Feedback",
                              icon: const Icon(Icons.chat_bubble_outline_rounded),
                            ),
                            SizedBox(height: 10),
                            CustomProfileButton(
                              onPressed: () {},
                              text: "Settings",
                              icon: const Icon(Icons.settings),
                            ),
                            SizedBox(height: 10),
                            CustomProfileButton(
                              onPressed: () {
                                signOutAndNavigateToWelcomePage(context);
                              },
                              text: "Sign out",
                              icon: const Icon(Icons.exit_to_app),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}




/*Text(authProvider.userModel.name),
                  Text(authProvider.userModel.phoneNumber),
                  Text(authProvider.userModel.email),
                  Text(authProvider.userModel.bio),
                  CustomProfileButton(onPressed: signOutAndNavigateToWelcomePage(), text: Text("Sign out"), icon: Icons.exit_to_app)
                  SizedBox(height: 16),*/
