import 'package:flutter/material.dart';

class CustomProfileButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Icon icon;

  const CustomProfileButton({super.key,
    required this.onPressed,
    required this.text,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
        ),
        icon: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: icon,
          ),
        ),
        label: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
