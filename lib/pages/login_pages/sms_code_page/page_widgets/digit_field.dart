import 'package:flutter/material.dart';

class SmsInputField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;

  SmsInputField({required this.controller, required this.focusNode, required this.nextFocusNode});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 40,
      child: TextFormField(
        controller: controller,
        cursorColor: Colors.white,
        focusNode: focusNode,
        keyboardType: TextInputType.number,
        style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white),
        maxLength: 1,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          hintStyle: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w300),
          contentPadding: const  EdgeInsets.symmetric(vertical: 8),
          counterText: '',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.white),
          ),
        ),

        onChanged: (text) {
          if (text.isNotEmpty) {
            if (nextFocusNode != null && nextFocusNode != focusNode) {
              FocusScope.of(context).requestFocus(nextFocusNode);
            }
          }
        },
      ),
    );
  }
}