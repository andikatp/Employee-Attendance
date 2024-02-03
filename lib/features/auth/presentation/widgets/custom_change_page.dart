// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomChangePage extends StatelessWidget {
  final String message;
  final String keyMessage;
  final VoidCallback function;
  const CustomChangePage({
    Key? key,
    required this.message,
    required this.keyMessage,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(message),
          GestureDetector(
            onTap: function,
            child: Text(
              keyMessage,
              style: TextStyle(
                  color: theme.primaryColor, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
