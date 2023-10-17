import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_client.dart';
import 'package:ym_blood_app/features/comment%20screen/data/model/comment_res_model.dart';
import 'package:ym_blood_app/features/comment%20screen/data/model/comment_req_model.dart';

abstract class CommmentDataSource {
  Future<CommentResponseModel> commentDS(
      CommentRequestModel commentRequestModel, String id);
}

class CommmentDataSourceImpl implements CommmentDataSource {
  final ApiClient apiClient;

  CommmentDataSourceImpl(this.apiClient);
  @override
  Future<CommentResponseModel> commentDS(
      CommentRequestModel commentRequestModel, String id) async {
    final result = await apiClient.request(
      path: "component-bag/$id",
      type: "post",
      data: commentRequestModel.toMap(),
    );

    return CommentResponseModel.fromJson(result["data"]);
  }
}

final commentProvider = Provider<CommmentDataSource>((ref) {
  return CommmentDataSourceImpl(ref.read(apiClientProvider));
});
