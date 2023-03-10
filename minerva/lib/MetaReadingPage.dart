import 'CitationPage.dart';
import 'SearchBar.dart';
import 'CitationListCreator.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'queryFunc.dart';
import 'dart:js' as js;
import 'package:tuple/tuple.dart';

class MetaReadingPage extends StatefulWidget {
  final String title;
  void Function(String) metaMutator;

  MetaReadingPage({super.key, required this.title, required this.metaMutator});

  @override
  State<MetaReadingPage> createState()
    => MetaReadingPageState(title: title, metaMutator: metaMutator);
}

enum PageState { reading, citations }

Map<String, dynamic> getParsedJson(String name) {
  var result = Map<String, dynamic>();
  querySearch(name, "search").then((queryResult) {
    // print(queryResult);
    print("\n" * 10 + "FUCK" + "\n" * 10);
    result = queryResult;
  });
  return result;
}

class MetaReadingPageState extends State<MetaReadingPage> {
  final String title;
  void Function(String) metaMutator;

  String searchValue = '';
  // TODO: eliminate var and make final
  var searchRes = Map<String, dynamic>();
  List<String> searchNames = [];
  // TODO: eliminate var and make final
  var t1 = Tuple2<List<String>, Map<String, dynamic>>([],Map<String, dynamic>());
  final Map<String, dynamic> chosenCase;

  // Wrap this in future builder?
  Future<List<Tuple2<String, String>>> citedCases;
  // TODO: finish this
  List<String> caseCitations = [];

  MetaReadingPageState({required this.title, required this.metaMutator}) 
    : citedCases = getListOfCitations(querySearch(title, "cite_to"));

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: getSearchBar(searchValue,
        (value) => setState(() => searchValue = value),
        (value) async {
            t1 = await fetchSuggestions(value, "search");
            searchNames = t1.item1;
            searchRes = t1.item2;
            return searchNames;
        },
        (value) {
          js.context.callMethod('open', [searchRes["results"][int.parse(value[0] + value[1])]["frontend_pdf_url"]]);
          setState(() {
            citedCases
              = searchRes["results"][int.parse(value[0] + value[1])]["cites_to"];
            caseCitations
              = searchRes["results"][int.parse(value[0] + value[1])]["citations"];
          });
        }),
      body: CitationsPage(
        citedCases: citedCases,
        caseCitations: caseCitations,
        metaMutator: metaMutator,
      ),
    );
  }
}

