import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/auth/data/models/chnagepassword_model/change_password_re_model.dart';
import 'package:ym_blood_app/features/auth/data/models/chnagepassword_model/change_password_res_model.dart';
import 'package:ym_blood_app/features/auth/data/repositories/auth_repository.dart';
import 'package:ym_blood_app/features/dashboard/dashboard.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';
import 'package:ym_blood_app/utils/snackbar/custome_snack_bar.dart';

class ChangePasswordControllerNotifier
    extends StateNotifier<AsyncValue<ChangePasswordResponseModel>> {
  ChangePasswordControllerNotifier(this.authRepositories)
      : super(const AsyncValue.loading());
  final AuthRepository authRepositories;
  changePasswordC(
      {required BuildContext context,
      required ChangePasswordRequestModel passwordChnageRequestModel}) async {
    final result = await authRepositories.changePasswordRepo(
      passwordChnageRequestModel,
    );
    return result.fold((l) {
      showCustomSnackBar(l.message, context);
      state = AsyncValue.error(
        l,
        StackTrace.fromString(l.message),
      );
    }, (r) async {
      state = AsyncValue.data(r);
      if (context.mounted) {
        showCustomSnackBar(r.message, context, isError: false);
        pushAndRemoveUntil(context, const Dashboard());
      }
    });
  }
}

final changePasswordControllerProvider = StateNotifierProvider<
    ChangePasswordControllerNotifier,
    AsyncValue<ChangePasswordResponseModel>>((ref) {
  return ChangePasswordControllerNotifier(ref.read(authRepositoryProvider));
});

final chnagePasswordLoadingProvider = StateProvider.autoDispose<bool>((ref) {
  return false;
});