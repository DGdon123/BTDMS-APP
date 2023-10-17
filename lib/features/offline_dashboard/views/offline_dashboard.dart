import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/offline/offline_controller.dart';
import 'package:ym_blood_app/features/offline/offline_data_model.dart';
import 'package:ym_blood_app/theme/text_theme.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

import '../../../utils/const/app_color/app_color_const.dart';
import '../../../utils/radio button/custome_radio_button.dart';
import '../widgets/offline_warning_widget.dart';

class OfflineDashboardScreen extends ConsumerStatefulWidget {
  const OfflineDashboardScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _OfflineDashboardScreenState();
}

class _OfflineDashboardScreenState
    extends ConsumerState<OfflineDashboardScreen> {
  late TextEditingController commentTextEditingController;
  late String selectedState;
  final formKey = GlobalKey<FormState>();
  late TextEditingController searchTextEditingController;
  late String searchresult;
  List<String> selectedReactions = [];
  late String selectedReaction;
  void _onReactionSelected(String reaction) {
    if (selectedReactions.contains(reaction)) {
      setState(() {
        selectedReactions.remove(reaction);
      });
    } else {
      setState(() {
        selectedReactions.add(reaction);
      });
    }
  }

  String scanResult = "";
  @override
  void initState() {
    selectedReaction = "";
    selectedState = "Transfusion Continued";
    commentTextEditingController = TextEditingController();
    searchTextEditingController = TextEditingController();
    searchresult = "";
    super.initState();
  }

  @override
  void dispose() {
    searchTextEditingController.dispose();
    commentTextEditingController.dispose();
    super.dispose();
  }

  final List<String> reactionList = [
    "No Reaction",
    "Fever",
    "Chills",
    "Rigors",
    "Urticaria",
    "Pruritus",
    "Oliguria",
    "Hypotension",
    "Tachycardia",
    "Dysphoria",
    "Anxiety",
    "Flushing",
    "Coughing",
    "Others"
  ];
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OfflineWarningWidget(),
              const Text.rich(
                TextSpan(
                  text: AppConst.kBaloogBaf,
                  style: TextStyle(fontSize: 13, color: Colors.black),
                  children: <TextSpan>[
                    TextSpan(
                      text: '',
                      style: TextStyle(fontSize: 13, color: Colors.black),
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
                style:
                    const TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: AppColorConst.white,
                          backgroundColor: AppColorConst.kprimaryColor,
                        ),
                        onPressed: () async {
                          if (mounted) {
                            setState(() {
                              searchresult = searchTextEditingController.text;
                            });
                          }
                          // ref.watch(onlineSearchControllerProvider(
                          //         searchTextEditingController.text)
                          //     .notifier);
                        },
                        icon: const Icon(Icons.search),
                        label: const Text(AppConst.kSearch)),
                    ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          foregroundColor: AppColorConst.white,
                          backgroundColor: AppColorConst.kprimaryColor,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Text("Search Result : $searchresult ")),
                    const Text(
                      "Reaction",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: context.heightPct(0.01),
                    ),
                    Theme(
                      data: ThemeData(
                        colorScheme: ColorScheme.fromSwatch().copyWith(
                            secondary: AppColorConst
                                .dangerColor), // Set the desired tick color
                      ),
                      child: Wrap(
                        spacing: 8.0,
                        children: reactionList.map((String reaction) {
                          return ChoiceChip(
                            label: Text(
                              reaction,
                              style: TextStyle(
                                fontSize: 10,
                                color: selectedReactions.contains(reaction)
                                    ? Colors
                                        .white // Set the text color for selected chips
                                    : AppColorConst.blackColor,
                              ),
                            ),
                            backgroundColor: CupertinoColors.systemGrey5,
                            selectedColor: AppColorConst.dangerColor,
                            selected: selectedReactions.contains(reaction),
                            onSelected: (bool selected) {
                              _onReactionSelected(reaction);
                            },
                          );
                        }).toList(),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: context.heightPct(0.01)),
                      child: const Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 0),
                      decoration: BoxDecoration(
                          color: AppColorConst.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                                color: CupertinoColors.systemGrey6,
                                spreadRadius: 2,
                                offset: Offset(2, -1))
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            LabeledRadio(
                              onChanged: (value) {
                                setState(() {
                                  selectedState = value.toString();
                                });
                              },
                              groupValue: selectedState,
                              label: "Transfusion Continued",
                              value: "Transfusion Continued",
                              padding: EdgeInsets.zero,
                            ),
                            LabeledRadio(
                              onChanged: (value) {
                                setState(() {
                                  selectedState = value.toString();
                                });
                              },
                              groupValue: selectedState,
                              label: "Return to Blood Bank",
                              value: "Return to Blood Bank",
                              padding: EdgeInsets.zero,
                            ),
                            LabeledRadio(
                              onChanged: (value) {
                                setState(() {
                                  selectedState = value.toString();
                                });
                              },
                              groupValue: selectedState,
                              label: "Blood Discarded",
                              value: "Blood Discarded",
                              padding: EdgeInsets.zero,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      "Comment",
                      style:
                          TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      maxLines: 6,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please  comment";
                        }
                        return null;
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: commentTextEditingController,
                      style: const TextStyle(fontSize: 12),
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.name,
                      decoration: const InputDecoration(
                        fillColor: AppColorConst.white,
                        border: InputBorder.none,
                        filled: true,
                        hintStyle: TextStyle(fontSize: 13),
                        hintText: "Add your comment",
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: AppColorConst.white,
                              backgroundColor: AppColorConst.kprimaryColor,
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                final OfflineDataModel offlineData =
                                    OfflineDataModel(
                                        bagUseStatus: selectedState,
                                        componentSn:
                                            searchTextEditingController.text,
                                        reaction: selectedReactions.toString(),
                                        reactionDetails:
                                            commentTextEditingController.text);
                                await ref
                                    .read(offlineControllerProvider.notifier)
                                    .setData(offlineData);
                                if (!mounted) return;
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    backgroundColor:
                                        CupertinoColors.activeGreen,
                                    behavior: SnackBarBehavior.floating,
                                    content: Text(
                                      "Comment has been saved",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                );
                                if (mounted) {
                                  setState(() {
                                    searchresult = "";
                                    searchTextEditingController.clear();
                                    commentTextEditingController.clear();
                                  });
                                }
                              }

                              // print(commentTextEditingController.text);
                              // print(selectedState);
                              // print(selectedReaction);

                              // ref.watch(onlineSearchControllerProvider(
                              //         searchTextEditingController.text)
                              //     .notifier);
                            },
                            child: const Text("Submit")),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              elevation: 0,
                              foregroundColor: AppColorConst.white,
                              backgroundColor: AppColorConst.kprimaryColor,
                            ),
                            onPressed: () {
                              if (mounted) {
                                setState(() {
                                  searchresult = "";
                                });
                              }
                              searchTextEditingController.clear();
                            },
                            child: const Text(AppConst.KClear)),
                      ],
                    )
                  ],
                ),
            ],
          ),
        ),
      ),
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
