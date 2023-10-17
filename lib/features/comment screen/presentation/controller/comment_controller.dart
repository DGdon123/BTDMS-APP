import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/comment%20screen/data/model/comment_res_model.dart';
import 'package:ym_blood_app/features/comment%20screen/data/model/comment_req_model.dart';
import 'package:ym_blood_app/features/dashboard/dashboard.dart';
import 'package:ym_blood_app/utils/custom_navigation/app_nav.dart';
import 'package:ym_blood_app/utils/snackbar/custome_snack_bar.dart';

import '../../data/repository/comment_repository.dart';

class CommentOnlineController
    extends StateNotifier<AsyncValue<CommentResponseModel>> {
  final CommentReposiotry commentReposiotry;
  final String id;
  CommentOnlineController(this.commentReposiotry, this.id)
      : super(const AsyncValue.loading());

  commentUpdateController(
      {required BuildContext context,
      required CommentRequestModel commentRequestModel}) async {
    final result =
        await commentReposiotry.commentRepository(commentRequestModel, id);
    return result.fold((l) {
      // log(l.message.toString());
      showCustomSnackBar(l.message, context);
      state = AsyncValue.error(
        l,
        StackTrace.fromString(l.message),
      );
      showCustomSnackBar(l.message, context, isError: true);
    }, (r) async {
      state = AsyncValue.data(r);
      if (context.mounted) {
        showCustomSnackBar(r.message, context, isError: false);
        pushAndRemoveUntil(context, const Dashboard());
      }
    });
  }
}

final commentUpdateControllerProvider = StateNotifierProvider.family<
    CommentOnlineController,
    AsyncValue<CommentResponseModel>,
    String>((ref, id) {
  return CommentOnlineController(ref.read(commentReposiotryProvider), id);
});

final commentLoading = StateProvider.autoDispose<bool>((ref) {
  return false;
});
