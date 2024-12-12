// api_test.dart
import 'dart:convert';
import 'package:http/http.dart' as http;

void testApi() async {
  var url = Uri.https('api.themoviedb.org', '/3/movie/popular', {
    'api_key': '38a228132722493bd3bc189266d6efb4',
    'page': '1',
  });
  var response = await http.get(url);
  if (response.statusCode == 200) {
    print('Response: ${response.body}');
  } else {
    print('Failed to fetch data: ${response.statusCode}');
  }
}
