import 'package:employee_attendance/core/error/exception.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  const Failure({required this.message});
  final String message;

  String get errorMessage => 'Error: $message';

  @override
  List<Object> get props => [message];
}

class CacheFailure extends Failure {
  const CacheFailure({required super.message});

  CacheFailure.fromException(CacheException exception)
      : this(message: exception.message);
}

class ServerFailure extends Failure {
  const ServerFailure({required super.message});

  ServerFailure.fromException(ServerException exception)
      : this(message: exception.message);
}
