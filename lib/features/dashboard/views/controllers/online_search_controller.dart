import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/dashboard/data/models/search_model_on/search_response_model.dart';
import 'package:ym_blood_app/features/dashboard/data/repository/search_respository.dart';

class OnlineSearchControllerNotifier
    extends StateNotifier<AsyncValue<List<SearchResponseModel>>> {
  final SearchOnlineRepository searchOnlineRepository;
  final String query;
  OnlineSearchControllerNotifier(
      {required this.searchOnlineRepository, required this.query})
      : super(const AsyncValue.loading()) {
    getOnlineSearchResult();
  }
  getOnlineSearchResult() async {
    final result = await searchOnlineRepository.getNurseLog(query);
    return result.fold(
      (l) => state = AsyncValue.error(
        l.message,
        StackTrace.fromString(l.message),
      ),
      (r) {
        return state = AsyncValue.data(r);
      },
    );
  }
}

final onlineSearchControllerProvider = StateNotifierProvider.family<
    OnlineSearchControllerNotifier,
    AsyncValue<List<SearchResponseModel>>,
    String>((ref, query) {
  return OnlineSearchControllerNotifier(
      query: query, searchOnlineRepository: ref.read(searchRepository));
});
