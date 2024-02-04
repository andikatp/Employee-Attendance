import 'package:employee_attendance/features/auth/domain/entities/user_entity.dart';
import 'package:employee_attendance/features/auth/domain/usecases/sign_in.dart';
import 'package:employee_attendance/features/auth/domain/usecases/sign_out.dart';
import 'package:employee_attendance/features/auth/domain/usecases/sign_up.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignIn signIn,
    required SignUp signUp,
    required SignOut signOut,
  })  : _signIn = signIn,
        _signOut = signOut,
        _signUp = signUp,
        super(const AuthInitial()) {
    on<AuthEvent>((event, emit) {
      emit(const AuthLoading());
    });
    on<SignInEvent>(signInHandler);
    on<SignUpEvent>(signUpHandler);
    on<SignOutEvent>(signOutHandler);
  }

  final SignIn _signIn;
  final SignUp _signUp;
  final SignOut _signOut;

  Future<void> signInHandler(SignInEvent event, Emitter<AuthState> emit) async {
    final result = await _signIn(
      SignInParams(email: event.email, password: event.password),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (user) => emit(SignedIn(user: user)),
    );
  }

  Future<void> signUpHandler(SignUpEvent event, Emitter<AuthState> emit) async {
    final result = await _signUp(
      SignUpParams(
        email: event.email,
        password: event.password,
      ),
    );
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (_) => emit(const SignedUp()),
    );
  }

  Future<void> signOutHandler(
    SignOutEvent event,
    Emitter<AuthState> emit,
  ) async {
    final result = await _signOut();
    result.fold(
      (failure) => emit(AuthError(message: failure.errorMessage)),
      (_) => emit(const SignedOut()),
    );
  }
}
