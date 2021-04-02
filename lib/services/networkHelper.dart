import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkHelper {
  NetworkHelper(this.url, this.token);
  final String url;
  final String token;

  Future getData() async {
    var client = http.Client();
    var uri = Uri.parse(url);
    final String ftoken = 'SKey=Bearer $token';
    print(ftoken);
    final response = await client.get(uri, headers: {
      'Cookie': 'SKey=Bearer $token',
    });

    print('Done');
    print(response.body);

    if (response.statusCode == 200) {
      final body = response.body;

      final parsedJson = jsonDecode(body);
      return parsedJson;
    }
  }
}
