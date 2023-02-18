import 'queryFunc.dart';

String getFormattedCaseString(String caseId) {
  final jsonObj = querySearch("cite", "${caseId.replaceAll(' ', '%20')}");
  return "${jsonObj['name_abbreviation']} (${jsonObj['decisision_date']})");
}

List<String> getListOfCiters(List<Map<String, dynamic>> apiJsonResponse) {
  List<String> result;
  apiJsonResponse.forEach((e) {
    result.add(getFormattedCaseString(e['cite']);
  });
  return result;
}
