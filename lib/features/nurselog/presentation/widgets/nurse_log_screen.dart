import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/commons/asyn_widget/asyncvalue_widget.dart';
import 'package:ym_blood_app/features/nurselog/presentation/controller/nurselog_controller.dart';
import 'package:ym_blood_app/theme/text_theme.dart';
import 'package:ym_blood_app/utils/app%20dimension/app_dimension.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

import '../../../blood details/data/presentation/views/blood_details_screen.dart';

class NurseLogScreen extends ConsumerStatefulWidget {
  const NurseLogScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NurseLogScreenState();
}

class _NurseLogScreenState extends ConsumerState<NurseLogScreen> {
  String result = "";
  final TextEditingController startDateController = TextEditingController();
  DateTime? startDate;
  Future<DateTime?> pickDate() async {
    return await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1999),
        lastDate: DateTime(2999),
        initialEntryMode: DatePickerEntryMode.calendarOnly,
        builder: (context, child) => Theme(
              data: Theme.of(context).copyWith(
                // textTheme: AppTextTheme.appTextTheme.copyWith(bodyText2: const TextStyle()),
                colorScheme: const ColorScheme.light(
                  primary: AppColorConst.kprimaryColor, // <-- SEE HERE
                  onPrimary: Colors.white, // <-- SEE HERE
                  onSurface: Colors.black, // <-- SEE HERE
                ),
                textButtonTheme: TextButtonThemeData(
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.red, // button text color
                  ),
                ),
              ),
              child: child!,
            ));
  }

  String _displayText(DateTime? date) {
    if (date != null) {
      return ' Date: ${date.toString().split(' ')[0]}';
    } else {
      return 'Choose The Date';
    }
  }

  String? startDateValidator(value) {
    if (startDate == null) return "Please select  the date";
    return null;

    /// play with logic
  }

  String convertToNepaliTime(DateTime gregorianTime) {
    // Nepali time offset from UTC
    final int nepaliTimeOffset = 5; // Adjust this according to your timezone

    // Calculate Nepali hours, minutes, and seconds
    int nepaliHour = (gregorianTime.hour + nepaliTimeOffset) % 24;
    int nepaliMinute = gregorianTime.minute;
    int nepaliSecond = gregorianTime.second;

    // Add 85 minutes and 48 seconds
    nepaliMinute += 45;
    nepaliSecond += 09;

    // Adjust minutes and seconds if they exceed 60
    while (nepaliSecond >= 60) {
      nepaliSecond -= 60;
      nepaliMinute++;
    }
    while (nepaliMinute >= 60) {
      nepaliMinute -= 60;
      nepaliHour = (nepaliHour + 1) % 24;
    }

    // Convert to formatted Nepali time string
    String formattedNepaliTime =
        '$nepaliHour:${nepaliMinute.toString().padLeft(2, '0')}:${nepaliSecond.toString().padLeft(2, '0')}';

    return formattedNepaliTime;
  }

  @override
  void initState() {
    // TODO: implement initState
    result = "";
  }

  @override
  Widget build(BuildContext context) {
    final data = ref.watch(nurselogcontrollerProvider(result));
    const textStyle = TextStyle(
      color: Color(0xff191919),
      fontSize: 13,
      fontWeight: FontWeight.w700,
      fontFamily: 'Pop',
    );
    const textStyle2 =
        TextStyle(fontFamily: 'Pop', fontSize: 12, color: Colors.black);
    return Scaffold(
      backgroundColor: const Color(0xffF4F4F4),
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        backgroundColor: AppColorConst.kprimaryColor,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          'Nurse log',
          textAlign: TextAlign.center,
          style: AppTextTheme.appTextTheme.bodyLarge,
        ),
      ),
      body: AsyncValueWidget(
        listCount: 4,
        height: 100,
        isList: true,
        value: data,
        providerBase: nurselogcontrollerProvider(result),
        data: (data) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: startDateController,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                        onPressed: () {
                          startDateValidator(startDateController);
                        },
                        icon: const Icon(
                          Icons.search,
                          size: 30,
                        )),
                    border: InputBorder.none,
                    fillColor: const Color(0xffFFFFFF),
                    filled: true,
                    focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)),
                    hintText: 'Choose The Date',
                    hintStyle: const TextStyle(
                      fontFamily: 'Pop',
                    ),
                    // errorStyle: const TextStyle(height: 0.7),
                  ),
                  onTap: () async {
                    startDate = await pickDate();
                    startDateController.text = _displayText(startDate);
                    final dateValue = startDate.toString().split(' ')[0];

                    setState(() {
                      result = dateValue.toString();
                    });
                  },
                  readOnly: true,
                  validator: startDateValidator,
                  style: const TextStyle(
                      fontFamily: 'Pop',
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Colors.black),
                ),
                if (data.isEmpty)
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.only(top: 250),
                      child: Text(
                        "Records Not Found !",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                if (data.isNotEmpty)
                  SizedBox(
                    height: context.heightPct(0.74),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        children: [
                          ...data.map(
                            (e) {
                              return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  width: MediaQuery.of(context).size.width,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 0, vertical: 10),
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: const Color(0xffA22447)
                                                .withOpacity(.05),
                                            offset: const Offset(0, 0),
                                            blurRadius: 20,
                                            spreadRadius: 3)
                                      ],
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Component No. :",
                                            style: textStyle,
                                          ),
                                          // Container(
                                          //   width: context.widthPct(0.278),
                                          //   height: context.heightPct(0.043),
                                          //   child: ElevatedButton(
                                          //     onPressed: () {
                                          //       normalNav(context,
                                          //           BloodDetailScreen());
                                          //     },
                                          //     style: ElevatedButton.styleFrom(
                                          //       shape: RoundedRectangleBorder(
                                          //         borderRadius:
                                          //             BorderRadius.circular(7),
                                          //       ),
                                          //       backgroundColor:
                                          //           AppColorConst.kprimaryColor,
                                          //     ),
                                          //     child: Text(
                                          //       "View Details",
                                          //       textAlign: TextAlign.center,
                                          //       style: const TextStyle(
                                          //           letterSpacing: 0.1,
                                          //           fontFamily: 'Pop',
                                          //           color: AppColorConst.white,
                                          //           fontSize:
                                          //               AppDimensions.body_10,
                                          //           fontWeight: AppDimensions
                                          //               .fontNormal),
                                          //     ),
                                          //   ),
                                          // ),
                                        ],
                                      ),
                                      Text(e.componentSn, style: textStyle2),
                                      const SizedBox(
                                        height: Sizes.dimen_10,
                                      ),
                                      const Text(
                                        "Reaction :",
                                        style: textStyle,
                                      ),
                                      Text(e.reaction, style: textStyle2),
                                      const SizedBox(
                                        height: Sizes.dimen_10,
                                      ),
                                      const Text(
                                        "Blood Bag Status :",
                                        style: textStyle,
                                      ),
                                      Text(e.bag_use_status, style: textStyle2),
                                      const SizedBox(
                                        height: Sizes.dimen_10,
                                      ),
                                      const Text(
                                        "Reaction Updated Time :",
                                        style: textStyle,
                                      ),
                                      Text(
                                        convertToNepaliTime(e.createdAt),
                                        style: textStyle2,
                                      ),
                                      const SizedBox(
                                        height: Sizes.dimen_10,
                                      ),
                                      const Text("Date", style: textStyle),
                                      Text(e.date.toString().split(' ')[0],
                                          style: textStyle2),
                                      Container(
                                        height: 1,
                                        color: AppColorConst.kprimaryColor,
                                      )
                                    ],
                                  ));
                            },
                          )
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          );
        },
      ),

      // ref.watch(nurselogcontrollerProvider(result)).when(
      //     data: (data) {

      //     },
      //     error: (error, stackTrace) => Text(error.toString()),
      //     loading: () => const Center(
      //           child: CircularProgressIndicator.adaptive(),
      //         )),
    );
  }
}
