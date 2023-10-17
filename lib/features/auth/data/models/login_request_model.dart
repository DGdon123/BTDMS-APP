// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class LoginRequestModel {
  final String nmc_no;
  final String password;
  final int hospital_id;
  LoginRequestModel({
    required this.nmc_no,
    required this.password,
    required this.hospital_id,
  });

  LoginRequestModel copyWith({
    String? nmc_no,
    String? password,
    int? hospital_id,
  }) {
    return LoginRequestModel(
      nmc_no: nmc_no ?? this.nmc_no,
      password: password ?? this.password,
      hospital_id: hospital_id ?? this.hospital_id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nmc_no': nmc_no,
      'password': password,
      'hospital_id': hospital_id,
    };
  }

  factory LoginRequestModel.fromMap(Map<String, dynamic> map) {
    return LoginRequestModel(
      nmc_no: map['nmc_no'] as String,
      password: map['password'] as String,
      hospital_id: map['hospital_id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginRequestModel.fromJson(String source) =>
      LoginRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'LoginRequestModel(nmc_no: $nmc_no, password: $password, hospital_id: $hospital_id)';

  @override
  bool operator ==(covariant LoginRequestModel other) {
    if (identical(this, other)) return true;

    return other.nmc_no == nmc_no &&
        other.password == password &&
        other.hospital_id == hospital_id;
  }

  @override
  int get hashCode =>
      nmc_no.hashCode ^ password.hashCode ^ hospital_id.hashCode;
}
