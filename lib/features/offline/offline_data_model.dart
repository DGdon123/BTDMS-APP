// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class OfflineDataModel {
  final String bagUseStatus;
  final String componentSn;
  final String reaction;
  final String reactionDetails;
  OfflineDataModel({
    required this.bagUseStatus,
    required this.componentSn,
    required this.reaction,
    required this.reactionDetails,
  });

  OfflineDataModel copyWith({
    String? bagUseStatus,
    String? componentSn,
    String? reaction,
    String? reactionDetails,
  }) {
    return OfflineDataModel(
      bagUseStatus: bagUseStatus ?? this.bagUseStatus,
      componentSn: componentSn ?? this.componentSn,
      reaction: reaction ?? this.reaction,
      reactionDetails: reactionDetails ?? this.reactionDetails,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bag_use_status': bagUseStatus,
      'component_sn': componentSn,
      'reaction': reaction,
      'reaction_details': reactionDetails,
    };
  }

  factory OfflineDataModel.fromMap(Map<String, dynamic> map) {
    return OfflineDataModel(
      bagUseStatus: map['bag_use_status'] ?? "Transfusion Continued",
      componentSn: map['component_sn'] as String,
      reaction: map['reaction'] ?? "Others",
      reactionDetails: map['reaction_details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory OfflineDataModel.fromJson(String source) =>
      OfflineDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OfflineDataModel(bagUseStatus: $bagUseStatus, componentSn: $componentSn, reaction: $reaction, reactionDetails: $reactionDetails)';
  }

  @override
  bool operator ==(covariant OfflineDataModel other) {
    if (identical(this, other)) return true;

    return other.bagUseStatus == bagUseStatus &&
        other.componentSn == componentSn &&
        other.reaction == reaction &&
        other.reactionDetails == reactionDetails;
  }

  @override
  int get hashCode {
    return bagUseStatus.hashCode ^
        componentSn.hashCode ^
        reaction.hashCode ^
        reactionDetails.hashCode;
  }
}
