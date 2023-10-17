import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:expansion_tile_card/expansion_tile_card.dart';
import 'package:ym_blood_app/utils/app%20dimension/app_dimension.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

import '../../../../../theme/text_theme.dart';
import '../../../../../utils/const/app_const/app_const.dart';

class BloodDetailScreen extends ConsumerStatefulWidget {
  const BloodDetailScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BloodDetailScreenState();
}

class _BloodDetailScreenState extends ConsumerState<BloodDetailScreen> {
  bool _isExpanded = false;
  bool _isExpanded1 = false;
  bool _isExpanded2 = false;
  bool _isExpanded3 = false;
  bool _isExpanded4 = false;
  bool _isExpanded5 = false;
  bool _isExpanded6 = false;
  TextEditingController first = TextEditingController();
  TextEditingController second = TextEditingController();
  TextEditingController third = TextEditingController();
  TextEditingController fourth = TextEditingController();
  TextEditingController fifth = TextEditingController();
  TextEditingController first1 = TextEditingController();
  TextEditingController second1 = TextEditingController();
  TextEditingController third1 = TextEditingController();
  TextEditingController fourth1 = TextEditingController();
  TextEditingController fifth1 = TextEditingController();
  TextEditingController first2 = TextEditingController();
  TextEditingController second2 = TextEditingController();
  TextEditingController third2 = TextEditingController();
  TextEditingController fourth2 = TextEditingController();
  TextEditingController fifth2 = TextEditingController();
  TextEditingController first3 = TextEditingController();
  TextEditingController second3 = TextEditingController();
  TextEditingController third3 = TextEditingController();
  TextEditingController fourth3 = TextEditingController();
  TextEditingController fifth3 = TextEditingController();
  TextEditingController first4 = TextEditingController();
  TextEditingController second4 = TextEditingController();
  TextEditingController third4 = TextEditingController();
  TextEditingController fourth4 = TextEditingController();
  TextEditingController fifth4 = TextEditingController();
  TextEditingController first5 = TextEditingController();
  TextEditingController second5 = TextEditingController();
  TextEditingController third5 = TextEditingController();
  TextEditingController fourth5 = TextEditingController();
  TextEditingController fifth5 = TextEditingController();
  TextEditingController first6 = TextEditingController();
  TextEditingController second6 = TextEditingController();
  TextEditingController third6 = TextEditingController();
  TextEditingController fourth6 = TextEditingController();
  TextEditingController fifth6 = TextEditingController();
  TextEditingController first7 = TextEditingController();
  TextEditingController second7 = TextEditingController();
  TextEditingController third7 = TextEditingController();
  TextEditingController fourth7 = TextEditingController();
  TextEditingController fifth7 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        backgroundColor: AppColorConst.kprimaryColor,
        title: Text(
          "${AppConst.kBlooddetail} of BR2080-2075-05",
          style: AppTextTheme.appTextTheme.bodyLarge,
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8),
            child: ExpansionTileCard(
              paddingCurve: Curves.easeInCirc,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Text(
                "1. Before starting the transfusion",
                style: TextStyle(
                  fontFamily: 'Pop',
                  fontSize: AppDimensions.body_14,
                  color: AppColorConst.blackColor,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded = expanded;
                });
              },
              trailing: _isExpanded
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when expanded
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when collapsed
                    ),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "General Appearance of the patient :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: first,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter Appearance of the patient",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Temperature Fahrenheit Degree :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: second,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter temperature",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Pulse (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: third,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter pulse per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Blood pressure (mmHg) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fourth,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter blood pressure",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Respiration (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fifth,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter respiration per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingDEFAULT,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8),
            child: ExpansionTileCard(
              paddingCurve: Curves.easeInCirc,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Text(
                "2. As soon as the transfusion is started",
                style: TextStyle(
                  fontFamily: 'Pop',
                  fontSize: AppDimensions.body_14,
                  color: AppColorConst.blackColor,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded1 = expanded;
                });
              },
              trailing: _isExpanded1
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when expanded
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when collapsed
                    ),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "General Appearance of the patient :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: first1,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter Appearance of the patient",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Temperature Fahrenheit Degree :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: second1,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter temperature",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Pulse (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: third1,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter pulse per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Blood pressure (mmHg) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fourth1,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter blood pressure",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Respiration (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fifth1,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter respiration per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingDEFAULT,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8),
            child: ExpansionTileCard(
              paddingCurve: Curves.easeInCirc,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Text(
                "3. After Fifteen minutes",
                style: TextStyle(
                  fontFamily: 'Pop',
                  fontSize: AppDimensions.body_14,
                  color: AppColorConst.blackColor,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded2 = expanded;
                });
              },
              trailing: _isExpanded2
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when expanded
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when collapsed
                    ),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "General Appearance of the patient :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: first2,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter Appearance of the patient",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Temperature Fahrenheit Degree :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: second2,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter temperature",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Pulse (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: third2,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter pulse per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Blood pressure (mmHg) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fourth2,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter blood pressure",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Respiration (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fifth2,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter respiration per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingDEFAULT,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8),
            child: ExpansionTileCard(
              paddingCurve: Curves.easeInCirc,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Text(
                "4. First Hour Monitoring of blood transfusion",
                style: TextStyle(
                  fontFamily: 'Pop',
                  fontSize: AppDimensions.body_14,
                  color: AppColorConst.blackColor,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded3 = expanded;
                });
              },
              trailing: _isExpanded3
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when expanded
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when collapsed
                    ),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "General Appearance of the patient :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: first3,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter Appearance of the patient",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Temperature Fahrenheit Degree :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: second3,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter temperature",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Pulse (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: third3,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter pulse per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Blood pressure (mmHg) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fourth3,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter blood pressure",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Respiration (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fifth3,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter respiration per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingDEFAULT,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8),
            child: ExpansionTileCard(
              paddingCurve: Curves.easeInCirc,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Text(
                "5. Second Hour Monitoring of blood transfusion",
                style: TextStyle(
                  fontFamily: 'Pop',
                  fontSize: AppDimensions.body_14,
                  color: AppColorConst.blackColor,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded4 = expanded;
                });
              },
              trailing: _isExpanded4
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when expanded
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when collapsed
                    ),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "General Appearance of the patient :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: first4,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter Appearance of the patient",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Temperature Fahrenheit Degree :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: second4,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter temperature",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Pulse (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: third4,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter pulse per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Blood pressure (mmHg) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fourth4,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter blood pressure",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Respiration (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fifth4,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter respiration per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingDEFAULT,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8),
            child: ExpansionTileCard(
              paddingCurve: Curves.easeInCirc,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Text(
                "6. Third Hour Monitoring of blood transfusion",
                style: TextStyle(
                  fontFamily: 'Pop',
                  fontSize: AppDimensions.body_14,
                  color: AppColorConst.blackColor,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded5 = expanded;
                });
              },
              trailing: _isExpanded5
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when expanded
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when collapsed
                    ),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "General Appearance of the patient :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: first5,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter Appearance of the patient",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Temperature Fahrenheit Degree :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: second5,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter temperature",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Pulse (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: third5,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter pulse per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Blood pressure (mmHg) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fourth5,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter blood pressure",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Respiration (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fifth5,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter respiration per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingDEFAULT,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, right: 9.0, top: 8),
            child: ExpansionTileCard(
              paddingCurve: Curves.easeInCirc,
              baseColor: Colors.white,
              expandedColor: Colors.white,
              title: Text(
                "7. Fourth Hour Monitoring of blood transfusion",
                style: TextStyle(
                  fontFamily: 'Pop',
                  fontSize: AppDimensions.body_14,
                  color: AppColorConst.blackColor,
                ),
              ),
              onExpansionChanged: (expanded) {
                setState(() {
                  _isExpanded6 = expanded;
                });
              },
              trailing: _isExpanded6
                  ? Icon(
                      Icons.keyboard_arrow_up,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when expanded
                    )
                  : Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColorConst
                          .blackColor, // Change the color of the arrow when collapsed
                    ),
              children: <Widget>[
                Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "General Appearance of the patient :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: first6,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter Appearance of the patient",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Temperature Fahrenheit Degree :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: second6,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter temperature",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Pulse (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: third6,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter pulse per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Blood pressure (mmHg) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fourth6,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter blood pressure",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: Text(
                            "Respiration (/min) :",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                height: 1.5,
                                letterSpacing: 0.8,
                                fontSize: AppDimensions.body_12),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingSMALL,
                    ),
                    Row(
                      children: [
                        Container(
                          width: context.widthPct(0.914),
                          height: context.heightPct(0.043),
                          padding: EdgeInsets.only(
                            left: 15.0,
                          ),
                          child: TextFormField(
                            maxLines: 1,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            controller: fifth6,
                            style: const TextStyle(fontSize: 12),
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(
                                  vertical: 8.0, horizontal: 10.0),
                              filled: true,
                              fillColor: Colors.grey[
                                  200], // Set your desired background color
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                    8.0), // Adjust the border radius as needed
                                borderSide: BorderSide.none, // Hide the border
                              ),
                              hintText: "Enter respiration per minute",
                              hintStyle: const TextStyle(fontSize: 12),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: AppDimensions.paddingDEFAULT,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: context.heightPct(0.12)),
        ],
      ),
      floatingActionButton: Container(
        width: context.widthPct(0.9),
        height: context.heightPct(0.06),
        decoration: BoxDecoration(
          color: AppColorConst.kprimaryColor,

          borderRadius: BorderRadius.circular(8.0), // Adjust the border radius
        ),
        child: FloatingActionButton(
          onPressed: () {
            // Handle the action you want to perform when the button is pressed
          },
          backgroundColor:
              Colors.transparent, // Set the background color of the button
          elevation: 500,
          child: Text(
            "UPDATE",
            style: TextStyle(
                color: AppColorConst.white,
                fontWeight: AppDimensions.fontNormal,
                fontSize: 13),
          ), // Set the text of the button
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
