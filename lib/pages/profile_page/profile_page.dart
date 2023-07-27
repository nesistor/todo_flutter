import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:todo_flutter/provider/auth_provider.dart';
import 'package:todo_flutter/pages/welcome_page/welcome_page.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 0.0, sigmaY: 1.0),
                      child: Image.asset(
                        'assets/background/login_background_new1.png',
                        color: Colors.white.withOpacity(0.8),
                        colorBlendMode: BlendMode.modulate,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    color: Color.fromRGBO(25, 25, 25, 0.8),
                    // Adjust the height of the black screen as needed
                  ),
                ),
              ],
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Positioned(
                    top: MediaQuery.of(context).size.height / 2 -
                        145, // Adjust the vertical position of the avatar
                    left: MediaQuery.of(context).size.width / 2 -
                        70, // Adjust the horizontal position of the avatar
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: NetworkImage(authProvider.userModel.profilePic),
                      // Provide the profile photo image
                    ),
                  ),

                ),
              ),
              Text(authProvider.userModel.name),
              Text(authProvider.userModel.phoneNumber),
              Text(authProvider.userModel.email),
              Text(authProvider.userModel.bio),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      authProvider.userSignOut().then(
                            (value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomePage(),
                          ),
                        ),
                      );
                    },
                    icon: const Icon(Icons.exit_to_app, color: Colors.white),
                  ),
                  Text("Log out"),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
