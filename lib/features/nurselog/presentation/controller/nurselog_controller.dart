import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/nurselog/data/models/nurselog_model.dart';
import 'package:ym_blood_app/features/nurselog/data/respositories/nurselog_repository.dart';

class LogController extends StateNotifier<AsyncValue<List<LogModel>>> {
  LogController(this.logRepository, this.dob)
      : super(const AsyncValue.loading()) {
    getNurseLog();
  }
  final LogRepository logRepository;
  final String dob;

  getNurseLog() async {
    final result = await logRepository.getNurseLog(dob);
    return result.fold(
      (l) => state = AsyncValue.error(
        l.message,
        StackTrace.fromString(l.message),
      ),
      (r) => state = AsyncValue.data(r),
    );
  }
}

final nurselogcontrollerProvider = StateNotifierProvider.family
    .autoDispose<LogController, AsyncValue<List<LogModel>>, String>(
        (ref, slug) {
  return LogController(ref.read(logRepoProvider), slug);
});
