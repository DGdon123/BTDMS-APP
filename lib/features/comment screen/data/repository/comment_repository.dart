import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_exception/api_exception.dart';
import 'package:ym_blood_app/core/app_error.dart';
import 'package:ym_blood_app/features/comment%20screen/data/model/comment_res_model.dart';
import 'package:ym_blood_app/features/comment%20screen/data/model/comment_req_model.dart';

import '../data_source/comment_data_source.dart';

final commentReposiotryProvider = Provider<CommentReposiotry>((ref) {
  return CommentReposiotryImpl(ref.read(commentProvider));
});

abstract class CommentReposiotry {
  Future<Either<AppError, CommentResponseModel>> commentRepository(
      CommentRequestModel commentRequestModel, String id);
}

class CommentReposiotryImpl implements CommentReposiotry {
  final CommmentDataSource commmentDataSource;
  CommentReposiotryImpl(this.commmentDataSource);

  @override
  Future<Either<AppError, CommentResponseModel>> commentRepository(
      CommentRequestModel commentRequestModel, String id) async {
    try {
      final result =
          await commmentDataSource.commentDS(commentRequestModel, id);

      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }
}
