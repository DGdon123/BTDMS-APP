import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_exception/api_exception.dart';
import 'package:ym_blood_app/core/app_error.dart';
import 'package:ym_blood_app/features/nurselog/data/data_source/nurselog_data_source.dart';
import 'package:ym_blood_app/features/nurselog/data/models/nurselog_model.dart';

abstract class LogRepository {
  Future<Either<AppError, List<LogModel>>> getNurseLog(String dob);
}

class LogRepositoryImple implements LogRepository {
  final NurseLogDataSource _logDataSource;
  LogRepositoryImple(this._logDataSource);
  @override
  Future<Either<AppError, List<LogModel>>> getNurseLog(String dob) async {
    try {
      final result = await _logDataSource.getLog(dob);
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }
}

final logRepoProvider = Provider<LogRepository>((ref) {
  return LogRepositoryImple(ref.read(nurseLogDataSourceprovider));
});
