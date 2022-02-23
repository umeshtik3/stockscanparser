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
        // ignore: avoid_print
        // print(jsonString);
        list = indexesFromJson(jsonString);
      } else {
        //show error message

      }
    } on Exception catch (e) {
      // ignore: avoid_print
      print(e);
    }
    return list;
  }
}
