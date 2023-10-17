import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/commons/custom_button.dart';
import 'package:ym_blood_app/features/blood%20details/data/presentation/views/blood_details_screen.dart';
import 'package:ym_blood_app/features/comment%20screen/presentation/controller/comment_controller.dart';
import 'package:ym_blood_app/features/dashboard/data/models/search_model_on/search_response_model.dart';
import 'package:ym_blood_app/features/dashboard/views/controllers/online_search_controller.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/const/app_const/app_const.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';
import 'package:ym_blood_app/utils/radio%20button/custome_radio_button.dart';
import '../../../utils/app dimension/app_dimension.dart';
import '../data/model/comment_req_model.dart';
import 'widgets/blood_detail_widget.dart';

class CommentScreeen extends ConsumerStatefulWidget {
  const CommentScreeen({super.key, required this.e});
  final SearchResponseModel e;
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CommentScreeenState();
}

class _CommentScreeenState extends ConsumerState<CommentScreeen> {
  final formKey = GlobalKey<FormState>();
  late String selectedState;
  late String selectedReaction;
  List<String> selectedReactions = [];
  late TextEditingController commentTextEditingController;
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
    selectedState = "Transfusion Continued";
    selectedReaction = "";
    commentTextEditingController = TextEditingController();
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
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColorConst.kprimaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text(
          AppConst.kComment,
          textAlign: TextAlign.center,
        ),
      ),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 14),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BloodDetailWidget(widget: widget.e),
                // SizedBox(
                //   height: AppDimensions.paddingDEFAULT,
                // ),
                // CustomAppButton(
                //     label: "ADD YOUR VITALS",
                //     onPressed: () {
                //       normalNav(context, BloodDetailScreen());
                //     }),
                SizedBox(
                  height: context.heightPct(0.01),
                ),
                if (widget.e.reaction_update_count != 2)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.heightPct(0.01),
                      ),
                      const Text(
                        "Reaction",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
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
                      SizedBox(
                        height: context.heightPct(0.01),
                      ),
                    ],
                  ),
                if (widget.e.reaction_update_count != 1 &&
                    widget.e.reaction_update_count != 2)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Status",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: context.heightPct(0.01),
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
                if (widget.e.reaction_update_count != 2)
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: context.heightPct(0.01),
                      ),
                      const Text(
                        "Comment",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: context.heightPct(0.01),
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
                      SizedBox(
                        height: context.heightPct(0.05),
                      ),
                    ],
                  ),
                if (widget.e.reaction_update_count != 2)
                  CustomAppButton(
                    label: "SUBMIT",
                    onPressed: () async {
                      CommentRequestModel commentRequestModel =
                          CommentRequestModel(
                              reaction: selectedReactions.toString(),
                              bag_use_status:
                                  widget
                                              .e.reaction_update_count ==
                                          1
                                      ? widget.e.bagUseStatus
                                      : selectedState,
                              reaction_details:
                                  commentTextEditingController.text.trim());

                      if (formKey.currentState!.validate()) {
                        await ref
                            .read(commentUpdateControllerProvider(
                                    widget.e.id.toString())
                                .notifier)
                            .commentUpdateController(
                                context: context,
                                commentRequestModel: commentRequestModel);
                        ref.invalidate(onlineSearchControllerProvider);
                      }
                    },
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
