import 'package:employee_attendance/core/usecase/usecase.dart';
import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/auth/domain/entities/user_entity.dart';
import 'package:employee_attendance/features/auth/domain/repositories/auth_repository.dart';
import 'package:equatable/equatable.dart';

class SignIn implements UseCaseWithParams<UserEntity, LoginParams> {
  SignIn({required AuthRepository repository}) : _repository = repository;
  final AuthRepository _repository;

  @override
  ResultFuture<UserEntity> call(LoginParams params) {
    return _repository.signIn(params.email, params.password);
  }
}

class LoginParams extends Equatable {
  const LoginParams({required this.email, required this.password});
  final String email;
  final String password;

  @override
  List<Object?> get props => [email, password];
}
