import 'dart:convert' as convert;
import 'dart:async';
// For this function to work, you need to add the http
// dependency to pubspec.yaml
import 'package:http/http.dart' as http;

Future<Map<String, dynamic>> querySearch(String searchValue) async {
  var url =
  Uri.https('api.case.law', '/v1/cases/', {'search': searchValue});

  // Await the http get response, then decode the json-formatted response.
  final response = await http.get(
      url
    // Send authorization headers to the backend.
    // headers: {
    //   HttpHeaders.authorizationHeader: 'token',
    // },
  );
  if (response.statusCode == 200) {
    var searchRes =
    convert.jsonDecode(response.body) as Map<String, dynamic>;
    // Prints API Call results to console
    print("${searchRes}");
    return searchRes;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    throw http.ClientException;
  }
}