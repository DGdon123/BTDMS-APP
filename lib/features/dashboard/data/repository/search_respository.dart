import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_exception/api_exception.dart';
import 'package:ym_blood_app/core/app_error.dart';
import 'package:ym_blood_app/features/dashboard/data/data_source/search_data_source.dart';
import 'package:ym_blood_app/features/dashboard/data/models/search_model_on/search_response_model.dart';

abstract class SearchOnlineRepository {
  Future<Either<AppError, List<SearchResponseModel>>> getNurseLog(String query);
}

class SearchOnlineRepositoryImple implements SearchOnlineRepository {
  final SearchOnlineDataSource searchOnlineDataSource;
  SearchOnlineRepositoryImple(this.searchOnlineDataSource);
  @override
  Future<Either<AppError, List<SearchResponseModel>>> getNurseLog(
      String query) async {
    try {
      final result = await searchOnlineDataSource.getSearchResultDS(query);
      return Right(result);
    } on DioException catch (e) {
      return Left(AppError(e.message!));
    }
  }
}

final searchRepository = Provider<SearchOnlineRepository>((ref) {
  return SearchOnlineRepositoryImple(ref.read(searchOnlineDataSourceprovider));
});
