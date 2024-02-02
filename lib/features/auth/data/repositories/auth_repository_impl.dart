import 'package:dartz/dartz.dart';
import 'package:employee_attendance/core/error/exception.dart';
import 'package:employee_attendance/core/error/failure.dart';
import 'package:employee_attendance/core/network_info/network_info.dart';
import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:employee_attendance/features/auth/domain/entities/user_entity.dart';
import 'package:employee_attendance/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required AuthRemoteDataSource remoteDataSource,
    required NetworkInfo networkInfo,
  })  : _remoteDataSource = remoteDataSource,
        _networkInfo = networkInfo;

  final AuthRemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  @override
  ResultFuture<UserEntity> signIn(String email, String password) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(InternetFailure());
      }
      final result = await _remoteDataSource.signIn(email, password);
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<void> signOut() async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(InternetFailure());
      }
      final result = await _remoteDataSource.signOut();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }

  @override
  ResultFuture<void> signUp(
    String username,
    String email,
    String password,
  ) async {
    try {
      if (!await _networkInfo.isConnected) {
        return const Left(InternetFailure());
      }
      final result = await _remoteDataSource.signOut();
      return Right(result);
    } on ServerException catch (e) {
      return Left(ServerFailure(message: e.message));
    }
  }
}
