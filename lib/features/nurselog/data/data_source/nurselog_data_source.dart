import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_client.dart';
import 'package:ym_blood_app/features/nurselog/data/models/nurselog_model.dart';

abstract class NurseLogDataSource {
  Future<List<LogModel>> getLog(String dob);
}

class NurseLogDataSourceImpl implements NurseLogDataSource {
  NurseLogDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<LogModel>> getLog(String dob) async {
    String endPoint = dob.isEmpty ? "nurse/logs" : "nurse/logs?date=$dob";
    final res = await apiClient.request(path: endPoint);
    return res["data"][0] == "Record Not Found!"
        ? []
        : List.from(res["data"]).map((e) => LogModel.fromMap(e)).toList();
  }
}

final nurseLogDataSourceprovider = Provider<NurseLogDataSource>((ref) {
  return NurseLogDataSourceImpl(ref.read(apiClientProvider));
});
