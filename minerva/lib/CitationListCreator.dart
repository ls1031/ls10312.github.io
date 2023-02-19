import 'queryFunc.dart';

Future<List<String>> getListOfCitations(Future<Map<String, dynamic>> apiJsonResponse) async {
  final tmp = (await apiJsonResponse)["results"];
  List<String> result = [];
  for (int i = 0; i < tmp.length; ++i)
    result.add(tmp[i]["name_abbreviation"]
      + " (${tmp[i]['decision_date'].substring(0, 4)})");
  return result;
}

