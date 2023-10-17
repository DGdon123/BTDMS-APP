// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LogModel {
  final int id;
  final int nurseId;
  final String componentSn;
  final DateTime date;
  final String bag_use_status;
  final String reaction;
  final DateTime createdAt;
  // final DateTime updatedAt;
  LogModel({
    required this.id,
    required this.nurseId,
    required this.componentSn,
    required this.date,
    required this.reaction,
    required this.bag_use_status,
    required this.createdAt,
    // required this.updatedAt,
  });

  LogModel copyWith({
    int? id,
    int? nurseId,
    String? componentSn,
    DateTime? date,
    String? bag_use_status,
    String? reaction,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return LogModel(
      id: id ?? this.id, reaction: reaction ?? this.reaction,
      nurseId: nurseId ?? this.nurseId,
      componentSn: componentSn ?? this.componentSn,
      date: date ?? this.date,
      bag_use_status: bag_use_status ?? this.bag_use_status,
      createdAt: createdAt ?? this.createdAt,

      // updatedAt: updatedAt ?? updatedAt,
    );
  }

  factory LogModel.fromMap(Map<String, dynamic> map) {
    return LogModel(
      id: map['id'] ?? 0, reaction: map['reaction'] ?? "",
      nurseId: map['nurse_id'] ?? 0,
      componentSn: map['component_sn'] ?? "",
      date: DateTime.parse(map['date']),
      bag_use_status: map['bag_use_status'] ?? "",
      createdAt: DateTime.parse(map['created_at']),

      // updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt'] as int),
    );
  }

  factory LogModel.fromJson(String source) =>
      LogModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
