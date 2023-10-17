// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_client.dart';
import 'package:ym_blood_app/core/db_client.dart';
import 'package:ym_blood_app/features/offline/offline_data_model.dart';

final invalidControllerProvider = StateNotifierProvider.autoDispose<
    InvalidController, List<OfflineDataModel>>((ref) {
  return InvalidController(
      ref.read(apiClientProvider), ref.read(dbClientProvider));
});

class InvalidController extends StateNotifier<List<OfflineDataModel>> {
  InvalidController(
    this._apiClient,
    this._dbClient,
  ) : super([]) {
    loadFromDb();
  }

  final ApiClient _apiClient;
  final DbClient _dbClient;
  final String INVALID_KEY = "INVALID_KEY";
  final String OFFLINE_KEY = "OFFLINE_KEY";

  loadFromDb() async {
    List<String> dbData = await _dbClient.getListData(dbKey: INVALID_KEY);
    if (mounted) {
      if (dbData.isEmpty) {
        state = [];
      } else {
        final List<OfflineDataModel> listData =
            dbData.map((e) => OfflineDataModel.fromJson(e)).toList();
        state = [...listData];
      }
    }
  }

  removeData(OfflineDataModel data) async {
    List<String> dbData = await _dbClient.getListData(dbKey: INVALID_KEY);
    List<OfflineDataModel> offlineDataList =
        dbData.map((e) => OfflineDataModel.fromJson(e)).toList();
    offlineDataList.remove(data);
    await _dbClient.setListData(
        dbKey: INVALID_KEY,
        listData: offlineDataList.map((e) => e.toJson()).toList());
    state = [...offlineDataList];
  }

  updateData(OfflineDataModel oldData, OfflineDataModel newData) async {
    List<String> dbData = await _dbClient.getListData(dbKey: INVALID_KEY);
    List<OfflineDataModel> offlineDataList =
        dbData.map((e) => OfflineDataModel.fromJson(e)).toList();
    offlineDataList.remove(oldData);
    await _dbClient.setListData(
        dbKey: INVALID_KEY,
        listData: offlineDataList.map((e) => e.toJson()).toList());
    state = [...offlineDataList];
    final List<String> offlineList =
        await _dbClient.getListData(dbKey: OFFLINE_KEY);

    final List<OfflineDataModel> offline =
        offlineList.map((e) => OfflineDataModel.fromJson(e)).toList();
    offline.add(newData);
    await _dbClient.setListData(
        dbKey: OFFLINE_KEY, listData: offline.map((e) => e.toJson()).toList());
  }
}
