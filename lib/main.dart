import 'package:employee_attendance/core/res/theme.dart';
import 'package:employee_attendance/core/services/injection_container.dart';
import 'package:employee_attendance/core/services/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  await dotenv.load();
  final supabaseUrl = dotenv.get('SUPABASE_URL');
  final supabaseKey = dotenv.get('SUPABASE_KEY');
  await Supabase.initialize(url: supabaseUrl, anonKey: supabaseKey);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: GestureDetector(
          child: MaterialApp.router(
            title: 'Employee Attendance',
            routerConfig: goRouter,
            theme: AppTheme.theme,
            debugShowCheckedModeBanner: false,
          ),
        ),
      ),
    );
  }
}
