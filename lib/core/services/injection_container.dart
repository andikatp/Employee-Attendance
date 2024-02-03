import 'package:employee_attendance/core/network_info/network_info.dart';
import 'package:employee_attendance/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:employee_attendance/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:employee_attendance/features/auth/domain/repositories/auth_repository.dart';
import 'package:employee_attendance/features/auth/domain/usecases/sign_in.dart';
import 'package:employee_attendance/features/auth/domain/usecases/sign_out.dart';
import 'package:employee_attendance/features/auth/domain/usecases/sign_up.dart';
import 'package:employee_attendance/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'injection_container.main.dart';
