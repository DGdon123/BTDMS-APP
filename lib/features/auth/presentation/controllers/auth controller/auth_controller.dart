import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/db_client.dart';
import 'package:ym_blood_app/features/auth/data/models/login_request_model.dart';
import 'package:ym_blood_app/features/auth/data/models/login_response_model.dart';
import 'package:ym_blood_app/features/auth/data/repositories/auth_repository.dart';
import 'package:ym_blood_app/features/auth/presentation/controllers/auth%20controller/auth_state.dart';
import 'package:ym_blood_app/features/auth/presentation/views/login_screen.dart';
import 'package:ym_blood_app/features/dashboard/dashboard.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, AuthState>((ref) {
  return AuthController(
      ref.read(dbClientProvider), ref.read(authRepositoryProvider));
});

class AuthController extends StateNotifier<AuthState> {
  AuthController(this._dbClient, this._authRepository)
      : super(const AuthState.loading()) {
    checkLogin();
  }

  final DbClient _dbClient;
  final AuthRepository _authRepository;

  checkLogin() async {
    // log("hit");
    final String result = await _dbClient.getData(dbKey: "auth");
    // log("${result}ss");
    return result.isEmpty
        ? state = const AuthState.loggedOut()
        : state = AuthState.loggedIn(LoginResponseModel.fromJson(result));
  }

  login(LoginRequestModel loginModel, BuildContext context) async {
    final result = await _authRepository.login(loginModel);
    return result.fold(
      (l) => ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l.message),
        ),
      ),
      (r) async {
        // log(r.token);
        // log(r.toString());
        await _dbClient.setData(dbKey: "auth", value: r.toJson());
        state = AuthState.loggedIn(r);
        if (!mounted) return;
        return Navigator.of(context).pushAndRemoveUntil(
            CupertinoPageRoute(
              builder: (context) => const Dashboard(),
            ),
            (route) => false);
      },
    );
  }

  logout(BuildContext context) async {
    await _dbClient.reset();
    state = const AuthState.loggedOut();
    if (!mounted) return;
    Navigator.of(context).pushAndRemoveUntil(
        CupertinoPageRoute(
          builder: (context) => const LoginScreen(),
        ),
        (route) => false);
  }
}

final loginLoadingController = StateProvider.autoDispose<bool>((ref) {
  return false;
});
