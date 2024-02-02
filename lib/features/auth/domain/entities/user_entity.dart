import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    required this.department,
    required this.employeeId,
  });

  const UserEntity.empty()
      : this(
          id: '',
          name: '',
          email: '',
          department: 0,
          employeeId: '',
        );

  final String id;
  final String email;
  final String name;
  final int? department;
  final String employeeId;

  @override
  List<Object?> get props => [id, email, name, department, employeeId];
}
