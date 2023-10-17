import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_exception/api_exception.dart';
import 'package:ym_blood_app/core/app_error.dart';
import 'package:ym_blood_app/features/auth/data/data_sources/auth_data_source.dart';
import 'package:ym_blood_app/features/auth/data/models/chnagepassword_model/change_password_re_model.dart';
import 'package:ym_blood_app/features/auth/data/models/chnagepassword_model/change_password_res_model.dart';
import 'package:ym_blood_app/features/auth/data/models/login_request_model.dart';
import 'package:ym_blood_app/features/auth/data/models/login_response_model.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepositoryImpl(ref.read(authRemoteDataSourceProvider));
});

abstract class AuthRepository {
  Future<Either<AppError, LoginResponseModel>> login(
      LoginRequestModel loginModel);
  Future<Either<AppError, ChangePasswordResponseModel>> changePasswordRepo(
      ChangePasswordRequestModel changePasswordRequestModel);
}

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _authRemoteDataSource;
  AuthRepositoryImpl(this._authRemoteDataSource);
  @override
  Future<Either<AppError, LoginResponseModel>> login(
      LoginRequestModel loginModel) async {
    try {
      final result = await _authRemoteDataSource.login(loginModel);
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }

  @override
  Future<Either<AppError, ChangePasswordResponseModel>> changePasswordRepo(
      ChangePasswordRequestModel changePasswordRequestModel) async {
    try {
      final result = await _authRemoteDataSource
          .changePasswordDS(changePasswordRequestModel);
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }
}
