// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
import 'dart:convert';

class CommentRequestModel {
  final String reaction;
  final String bag_use_status;
  final String reaction_details;
  CommentRequestModel({
    required this.reaction,
    required this.bag_use_status,
    required this.reaction_details,
  });

  CommentRequestModel copyWith({
    String? reaction,
    String? bag_use_status,
    String? reaction_details,
  }) {
    return CommentRequestModel(
      reaction: reaction ?? this.reaction,
      bag_use_status: bag_use_status ?? this.bag_use_status,
      reaction_details: reaction_details ?? this.reaction_details,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'reaction': reaction,
      'bag_use_status': bag_use_status,
      'reaction_details': reaction_details,
    };
  }

  factory CommentRequestModel.fromMap(Map<String, dynamic> map) {
    return CommentRequestModel(
      reaction: map['reaction'] as String,
      bag_use_status: map['bag_use_status'] as String,
      reaction_details: map['reaction_details'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CommentRequestModel.fromJson(String source) =>
      CommentRequestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'CommentRequestModel( reaction: $reaction, bag_use_status: $bag_use_status, reaction_details: $reaction_details)';
  }

  @override
  bool operator ==(covariant CommentRequestModel other) {
    if (identical(this, other)) return true;

    return other.reaction == reaction &&
        other.bag_use_status == bag_use_status &&
        other.reaction_details == reaction_details;
  }

  @override
  int get hashCode {
    return reaction.hashCode ^
        bag_use_status.hashCode ^
        reaction_details.hashCode;
  }
}
