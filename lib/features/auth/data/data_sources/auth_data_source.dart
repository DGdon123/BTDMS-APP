import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_client.dart';
import 'package:ym_blood_app/core/api_const/api_const.dart';
import 'package:ym_blood_app/features/auth/data/models/chnagepassword_model/change_password_re_model.dart';
import 'package:ym_blood_app/features/auth/data/models/chnagepassword_model/change_password_res_model.dart';
import 'package:ym_blood_app/features/auth/data/models/login_request_model.dart';
import 'package:ym_blood_app/features/auth/data/models/login_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<LoginResponseModel> login(LoginRequestModel loginModel);
  Future<ChangePasswordResponseModel> changePasswordDS(
      ChangePasswordRequestModel changePassword);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final ApiClient _apiClient;
  AuthRemoteDataSourceImpl(this._apiClient);
  @override
  Future<LoginResponseModel> login(LoginRequestModel loginModel) async {
    final result = await _apiClient.request(
        path: ApiConstant.klogin, type: "post", data: loginModel.toMap());
    return LoginResponseModel.fromMap(result['data']);
  }

  @override
  Future<ChangePasswordResponseModel> changePasswordDS(
      ChangePasswordRequestModel changePassword) async {
    final result = await _apiClient.request(
        path: ApiConstant.kchangePassword,
        type: "post",
        data: changePassword.toMap());

    return ChangePasswordResponseModel.fromJson(result["data"]);
  }
}

final authRemoteDataSourceProvider = Provider<AuthRemoteDataSource>((ref) {
  return AuthRemoteDataSourceImpl(ref.read(apiClientProvider));
});
