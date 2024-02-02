part of 'auth_bloc.dart';

@immutable
sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}

final class SignInLoading extends AuthState {
  const SignInLoading();
}

final class SignUpLoading extends AuthState {
  const SignUpLoading();
}
