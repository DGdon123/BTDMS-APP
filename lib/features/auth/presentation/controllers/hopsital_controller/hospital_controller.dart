import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/features/auth/data/models/hospital_model.dart';
import 'package:ym_blood_app/features/auth/data/repositories/hospital_repository.dart';

class HospitalControllerNotifier
    extends StateNotifier<AsyncValue<List<HospitalModel>>> {
  final HospitalRepository hospitalRepository;
  HospitalControllerNotifier({required this.hospitalRepository})
      : super(const AsyncValue.loading()) {
    getHospitalListC();
  }
  getHospitalListC() async {
    final result = await hospitalRepository.getHospitalListRepo();
    return result.fold((l) {
      return state =
          AsyncValue.error(l.message, StackTrace.fromString(l.message));
    }, (r) {
      return state = AsyncValue.data(r);
    });
  }
}

final hospitalListControllerProvider = StateNotifierProvider<
    HospitalControllerNotifier, AsyncValue<List<HospitalModel>>>((ref) {
  return HospitalControllerNotifier(
      hospitalRepository: ref.read(hopsitalRepositoryProvider));
});
