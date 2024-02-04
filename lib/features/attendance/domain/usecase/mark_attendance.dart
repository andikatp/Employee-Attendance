import 'package:employee_attendance/core/usecase/usecase.dart';
import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/attendance/domain/repositories/attendance_repository.dart';

class MarkAttendance implements UseCaseWithoutParams<void> {
  MarkAttendance({required AttendanceRepository repository})
      : _repository = repository;

  final AttendanceRepository _repository;

  @override
  ResultFuture<void> call() => _repository.markAttendance();
}
