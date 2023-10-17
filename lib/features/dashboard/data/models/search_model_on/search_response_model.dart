class SearchResponseModel {
  int id;
  String componentName;
  String componentBloodGroup;
  String componentSn;
  String patientName;
  String patientAge;
  String patientGender;
  String hospitalCheckinDate;
  String expiryDate;
  String reactionTime;
  String issuedDate;
  String patientBloodGroup;
  String bagUseStatus;
  String reaction;
  String reactionDetails;
  int reaction_update_count;

  SearchResponseModel(
      {required this.id,
      required this.componentName,
      required this.componentBloodGroup,
      required this.componentSn,
      required this.patientName,
      required this.issuedDate,
      required this.reactionTime,
      required this.patientAge,
      required this.patientGender,
      required this.hospitalCheckinDate,
      required this.patientBloodGroup,
      required this.bagUseStatus,
      required this.reaction,
      required this.reactionDetails,
      required this.reaction_update_count,
      required this.expiryDate});

  factory SearchResponseModel.fromJson(Map<String, dynamic> json) =>
      SearchResponseModel(
        id: json["id"],
        componentName: json["component_name"] ?? "",
        componentBloodGroup: json["component_blood_group"] ?? "",
        componentSn: json["component_sn"] ?? "",
        patientName: json["patient_name"] ?? "",
        patientAge: json["patient_age"] ?? "",
        patientGender: json["patient_gender"] ?? "",
        hospitalCheckinDate: json["hospital_checkin_date"] ?? "",
        patientBloodGroup: json["patient_blood_group"] ?? "",
        bagUseStatus: json["bag_use_status"] ?? "",
        reaction: json["reaction"] ?? "",
        reaction_update_count: json["reaction_update_count"] ?? 0,
        reactionDetails: json["reaction_details"] ?? "",
        expiryDate: json["component_expiry_date"] ?? "",
        issuedDate: json["issued_date"] ?? "",
        reactionTime: json["reaction_updated_date"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "component_name": componentName,
        "component_blood_group": componentBloodGroup,
        "component_sn": componentSn,
        "patient_name": patientName,
        "patient_age": patientAge,
        "patient_gender": patientGender,
        "hospital_checkin_date": hospitalCheckinDate,
        "component_expiry_date": expiryDate,
        "patient_blood_group": patientBloodGroup,
        "bag_use_status": bagUseStatus,
        "reaction": reaction,
        "reaction_details": reactionDetails,
        "reaction_update_count": reaction_update_count,
        "issued_date": issuedDate,
        "reaction_updated_date": reactionTime
      };
}
