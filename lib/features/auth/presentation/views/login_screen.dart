import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/commons/asyn_widget/asyncvalue_widget.dart';
import 'package:ym_blood_app/commons/custom_button.dart';
import 'package:ym_blood_app/commons/custom_form.dart';
import 'package:ym_blood_app/features/auth/data/models/login_request_model.dart';
import 'package:ym_blood_app/features/auth/presentation/controllers/auth%20controller/auth_controller.dart';
import 'package:ym_blood_app/features/auth/presentation/controllers/hopsital_controller/hospital_controller.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/const/images_const.dart/images_const.dart';
import 'package:ym_blood_app/utils/form_validation/form_validation_extension.dart';
import 'package:ym_blood_app/utils/keyboard_dismiss/keyboard_dimiss_extension.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  late int selectedHospitalId;
  late TextEditingController councilNumberTextEditingController;
  late TextEditingController passwordTextEditingController;
  final formKey = GlobalKey<FormState>();
  late bool isvisible;
  @override
  void initState() {
    isvisible = true;
    selectedHospitalId = 0;
    councilNumberTextEditingController = TextEditingController();
    passwordTextEditingController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    councilNumberTextEditingController.dispose();
    passwordTextEditingController.dispose();
    super.dispose();
  }

  toogleVisibility() {
    setState(() {});
    isvisible = !isvisible;
  }

  @override
  Widget build(BuildContext context) {
    final result = ref.watch(hospitalListControllerProvider);
    return GestureDetector(
      onTap: context.dismissKeyboard,
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: context.heightPct(0.09),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                ImageConstants.nepalGovLogo,
                height: context.heightPct(0.09),
              ),
              const Column(
                children: [
                  Text(
                    AppConst.loginappbarTitle,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    AppConst.loginappbarSubTitle,
                    style: TextStyle(fontSize: 13, color: Colors.blue),
                  ),
                ],
              ),
            ],
          ),
          elevation: 0.1,
        ),
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(
                      child: Image.asset(
                        ImageConstants.logo,
                        height: context.heightPct(0.16),
                      ),
                    ),
                  ),
                  AsyncValueWidget(
                      value: result,
                      data: (data) {
                        return Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              child: DropdownButtonFormField(
                                  hint: const Text(
                                    'Please select hospital',
                                    style: TextStyle(fontFamily: "Pop"),
                                  ),
                                  style: const TextStyle(
                                      fontSize: 13,
                                      color: AppColorConst.blackColor),
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null) {
                                      return "Please select hospital";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 14, horizontal: 4),
                                    filled: true,
                                    fillColor: const Color(0xffF1F1F1),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: const BorderSide(
                                          width: 0,
                                          color: CupertinoColors.systemGrey6,
                                        ),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    border: InputBorder.none,
                                  ),
                                  items: data.map((e) {
                                    return DropdownMenuItem(
                                      onTap: () {
                                        if (context.mounted) {
                                          setState(() {
                                            selectedHospitalId = e.id;
                                          });
                                        }
                                      },
                                      value: e.id,
                                      child: Text(
                                        e.name,
                                        style:
                                            const TextStyle(fontFamily: "Pop"),
                                      ),
                                    );
                                  }).toList(),
                                  onChanged: (value) {}),
                            ),
                            BloodAppForm(
                              keyboardType: TextInputType.name,
                              textEditingController:
                                  councilNumberTextEditingController,
                              isPrefixIconrequired: false,
                              lable: AppConst.kappNNCNO,
                              validator: (input) => input!.validNNCNo(input),
                            ),
                            BloodAppForm(
                              obscureText: isvisible,
                              sufixWidget: IconButton(
                                  onPressed: toogleVisibility,
                                  icon: Icon(
                                    isvisible
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                    size: 16,
                                  )),
                              textEditingController:
                                  passwordTextEditingController,
                              isPrefixIconrequired: true,
                              prefixIcon: CupertinoIcons.lock,
                              lable: AppConst.kappPassword,
                              validator: (input) =>
                                  input!.isPasswordValid(input),
                            ),
                            SizedBox.fromSize(
                              size: const Size.fromHeight(10),
                            ),
                            ref.watch(loginLoadingController)
                                ? const Center(
                                    child: CircularProgressIndicator.adaptive(),
                                  )
                                : CustomAppButton(
                                    label: "Login",
                                    onPressed: () async {
                                      LoginRequestModel loginRequestModel =
                                          LoginRequestModel(
                                              nmc_no:
                                                  councilNumberTextEditingController
                                                      .text
                                                      .trim(),
                                              password:
                                                  passwordTextEditingController
                                                      .text
                                                      .trim(),
                                              hospital_id: selectedHospitalId);

                                      FocusScopeNode currentFocus =
                                          FocusScope.of(context);

                                      if (!currentFocus.hasPrimaryFocus) {
                                        currentFocus.unfocus();
                                      }

                                      if (formKey.currentState!.validate()) {
                                        ref
                                            .read(
                                                loginLoadingController.notifier)
                                            .update((state) => true);
                                        await ref
                                            .read(
                                                authControllerProvider.notifier)
                                            .login(loginRequestModel, context);
                                        ref
                                            .read(
                                                loginLoadingController.notifier)
                                            .update((state) => false);
                                      }
                                    },
                                  ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: context.heightPct(0.03)),
                              alignment: Alignment.center,
                              child: const Center(
                                child: Text.rich(
                                  TextSpan(
                                    text: 'By continuing, you agree to our ',
                                    style: TextStyle(
                                        fontSize: 12, color: Colors.black),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: '',
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.black),
                                        children: <TextSpan>[
                                          TextSpan(
                                            text: 'Privacy Policy.',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: Colors.blue,
                                                decoration:
                                                    TextDecoration.underline),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Text(
                                "Disclaimer: This app has been intended to be used by nursing personnel only. To use this app, it is necessary to contact respective hospitals",
                                style: TextStyle(
                                    color: CupertinoColors.systemGrey,
                                    fontSize: 12),
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.symmetric(vertical: 25),
                              alignment: Alignment.center,
                              child: const Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Developed by Young Minds',
                                      style: TextStyle(
                                          color: CupertinoColors
                                              .darkBackgroundGray),
                                    ),
                                    Text(
                                      'BTDMS v1.0 2022',
                                      style: TextStyle(
                                          color: CupertinoColors
                                              .darkBackgroundGray),
                                    ),
                                  ]),
                            ),
                          ],
                        );
                      },
                      providerBase: hospitalListControllerProvider),
                  // AmazingAppForm(
                  //   textEditingController: TextEditingController(),
                  //   lable: AppConst.kappHospital,
                  //   validator: (input) => input!.isValidEmail(input),
                  // ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
