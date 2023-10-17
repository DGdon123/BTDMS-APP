import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_exception/api_exception.dart';
import 'package:ym_blood_app/core/app_error.dart';
import 'package:ym_blood_app/features/auth/data/data_sources/hospital_data_souce.dart';
import 'package:ym_blood_app/features/auth/data/models/hospital_model.dart';

abstract class HospitalRepository {
  Future<Either<AppError, List<HospitalModel>>> getHospitalListRepo();
}

class HospitalRepositoryImp implements HospitalRepository {
  final HospitalDataSource hospitalDataSource;
  HospitalRepositoryImp({required this.hospitalDataSource});
  @override
  Future<Either<AppError, List<HospitalModel>>> getHospitalListRepo() async {
    try {
      final result = await hospitalDataSource.getHospitalDS();
      return Right(result);
    } on DioException catch (e) {
      log(e.message.toString());
      return Left(AppError(e.message!));
    }
  }
}

final hopsitalRepositoryProvider = Provider<HospitalRepository>((ref) {
  return HospitalRepositoryImp(
      hospitalDataSource: ref.read(hospitalDataSourceProvider));
});
