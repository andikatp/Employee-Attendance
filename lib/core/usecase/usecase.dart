import 'package:employee_attendance/core/utils/utils.dart';

abstract class UseCaseWithParams<Type, Params> {
  const UseCaseWithParams();

  ResultFuture<Type> call(Params params);
}

abstract class UseCaseWithoutParams<T> {
  const UseCaseWithoutParams();

  ResultFuture<Type> call();
}
