import 'dart:convert';

class Choice {
  final int id;
  final String name;
  Choice({
    required this.id,
    required this.name,
  });

  Choice copyWith({
    int? id,
    String? name,
  }) {
    return Choice(
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

  factory Choice.fromMap(Map<String, dynamic> map) {
    return Choice(
      id: map['id'] as int,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Choice.fromJson(String source) =>
      Choice.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Choice(id: $id, name: $name)';

  @override
  bool operator ==(covariant Choice other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
