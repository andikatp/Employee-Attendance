import 'package:employee_attendance/presentation/core/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final GlobalKey _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _formKey.currentState?.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: theme.colorScheme.primaryContainer,
            height: height * 0.3,
            width: width,
            padding: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                'Sign in \nto your account',
                maxLines: 2,
                style: theme.textTheme.displaySmall,
              ),
            ),
          ),
          Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                CustomTextField(
                    controller: _emailController,
                    hintText: 'Email Address',
                    icon: Icons.person),
                CustomTextField(
                    controller: _passwordController,
                    icon: Icons.key,
                    hintText: 'Password'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('LOG IN'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
