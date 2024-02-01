import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  const AuthRepository();

  ResultFuture<UserEntity> signIn(String email, String password);
  ResultFuture<void> signUp(String username, String email, String password);
  ResultFuture<void> signOut();
}
