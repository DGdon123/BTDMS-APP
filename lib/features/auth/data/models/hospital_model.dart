import 'dart:convert';

class HospitalModel {
  int id;
  String name;

  HospitalModel({
    required this.id,
    required this.name,
  });

  HospitalModel copyWith({
    int? id,
    String? name,
  }) {
    return HospitalModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory HospitalModel.fromMap(Map<String, dynamic> map) {
    return HospitalModel(
      id: map['id'] ?? 1,
      name: map['name'] ?? "",
    );
  }

  String toJson() => json.encode(toMap());

  factory HospitalModel.fromJson(String source) =>
      HospitalModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'HospitalModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant HospitalModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
