import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/app%20drawer/app_drawer.dart';
import 'package:ym_blood_app/features/comment%20screen/presentation/comment_screen.dart';
import 'package:ym_blood_app/features/dashboard/views/controllers/online_search_controller.dart';
import 'package:ym_blood_app/theme/text_theme.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/const/images_const.dart/images_const.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';
import 'package:ym_blood_app/utils/keyboard_dismiss/keyboard_dimiss_extension.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';
import 'package:ym_blood_app/utils/network%20notifier/controller/network_notifier_controller.dart';

import '../offline/invalid_controller.dart';
import '../offline/offline_controller.dart';
import '../offline_dashboard/views/offline_dashboard.dart';

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController searchTextEditingController;
  late String searchresult;
  String scanResult = "";
  @override
  void initState() {
    searchTextEditingController = TextEditingController();
    searchresult = "";
    super.initState();
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // print(scanResult);
    final networkAware = ref.watch(networkAwareControllerProvider);
    return GestureDetector(
      onTap: context.dismissKeyboard,
      // onDoubleTap: context.dismissKeyboard,
      child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            toolbarHeight: context.heightPct(0.12),
            actions: [
              IconButton(
                  onPressed: () {
                    // ref.refresh(invalidControllerProvider);
                    // ref.refresh(offlineControllerProvider);
                    ref.invalidate(invalidControllerProvider);
                    ref.invalidate(offlineControllerProvider);
                  },
                  icon: const Icon(Icons.sync))
            ],
            title: Column(
              children: [
                Image.asset(
                  ImageConstants.nepalGovLogo,
                  height: context.heightPct(0.05),
                ),
                const SizedBox(
                  height: 14,
                ),
                const Text(
                  AppConst.kdashboardAppbar,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 11.0,
                      color: AppColorConst.white,
                      fontWeight: FontWeight.w100),
                ),
              ],
            ),
            backgroundColor: AppColorConst.kprimaryColor,
          ),
          drawer: const AppDrawer(),
          body: networkAware == NetworkStatus.off
              ? const OfflineDashboardScreen()
              : SingleChildScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 14),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text.rich(
                          TextSpan(
                            text: AppConst.kBaloogBaf,
                            style: TextStyle(fontSize: 13, color: Colors.black),
                            children: <TextSpan>[
                              TextSpan(
                                text: '',
                                style: TextStyle(
                                    fontSize: 13, color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: '(*)',
                                    style: TextStyle(
                                      fontSize: 12,
                                      color: Colors.red,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: context.heightPct(0.001),
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          onChanged: (value) {},
                          decoration: InputDecoration(
                            enabled: true,
                            suffixIcon: IconButton(
                              onPressed: scanBarCode,
                              icon: const Icon(
                                Icons.qr_code_scanner,
                                color: AppColorConst.blackColor,
                                size: Sizes.dimen_30,
                              ),
                            ),
                            hintText: AppConst.kBaloogBaf,
                            fillColor: const Color(0xffF1F1F1),
                            filled: true,
                            border: InputBorder.none,
                          ),
                          controller: searchTextEditingController,
                          style: const TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 14),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    foregroundColor: AppColorConst.white,
                                    backgroundColor:
                                        AppColorConst.kprimaryColor,
                                  ),
                                  onPressed: () async {
                                    if (mounted) {
                                      setState(() {
                                        searchresult =
                                            searchTextEditingController.text;
                                      });
                                    }
                                    ref.watch(onlineSearchControllerProvider(
                                            searchTextEditingController.text)
                                        .notifier);
                                  },
                                  icon: const Icon(Icons.search),
                                  label: const Text(AppConst.kSearch)),
                              ElevatedButton.icon(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    foregroundColor: AppColorConst.white,
                                    backgroundColor:
                                        AppColorConst.kprimaryColor,
                                  ),
                                  onPressed: () {
                                    if (mounted) {
                                      setState(() {
                                        searchresult = "";
                                      });
                                    }
                                    searchTextEditingController.clear();
                                  },
                                  icon: const Icon(Icons.clear),
                                  label: const Text(AppConst.KClear)),
                            ],
                          ),
                        ),
                        if (searchresult.isNotEmpty)
                          ref
                              .watch(
                                  onlineSearchControllerProvider(searchresult))
                              .when(
                                  data: (data) => Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          // Text(scanResult ?? "Hello":),
                                          const Text(
                                            AppConst.ksearchResult,
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16),
                                          ),
                                          SizedBox(
                                            height: context.heightPct(0.01),
                                          ),
                                          InkWell(
                                            onTap: () => normalNav(
                                                context,
                                                CommentScreeen(
                                                  e: data.first,
                                                )),
                                            child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 20,
                                                        horizontal: 10),
                                                width: context.widthPct(1),
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: CupertinoColors
                                                        .systemGrey6),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    if (data.first
                                                            .reaction_update_count ==
                                                        2)
                                                      const Center(
                                                        child: Column(
                                                          children: [
                                                            Text(
                                                              "Blood bag already reported",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  color: AppColorConst
                                                                      .kprimaryColor),
                                                            ),
                                                            Divider(),
                                                          ],
                                                        ),
                                                      ),
                                                    SizedBox(
                                                      height: context
                                                          .heightPct(0.01),
                                                    ),
                                                    const Text(
                                                      "Patient Name :",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        data.first.patientName),
                                                    SizedBox(
                                                      height: context
                                                          .heightPct(0.02),
                                                    ),
                                                    const Divider(),
                                                    SizedBox(
                                                      height: context
                                                          .heightPct(0.02),
                                                    ),
                                                    const Text(
                                                      "Bloodbag Component No:",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    Text(
                                                        data.first.componentSn),
                                                    SizedBox(
                                                      height: context
                                                          .heightPct(0.02),
                                                    ),
                                                  ],
                                                )),
                                          )
                                        ],
                                      ),
                                  error: (e, s) =>
                                      Center(child: Text(s.toString())),
                                  loading: () => const Center(
                                        child: CircularProgressIndicator
                                            .adaptive(),
                                      ))
                      ],
                    ),
                  ),
                )),
    );
  }

  Future scanBarCode() async {
    try {
      String scanResult = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);

      setState(() {
        searchresult = scanResult;
        searchTextEditingController.text = scanResult;
      });
    } on PlatformException {
      scanResult = "Failed to get platform version";
    }
  }
}
