// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class LoginResponseModel {
  final UserModel user;
  final String token;
  LoginResponseModel({
    required this.user,
    required this.token,
  });

  LoginResponseModel copyWith({
    UserModel? user,
    String? token,
  }) {
    return LoginResponseModel(
      user: user ?? this.user,
      token: token ?? this.token,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'user': user.toMap(),
      'token': token,
    };
  }

  factory LoginResponseModel.fromMap(Map<String, dynamic> map) {
    return LoginResponseModel(
      user: UserModel.fromMap(map['user']),
      token: map['token'],
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginResponseModel.fromJson(String source) =>
      LoginResponseModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'LoginResponseModel(user: $user, token: $token)';

  @override
  bool operator ==(covariant LoginResponseModel other) {
    if (identical(this, other)) return true;

    return other.user == user && other.token == token;
  }

  @override
  int get hashCode => user.hashCode ^ token.hashCode;
}

class UserModel {
  final int id;
  final int hospital_id;
  final String name;
  final String nmc_no;
  final String unique_key;
  final String email;
  final String phone_no;
  final String hospital_name;
  final String image;
  UserModel({
    required this.id,
    required this.hospital_id,
    required this.name,
    required this.nmc_no,
    required this.unique_key,
    required this.email,
    required this.phone_no,
    required this.hospital_name,
    required this.image,
  });

  UserModel copyWith({
    int? id,
    int? hospital_id,
    String? name,
    String? nmc_no,
    String? unique_key,
    String? email,
    String? phone_no,
    String? hospital_name,
    String? image,
  }) {
    return UserModel(
      id: id ?? this.id,
      hospital_id: hospital_id ?? this.hospital_id,
      name: name ?? this.name,
      nmc_no: nmc_no ?? this.nmc_no,
      unique_key: unique_key ?? this.unique_key,
      email: email ?? this.email,
      phone_no: phone_no ?? this.phone_no,
      hospital_name: hospital_name ?? this.hospital_name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'hospital_id': hospital_id,
      'name': name,
      'nmc_no': nmc_no,
      'unique_key': unique_key,
      'email': email,
      'phone_no': phone_no,
      'hospital_name': hospital_name,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? 0,
      hospital_id: map['hospital_id'] ?? 0,
      name: map['name'] ?? "",
      nmc_no: map['nmc_no'] ?? "",
      unique_key: map['unique_key'] ?? "",
      email: map['email'] ?? "",
      phone_no: map['phone_no'] ?? "",
      hospital_name: map['hospital_name'] ?? "",
      image: map['image'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, hospital_id: $hospital_id, name: $name, nmc_no: $nmc_no, unique_key: $unique_key, email: $email, phone_no: $phone_no, hospital_name: $hospital_name, image: $image)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.hospital_id == hospital_id &&
        other.name == name &&
        other.nmc_no == nmc_no &&
        other.unique_key == unique_key &&
        other.email == email &&
        other.phone_no == phone_no &&
        other.hospital_name == hospital_name &&
        other.image == image;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        hospital_id.hashCode ^
        name.hashCode ^
        nmc_no.hashCode ^
        unique_key.hashCode ^
        email.hashCode ^
        phone_no.hashCode ^
        hospital_name.hashCode ^
        image.hashCode;
  }
}
