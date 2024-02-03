import 'package:flutter/material.dart';

class CustomChangePage extends StatelessWidget {
  const CustomChangePage({
    required this.message,
    required this.keyMessage,
    required this.function,
    super.key,
  });
  final String message;
  final String keyMessage;
  final VoidCallback function;

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
                color: theme.primaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
