import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/commons/custom_button.dart';
import 'package:ym_blood_app/commons/custom_form.dart';
import 'package:ym_blood_app/features/auth/data/models/chnagepassword_model/change_password_res_model.dart';
import 'package:ym_blood_app/features/auth/presentation/controllers/changepassword%20controller/change_password_controller.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/form_validation/form_validation_extension.dart';
import 'package:ym_blood_app/utils/keyboard_dismiss/keyboard_dimiss_extension.dart';

class ChangePasswordScreen extends ConsumerStatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends ConsumerState<ChangePasswordScreen> {
  late TextEditingController oldpasswordController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;
  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    oldpasswordController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    oldpasswordController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorConst.kprimaryColor,
        title: const Text(
          AppConst.kChangePassword,
          style: TextStyle(color: AppColorConst.white),
        ),
      ),
      body: GestureDetector(
        onTap: context.dismissKeyboard,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  BloodAppForm(
                    textEditingController: oldpasswordController,
                    isPrefixIconrequired: false,
                    lable: AppConst.kOldPassword,
                    validator: (input) => input!.oldPasswordValid(input),
                  ),
                  BloodAppForm(
                    textEditingController: passwordController,
                    isPrefixIconrequired: false,
                    lable: AppConst.kNewPassword,
                    validator: (input) => input!.isPasswordValid(input),
                  ),
                  BloodAppForm(
                    textEditingController: confirmPasswordController,
                    isPrefixIconrequired: false,
                    lable: AppConst.kConfirmNewPassword,
                    validator: (input) => input!.confirmPasswordValidation(
                        input, passwordController.text),
                  ),
                  ref.watch(chnagePasswordLoadingProvider)
                      ? const Center(
                          child: CircularProgressIndicator.adaptive())
                      : CustomAppButton(
                          label: "Change Password",
                          onPressed: () async {
                            // if (formKey.currentState!.validate()) {}

                            var connectivityResult =
                                await (Connectivity().checkConnectivity());
                            if (formKey.currentState!.validate()) {
                              if (connectivityResult ==
                                  ConnectivityResult.none) {
                                // Show an error if there is no internet connection
                                if (context.mounted) {
                                  showGeneralDialog(
                                      barrierColor:
                                          Colors.black.withOpacity(0.5),
                                      transitionBuilder:
                                          (context, a1, a2, widget) {
                                        return ScaleTransition(
                                            scale: Tween<double>(
                                                    begin: 0.5, end: 1.0)
                                                .animate(a1),
                                            child: FadeTransition(
                                              opacity: Tween<double>(
                                                      begin: 0.5, end: 1.0)
                                                  .animate(a1),
                                              child: const AlertDialog(
                                                title: Text(
                                                  'No Internet Connection',
                                                  style:
                                                      TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ));
                                      },
                                      transitionDuration:
                                          const Duration(milliseconds: 300),
                                      barrierDismissible: true,
                                      barrierLabel: '',
                                      context: context,
                                      pageBuilder:
                                          (context, animation1, animation2) {
                                        return Container();
                                      });
                                }
                                return;
                              }
                              if (context.mounted) {
                                ChangePasswordRequestModel
                                    changePasswordRequestModel =
                                    ChangePasswordRequestModel(
                                        old_password:
                                            oldpasswordController.text.trim(),
                                        new_password:
                                            passwordController.text.trim(),
                                        confirm_password:
                                            confirmPasswordController.text
                                                .trim());
                                ref
                                    .read(
                                        chnagePasswordLoadingProvider.notifier)
                                    .update((state) => true);
                                await ref
                                    .read(changePasswordControllerProvider
                                        .notifier)
                                    .changePasswordC(
                                        context: context,
                                        passwordChnageRequestModel:
                                            changePasswordRequestModel);

                                ref
                                    .read(
                                        chnagePasswordLoadingProvider.notifier)
                                    .update((state) => false);
                              }
                            }
                          },
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
