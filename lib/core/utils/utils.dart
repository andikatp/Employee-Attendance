import 'package:dartz/dartz.dart';
import 'package:employee_attendance/core/error/failure.dart';

typedef ResultFuture<Type> = Future<Either<ServerFailure, Type>>;
typedef ResultMap = Map<String, dynamic>;
