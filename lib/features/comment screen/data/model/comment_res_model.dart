class CommentResponseModel {
  String message;

  CommentResponseModel({
    required this.message,
  });

  factory CommentResponseModel.fromJson(Map<String, dynamic> json) =>
      CommentResponseModel(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
