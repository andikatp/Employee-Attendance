import 'package:employee_attendance/core/utils/utils.dart';
import 'package:employee_attendance/features/attendance/domain/entities/attendance_entity.dart';

abstract class AttendanceRepository {
  const AttendanceRepository();

  ResultFuture<void> getTodayAttendance();
  ResultFuture<void> markAttendance();
  ResultFuture<List<AttendanceEntity>> getAttendanceHistory();

}
