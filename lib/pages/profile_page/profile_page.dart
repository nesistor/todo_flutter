import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Column(
              children: [
                Expanded(
                  child: Container(
                    child: ImageFiltered(
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
                  ),
                ),
                Container(
                  color: Color.fromRGBO(25,25,25, 0.8),
                  height: 400, // Adjust the height of the black screen as needed
                ),
              ],
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 145, // Adjust the vertical position of the avatar
            left: MediaQuery.of(context).size.width / 2 - 70, // Adjust the horizontal position of the avatar
            child: GestureDetector(
              onTap: () {
                // Handle the tap to change profile photo and nickname
              },
              child: CircleAvatar(
                radius: 70,
                backgroundImage: AssetImage('assets/avatars/ai.png'), // Provide the profile photo image
              ),
            ),
          ),
        ],
      ),
    );
  }
}
