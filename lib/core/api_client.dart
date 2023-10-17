import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_const/api_const.dart';

import '../features/auth/data/models/login_response_model.dart';
import 'api_exception/api_exception.dart';
import 'db_client.dart';

class ApiClient {
  final DbClient _dbClient;
  ApiClient(this._dbClient);
  Future request(
      {required String path,
      String type = "get",
      Map<String, dynamic> data = const {}}) async {
    final String dbResult = await _dbClient.getData(dbKey: "auth");
    var token = "";
    if (dbResult.isNotEmpty) {
      var loginData = LoginResponseModel.fromJson(dbResult);
      token = loginData.token;
    }
    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.kbaseUrl,
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
          "Authorization": "Bearer $token"
        },
      ),
    );
    try {
      final result = type == "get"
          ? await dio.get(path)
          : await dio.post(path, data: data);
      return result.data;
    } on DioError catch (e) {
      throw DioException.fromDioError(e);
    }
  }

  Future offlinePost(
      {required String path,
      String type = "get",
      List<Map<String, dynamic>> listData = const []}) async {
    final String dbResult = await _dbClient.getData(dbKey: "auth");
    var token = "";
    if (dbResult.isNotEmpty) {
      var loginData = LoginResponseModel.fromJson(dbResult);
      token = loginData.token;
    }

    final Dio dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.kbaseUrl,
        headers: {
          'Content-Type': 'application/json',
          "Accept": 'application/json',
          "Authorization": "Bearer $token"
        },
      ),
    );
    try {
      final result = await dio.post(path, data: listData);
      return result.data;
    } on DioError catch (e) {
      print(e.response?.data);
      if (e.response?.statusCode == 400) {
        return e.response?.data;
      } else {
        throw DioException.fromDioError(e);
      }
    }
  }
}

final apiClientProvider = Provider<ApiClient>((ref) {
  return ApiClient(ref.read(dbClientProvider));
});
