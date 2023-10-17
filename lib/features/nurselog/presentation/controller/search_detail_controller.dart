// import 'package:blood/UI/screen/dashboard/log_screen/data/respositories/log_repository.dart';
// import 'package:blood/UI/screen/dashboard/search_detail/data/search_detail_model.dart';
// import 'package:hooks_riverpod/hooks_riverpod.dart';

// class SearchDetailController
//     extends StateNotifier<AsyncValue<SearchDetailDescription>> {
//   SearchDetailController(this.logRepository, this.id)
//       : super(const AsyncValue.loading()) {
//     getSearchDetailDes();
//   }
//   final LogRepository logRepository;
//   final String id;

//   getSearchDetailDes() async {
//     final result = await logRepository.getSearchDetailbyIDRepo(id);
//     return result.fold(
//       (l) {
//         return state = AsyncValue.error(
//           l.message,
//         );
//       },
//       (r) => state = AsyncValue.data(r),
//     );
//   }
// }

// // final SearchDetailControllerProvider =
// //     StateNotifierProvider<SearchDetailController, AsyncValue<List<LogModel>>>((ref) {
// //   return SearchDetailController(ref.read(logRepoProvider));
// // });
// final searchDetailControllerProvider = StateNotifierProvider.family.autoDispose<
//     SearchDetailController,
//     AsyncValue<SearchDetailDescription>,
//     String>((ref, id) {
//   return SearchDetailController(ref.read(logRepoProvider), id);
// });
