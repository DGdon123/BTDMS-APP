// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_client.dart';
import 'package:ym_blood_app/core/db_client.dart';
import 'package:ym_blood_app/features/offline/offline_data_model.dart';

final offlineControllerProvider = StateNotifierProvider.autoDispose<
    OfflineController, List<OfflineDataModel>>((ref) {
  return OfflineController(
      ref.read(apiClientProvider), ref.read(dbClientProvider));
});

class OfflineController extends StateNotifier<List<OfflineDataModel>> {
  OfflineController(
    this._apiClient,
    this._dbClient,
  ) : super([]) {
    loadFromDb();
    syncData();
  }

  final ApiClient _apiClient;
  final DbClient _dbClient;
  final String OFFLINE_KEY = "OFFLINE_KEY";
  final String INVALID_KEY = "INVALID_KEY";

  setData(OfflineDataModel data) async {
    List<String> dbData = await _dbClient.getListData(dbKey: OFFLINE_KEY);
    if (dbData.isEmpty) {
      List<OfflineDataModel> listData = [];
      listData.add(data);
      await _dbClient.setListData(
          dbKey: OFFLINE_KEY,
          listData: listData.map((e) => e.toJson()).toList());
      state = [...listData];
    } else {
      List<OfflineDataModel> dbDataList =
          dbData.map((e) => OfflineDataModel.fromJson(e)).toList();
      dbDataList.add(data);
      await _dbClient.setListData(
          dbKey: OFFLINE_KEY,
          listData: dbDataList.map((e) => e.toJson()).toList());
      state = [...dbDataList];
    }
  }

  loadFromDb() async {
    List<String> dbData = await _dbClient.getListData(dbKey: OFFLINE_KEY);
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

  syncData() async {
    List<String> dbData = await _dbClient.getListData(dbKey: OFFLINE_KEY);
    if (mounted && dbData.isNotEmpty) {
      final List<OfflineDataModel> offData =
          dbData.map((e) => OfflineDataModel.fromJson(e)).toList();
      final apiResponse = await _apiClient.offlinePost(
          path: "bulk-store",
          type: "post",
          listData: offData.map((e) => e.toMap()).toList());
      if (apiResponse['data'] is Map<String, dynamic>) {
        await _dbClient.setListData(dbKey: OFFLINE_KEY, listData: []);
        state = [];
      }
      if (mounted && apiResponse['data'] is List<dynamic>) {
        final List apiDataList = apiResponse['data'];
        final List<OfflineDataModel> invalidDataList =
            apiDataList.map((e) => OfflineDataModel.fromMap(e)).toList();
        await _dbClient.setListData(
            dbKey: INVALID_KEY,
            listData: invalidDataList.map((e) => e.toJson()).toList());
        await _dbClient.setListData(dbKey: OFFLINE_KEY, listData: []);
        state = [];
      }
    }
  }

  removeData(OfflineDataModel data) async {
    List<String> dbData = await _dbClient.getListData(dbKey: OFFLINE_KEY);
    List<OfflineDataModel> offlineDataList =
        dbData.map((e) => OfflineDataModel.fromJson(e)).toList();
    offlineDataList.remove(data);
    await _dbClient.setListData(
        dbKey: OFFLINE_KEY,
        listData: offlineDataList.map((e) => e.toJson()).toList());
    state = [...offlineDataList];
  }

  updateData(OfflineDataModel oldData, OfflineDataModel newData) async {
    List<String> dbData = await _dbClient.getListData(dbKey: OFFLINE_KEY);
    List<OfflineDataModel> offlineDataList =
        dbData.map((e) => OfflineDataModel.fromJson(e)).toList();
    offlineDataList[offlineDataList.indexOf(oldData)] = newData;
    await _dbClient.setListData(
        dbKey: OFFLINE_KEY,
        listData: offlineDataList.map((e) => e.toJson()).toList());
    state = [...offlineDataList];
  }
}
