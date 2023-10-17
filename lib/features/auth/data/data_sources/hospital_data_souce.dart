import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_client.dart';
import 'package:ym_blood_app/core/api_const/api_const.dart';
import 'package:ym_blood_app/features/auth/data/models/hospital_model.dart';

abstract class HospitalDataSource {
  Future<List<HospitalModel>> getHospitalDS();
}

class HospitalDataSourceImpl implements HospitalDataSource {
  final ApiClient apiClient;
  HospitalDataSourceImpl({required this.apiClient});
  @override
  Future<List<HospitalModel>> getHospitalDS() async {
    final result = await apiClient.request(path: ApiConstant.khospitalList);
    // log(result);
    List data = result["data"];
    return data.map((e) => HospitalModel.fromMap(e)).toList();
  }
}

final hospitalDataSourceProvider = Provider<HospitalDataSource>((ref) {
  return HospitalDataSourceImpl(apiClient: ref.read(apiClientProvider));
});
