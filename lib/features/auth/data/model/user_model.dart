import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/auth/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.email,
    required super.name,
    required super.department,
    required super.employeeId,
  });

  const UserModel.empty() : super.empty();

  factory UserModel.fromJson(ResultMap json) {
    return UserModel(
      id: json['id'] as String,
      email: json['email'] as String,
      name: json['name'] as String,
      department: json['department'] as int,
      employeeId: json['employeeId'] as String,
    );
  }

  ResultMap toJson() {
    return {
      'id': id,
      'email': email,
      'name': name,
      'department': department,
      'employeeId': employeeId,
    };
  }
}
