import 'package:employee_attendance/core/usecase/usecase.dart';
import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/auth/domain/repositories/auth_repository.dart';

class SignOut extends UseCaseWithoutParams<void> {
  SignOut({required AuthRepository repository}) : _repository = repository;
  final AuthRepository _repository;

  @override
  ResultFuture<void> call() {
    return _repository.signOut();
  }
}
