import 'package:employee_attendance/core/utils/extensions.dart';
import 'package:employee_attendance/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocConsumer(
        listener: (context, state) {
          if (state is AuthError) {
            context.messenger.hideCurrentSnackBar();
            context.messenger
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is SignedUp) {}
        },
        builder: (context, state) {
          return const Center(
            child: CupertinoActivityIndicator(),
          );
        },
      ),
    );
  }
}
