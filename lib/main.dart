import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/db_client.dart';
import 'package:ym_blood_app/features/app/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await InitializeApp().appInitialize();
  // await DbClient().reset();
  runApp(const ProviderScope(child: BloodApp()));
  await Future.delayed(const Duration(milliseconds: 1));
  FlutterNativeSplash.remove();
}
