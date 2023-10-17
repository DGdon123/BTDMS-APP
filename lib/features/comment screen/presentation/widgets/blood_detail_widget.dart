import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ym_blood_app/features/dashboard/data/models/search_model_on/search_response_model.dart';
import 'package:ym_blood_app/utils/const/app_color/app_color_const.dart';
import 'package:ym_blood_app/utils/mediaquery_extension/mediaquery_extension.dart';

class BloodDetailWidget extends StatelessWidget {
  const BloodDetailWidget({
    super.key,
    required this.widget,
  });

  final SearchResponseModel widget;

  @override
  Widget build(BuildContext context) {
    String dateTimeString = widget
        .expiryDate; // Assuming widget.expiryDate contains "2023-07-09 07:09:21"
    DateTime dateTime = DateTime.parse(dateTimeString);
    String hour = dateTime.hour.toString().padLeft(2, '0');
    String minute = dateTime.minute.toString().padLeft(2, '0');
    String second = dateTime.second.toString().padLeft(2, '0');
    String time = "$hour:$minute:$second";
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: CupertinoColors.secondarySystemFill.withOpacity(0.1),
      ),
      child: Scrollbar(
        // thumbVisibility: true,
        // trackVisibility: true,
        child: SizedBox(
          height: widget.reaction_update_count == 2
              ? context.heightPct(0.8)
              : context.heightPct(0.27),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                if (widget.componentBloodGroup != widget.patientBloodGroup)
                  const CupertinoListTile(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: Text(
                      "Remarks",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      "Blood group doesn't match",
                      style: TextStyle(
                        color: AppColorConst.kprimaryColor,
                        fontFamily: "Pop",
                        fontWeight: FontWeight.w300,
                        fontSize: 12,
                      ),
                    ),
                  ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Component Name :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.componentName,
                      style: const TextStyle(
                        fontFamily: "Pop",
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Blood Bag Component No. :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.componentSn,
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Patient Blood Group :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.patientBloodGroup,
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Blood Bag Blood Group :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.componentBloodGroup,
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Issued to :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.patientName,
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Patient Age :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.patientAge,
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Patient Gender :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.patientGender,
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Hospital Checkin Date :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.hospitalCheckinDate.split(' ')[0],
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Blood-Bag Expiry Date :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.expiryDate.split(' ')[0],
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 6),
                  child: CupertinoListTile(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10),
                    backgroundColor: Colors.white,
                    // leading: const Icon(CupertinoIcons.news),
                    title: const Text(
                      "Issued Date :",
                      style: TextStyle(
                          fontFamily: "Pop",
                          fontSize: 13,
                          fontWeight: FontWeight.w600),
                    ),
                    subtitle: Text(
                      widget.issuedDate.split(' ')[0],
                      style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                    ),
                  ),
                ),
                if (widget.reaction.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: CupertinoListTile(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      backgroundColor: Colors.white,
                      // leading: const Icon(CupertinoIcons.news),
                      title: const Text(
                        "Reaction :",
                        style: TextStyle(
                            fontFamily: "Pop",
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        widget.reaction,
                        style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                      ),
                    ),
                  ),
                if (widget.reactionDetails.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: CupertinoListTile(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      backgroundColor: Colors.white,
                      // leading: const Icon(CupertinoIcons.news),
                      title: const Text(
                        "Reaction Details :",
                        style: TextStyle(
                            fontFamily: "Pop",
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        widget.reactionDetails,
                        style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                      ),
                    ),
                  ),
                if (widget.bagUseStatus.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: CupertinoListTile(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      backgroundColor: Colors.white,
                      // leading: const Icon(CupertinoIcons.news),
                      title: const Text(
                        "Status  :",
                        style: TextStyle(
                            fontFamily: "Pop",
                            fontSize: 13,
                            fontWeight: FontWeight.w600),
                      ),
                      subtitle: Text(
                        widget.bagUseStatus,
                        style: const TextStyle(fontFamily: "Pop", fontSize: 12),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
