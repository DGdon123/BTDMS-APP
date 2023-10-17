import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/commons/custom_button.dart';
import 'package:ym_blood_app/commons/custom_form.dart';
import 'package:ym_blood_app/features/dashboard/dashboard.dart';
import 'package:ym_blood_app/features/offline/invalid_controller.dart';
import 'package:ym_blood_app/features/offline/offline_controller.dart';
import 'package:ym_blood_app/features/offline/offline_data_model.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

import '../../../utils/radio button/custome_radio_button.dart';

class EditInvalidScreen extends ConsumerStatefulWidget {
  const EditInvalidScreen({super.key, required this.e});
  final OfflineDataModel e;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EditInvalidScreenState();
}

class _EditInvalidScreenState extends ConsumerState<EditInvalidScreen> {
  final formKey = GlobalKey<FormState>();
  List<String> selectedReactions = [];
  late TextEditingController componentNametextEditingController;
  late TextEditingController reactionDetailTextEditingController;
  late String selectedReaction;
  late String selectedState;
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
  void initState() {
    componentNametextEditingController =
        TextEditingController(text: widget.e.componentSn);
    reactionDetailTextEditingController =
        TextEditingController(text: widget.e.reactionDetails);
    selectedReaction = widget.e.reaction;

    selectedState = widget.e.bagUseStatus;
    super.initState();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorConst.kprimaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(AppConst.kEditCommentOffline),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                BloodAppForm(
                    validator: (value) {
                      if (value == null) {
                        return "Please enter blood bag ID";
                      }
                      return null;
                    },
                    textEditingController: componentNametextEditingController,
                    lable: "Blood Bag ID"),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(
                        vertical: context.heightPct(0.01),
                      ),
                      child: const Text(
                        "Reaction",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
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
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: TextFormField(
                    maxLines: 10,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please  comment";
                      }
                      return null;
                    },
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: reactionDetailTextEditingController,
                    style: const TextStyle(
                        fontSize: 13, fontWeight: FontWeight.bold),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0.8, color: CupertinoColors.systemRed),
                          borderRadius: BorderRadius.circular(10)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0,
                              color: CupertinoColors.lightBackgroundGray),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(
                              width: 0,
                              color: CupertinoColors.lightBackgroundGray),
                          borderRadius: BorderRadius.circular(10)),
                      border: InputBorder.none,
                      fillColor: CupertinoColors.systemGrey6,
                      filled: true,
                      hintStyle: const TextStyle(fontSize: 13),
                      hintText: "Add your comment",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: CustomAppButton(
                      label: "SUBMIT",
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          // var data = {
                          //   "bag_use_status": selectedState,
                          //   "component_sn":
                          //       componentNametextEditingController.text,
                          //   "reaction": selectedReaction,
                          //   "reaction_details":
                          //       reactionDetailTextEditingController.text,
                          // };
                          final OfflineDataModel offlineDataModel =
                              OfflineDataModel(
                            bagUseStatus: selectedState,
                            componentSn:
                                componentNametextEditingController.text,
                            reaction: selectedReactions.toString(),
                            reactionDetails:
                                reactionDetailTextEditingController.text,
                          );
                          await ref
                              .read(invalidControllerProvider.notifier)
                              .updateData(widget.e, offlineDataModel);
                          ref.invalidate(offlineControllerProvider);
                          if (!mounted) return;
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: CupertinoColors.activeGreen,
                              behavior: SnackBarBehavior.floating,
                              content: Text(
                                "Changes has been saved",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          );
                          normalNav(context, const Dashboard());
                        }
                      }),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
