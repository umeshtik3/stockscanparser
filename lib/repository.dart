import 'package:stockscanparser/backend/api/api_manager.dart';
import 'package:stockscanparser/data_models/data_models.dart';

class Repository {
  ApiManager a = ApiManager();

  Future<List<Indexes>> fetchAllData() => a.fetchData();
}
