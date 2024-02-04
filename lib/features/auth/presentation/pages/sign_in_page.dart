import 'package:employee_attendance/core/constants/app_sizes.dart';
import 'package:employee_attendance/core/services/router.dart';
import 'package:employee_attendance/core/utils/extensions.dart';
import 'package:employee_attendance/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:employee_attendance/features/auth/presentation/widgets/custom_change_page.dart';
import 'package:employee_attendance/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void onSignInTapped() {
      if (formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
              SignInEvent(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              ),
            );
      }
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {
          if (state is AuthError) {
            context.messenger.hideCurrentSnackBar();
            context.messenger
                .showSnackBar(SnackBar(content: Text(state.message)));
          }
          if (state is SignedUp) {}
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                Gap.h48,
                KeyboardVisibilityBuilder(
                  builder: (context, isKeyboardVisible) => isKeyboardVisible
                      ? const SizedBox()
                      : Image.asset(
                          'assets/logo.png',
                          height: 110.h,
                          width: 110.h,
                        ),
                ),
                Gap.h20,
                Text(
                  'Masuk ke akun Teo',
                  style: context.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                Gap.h20,
                CustomTextfield(
                  text: 'Email Anda',
                  hintText: 'nama@email.com',
                  textEditingController: emailController,
                  inputType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kolom ini tidak boleh kosong';
                    }
                    if (!value.contains('@')) {
                      return 'Pastikan format email anda benar';
                    }
                    return null;
                  },
                ),
                Gap.h20,
                CustomTextfield(
                  text: 'Kata Sandi',
                  hintText: '*******',
                  textEditingController: passwordController,
                  password: true,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Kolom ini tidak boleh kosong';
                    }
                    if (value.length <= 6) {
                      return 'Kata sandi harus mengandung '
                          'setidaknya 6 karakter';
                    }
                    return null;
                  },
                ),
                Gap.h20,
                Padding(
                  padding: REdgeInsets.symmetric(horizontal: 20),
                  child: state is AuthLoading
                      ? const Center(
                          child: CupertinoActivityIndicator(),
                        )
                      : ElevatedButton(
                          onPressed: onSignInTapped,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(1.sw, 50.h),
                          ),
                          child: const Text('Masuk'),
                        ),
                ),
                const Spacer(),
                CustomChangePage(
                  message: 'Belum punya akun?',
                  keyMessage: ' Daftar',
                  function: () => context.goNamed(AppNameRoute.signUp),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
