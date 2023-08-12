import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todo_flutter/pages/settings_page/settings_page.dart';
import 'package:todo_flutter/pages/user_information_page/user_information_page.dart';
import 'package:todo_flutter/provider/auth_provider.dart';
import 'package:todo_flutter/pages/welcome_page/welcome_page.dart';
import 'package:provider/provider.dart';
import 'package:todo_flutter/custom_widgets/custom_black_button.dart';

import 'package:todo_flutter/pages/feedback_page/feedback_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

void signOutAndNavigateToWelcomePage(BuildContext context) {
  final authProvider = Provider.of<AuthProvider>(context,
      listen: false);

  authProvider.userSignOut().then(
        (value) => Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const WelcomePage(),
      ),
    ),
  );
}

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
                  offset: const Offset(0, -120), // Move the content up
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 120), // Space for the background image
                      CircleAvatar(
                        radius: 70,
                        backgroundImage:
                        NetworkImage(authProvider.userModel.profilePic),
                      ),
                      const SizedBox(height: 60),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
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
                            const SizedBox(height: 10),
                            CustomProfileButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const FeedbackPage(),
                                  ),
                                );
                              },
                              text: "Feedback",
                              icon: const Icon(Icons.chat_bubble_outline_rounded),
                            ),
                            const SizedBox(height: 10),
                            CustomProfileButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SettingsPage(),
                                  ),
                                );
                              },
                              text: "Settings",
                              icon: const Icon(Icons.settings),
                            ),
                            const SizedBox(height: 10),
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
