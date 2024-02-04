import 'package:employee_attendance/core/utils/utils.dart';

class AttendanceEntity {
  AttendanceEntity({
    required this.id,
    required this.date,
    required this.checkIn,
    required this.createdAt,
    this.checkOut,
    this.checkInLocation,
    this.checkOuLocation,
  });

  AttendanceEntity.empty()
      : this(
          id: '',
          date: '',
          checkIn: '',
          checkOut: '',
          createdAt: DateTime.now(),
          checkInLocation: {},
          checkOuLocation: {},
        );

  final String id;
  final String date;
  final String checkIn;
  final String? checkOut;
  final DateTime createdAt;
  final ResultMap? checkInLocation;
  final ResultMap? checkOuLocation;
}
