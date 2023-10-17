// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class ChangePasswordRequestModel {
  final String old_password;
  final String new_password;
  final String confirm_password;
  ChangePasswordRequestModel({
    required this.old_password,
    required this.new_password,
    required this.confirm_password,
  });

  ChangePasswordRequestModel copyWith({
    String? old_password,
    String? new_password,
    String? confirm_password,
  }) {
    return ChangePasswordRequestModel(
      old_password: old_password ?? this.old_password,
      new_password: new_password ?? this.new_password,
      confirm_password: confirm_password ?? this.confirm_password,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'old_password': old_password,
      'new_password': new_password,
      'confirm_password': confirm_password,
    };
  }

  factory ChangePasswordRequestModel.fromMap(Map<String, dynamic> map) {
    return ChangePasswordRequestModel(
      old_password: map['old_password'] as String,
      new_password: map['new_password'] as String,
      confirm_password: map['confirm_password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ChangePasswordRequestModel.fromJson(String source) =>
      ChangePasswordRequestModel.fromMap(
          json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'ChangePasswordRequestModel(old_password: $old_password, new_password: $new_password, confirm_password: $confirm_password)';

  @override
  bool operator ==(covariant ChangePasswordRequestModel other) {
    if (identical(this, other)) return true;

    return other.old_password == old_password &&
        other.new_password == new_password &&
        other.confirm_password == confirm_password;
  }

  @override
  int get hashCode =>
      old_password.hashCode ^ new_password.hashCode ^ confirm_password.hashCode;
}
