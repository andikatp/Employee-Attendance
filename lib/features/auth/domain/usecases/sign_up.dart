import 'package:employee_attendance/core/usecase/usecase.dart';
import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignUp extends UseCaseWithParams<void, SignUpParams> {
  SignUp({required AuthRepository repository}) : _repository = repository;
  final AuthRepository _repository;

  @override
  ResultFuture<void> call(SignUpParams params) {
    return _repository.signUp(params.username, params.email, params.password);
  }
}

class SignUpParams extends Equatable {
  const SignUpParams({
    required this.username,
    required this.email,
    required this.password,
  });

  final String username;
  final String email;
  final String password;

  @override
  List<Object?> get props => [username, email, password];
}
