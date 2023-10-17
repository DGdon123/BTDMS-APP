import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/auth/presentation/views/login_screen.dart';
import 'package:ym_blood_app/features/dashboard/dashboard.dart';
import '../../theme/blood_app_theme.dart';
import '../auth/presentation/controllers/auth controller/auth_controller.dart';

class BloodApp extends ConsumerWidget {
  const BloodApp({super.key});

  @override
  Widget build(BuildContext context, ref) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: bloodAppTheme(),
      home: ref.watch(authControllerProvider).when(
          loggedIn: (data) => const Dashboard(),
          loggedOut: () => const LoginScreen(),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
