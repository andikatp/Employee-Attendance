import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:employee_attendance/core/services/router.dart';
import 'package:employee_attendance/core/utils/extensions.dart';
import 'package:employee_attendance/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:employee_attendance/features/auth/presentation/widgets/custom_change_page.dart';
import 'package:employee_attendance/features/auth/presentation/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final nameController = TextEditingController();
    final emailController = TextEditingController();
    final passwordController = TextEditingController();

    void onSignUpTapped() {
      if (formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(
              SignUpEvent(
                name: nameController.text.trim(),
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
            context.messenger.showSnackBar(
              SnackBar(content: Text(state.message)),
            );
          }
          if (state is SignedUp) {
            context.messenger.hideCurrentSnackBar();
            context.messenger.showSnackBar(
              const SnackBar(
                content: Text(
                  'Your account has been successfully registered, '
                  'please sign in',
                ),
              ),
            );
            context.pushNamed(AppNameRoute.signIn);
          }
        },
        builder: (context, state) {
          return Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(height: 80),
                Text(
                  'Ayo gabung ke Teo!',
                  style: context.textTheme.headlineSmall
                      ?.copyWith(fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DottedDashedLine(
                    height: 0,
                    width: MediaQuery.of(context).size.width,
                    axis: Axis.horizontal,
                    dashColor: Colors.grey.shade500,
                  ),
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: ElevatedButton(
                    onPressed: onSignUpTapped,
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text('Daftar'),
                  ),
                ),
                CustomChangePage(
                  message: 'Sudah punya akun?',
                  keyMessage: ' Login',
                  function: () => context.goNamed(AppNameRoute.signIn),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
