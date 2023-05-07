// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final IconData icon;
  final String hintText;
  const CustomTextField({
    Key? key,
    required this.controller,
    required this.icon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 0),
      child: TextFormField(
        onTapOutside: (event) => FocusScope.of(context).unfocus(),
        controller: controller,
        obscureText: hintText == 'Password' ? true : false,
        decoration: InputDecoration(
          prefixIcon: Icon(icon),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: theme.colorScheme.primary,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              width: 2,
              color: theme.colorScheme.primary,
            ),
          ),
          hintText: hintText,
        ),
      ),
    );
  }
}
