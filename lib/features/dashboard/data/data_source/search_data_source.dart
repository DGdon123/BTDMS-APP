import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ym_blood_app/core/api_client.dart';
import 'package:ym_blood_app/features/dashboard/data/models/search_model_on/search_response_model.dart';

abstract class SearchOnlineDataSource {
  Future<List<SearchResponseModel>> getSearchResultDS(String query);
}

class SearchOnlineDataSourceImpl implements SearchOnlineDataSource {
  SearchOnlineDataSourceImpl(this.apiClient);

  final ApiClient apiClient;

  @override
  Future<List<SearchResponseModel>> getSearchResultDS(String dob) async {
    String endPoint = "component-bags?component_sn=$dob";
    final res = await apiClient.request(path: endPoint);

    if (res.containsKey('data')) {
      if (res['data'] is List) {
        return (res['data'] as List)
            .map((e) => SearchResponseModel.fromJson(e))
            .toList();
      } else if (res['data'] is Map && res['data'].containsKey('error')) {
        return [];
      }
    }

    throw Exception('Invalid API response');
  }
}

final searchOnlineDataSourceprovider = Provider<SearchOnlineDataSource>((ref) {
  return SearchOnlineDataSourceImpl(ref.read(apiClientProvider));
});
