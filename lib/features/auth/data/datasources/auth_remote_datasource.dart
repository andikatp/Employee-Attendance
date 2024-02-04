import 'dart:math';
import 'package:employee_attendance/core/constants/app_constant.dart';
import 'package:employee_attendance/core/error/exception.dart';
import 'package:employee_attendance/features/auth/data/model/user_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
  const AuthRemoteDataSource();

  Future<UserModel> signIn(
    String email,
    String password,
  );

  Future<void> signUp(
    String email,
    String password,
  );
  Future<void> signOut();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required SupabaseClient supabase})
      : _supabase = supabase;
  final SupabaseClient _supabase;

  @override
  Future<UserModel> signIn(String email, String password) async {
    try {
      await _supabase.auth.signInWithPassword(email: email, password: password);
      final userData = await _supabase
          .from(AppConstant.employeeTable)
          .select<PostgrestMap>()
          .eq('id', _supabase.auth.currentUser?.id)
          .single();
      return UserModel.fromJson(userData);
    } on AuthException catch (e) {
      throw ServerException(message: e.message);
    } catch (e) {
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<void> signUp(String email, String password) async {
    try {
      final response = await _supabase.auth.signUp(
        email: email,
        password: password,
      );
      if (response.user != null) {
        await _supabase.from(AppConstant.employeeTable).insert({
          'id': response.user!.id,
          'name': '',
          'email': email,
          'department': null,
          'employee_id': generateRandomEmployeeId(),
        });
      }
    } on AuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _supabase.auth.signOut();
    } on AuthException catch (e) {
      throw ServerException(message: e.message);
    }
  }
}

String generateRandomEmployeeId() {
  final random = Random();
  const allChars = 'teoTEO0123456789';
  final randomString =
      List.generate(8, (index) => allChars[random.nextInt(allChars.length)])
          .join();
  return randomString;
}
