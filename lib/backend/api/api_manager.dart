import 'package:http/http.dart' as http;
import 'package:stockscanparser/data_models/data_models.dart';

class ApiManager {
  static var client = http.Client();
  final url = Uri.parse('https://mobile-app-challenge.herokuapp.com/data');
  Future<List<Indexes>> fetchData() async {
    http.Response response = await client.get(url);
    List<Indexes> list = [];

    try {
      if (response.statusCode == 200) {
        var jsonString = response.body;
        list = indexesFromJson(jsonString);
      }
    } on Exception catch (e) {
      throw Exception(e);
    }
    return list;
  }
}
