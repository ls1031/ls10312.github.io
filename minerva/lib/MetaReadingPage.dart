import 'CitationPage.dart'; import 'SearchBar.dart';
import 'CitationListCreator.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'queryFunc.dart';
import 'dart:js' as js;
import 'package:tuple/tuple.dart';

class MetaReadingPage extends StatefulWidget {
  final String title;

  const MetaReadingPage({super.key, required this.title});

  @override
  State<MetaReadingPage> createState() => MetaReadingPageState(title: title);
}

enum PageState { reading, citations }

class MetaReadingPageState extends State<MetaReadingPage> {
  final String title;
  String searchValue = '';
  var searchRes = Map<String, dynamic>();
  List<String> searchNames = [];
  var t1 = Tuple2<List<String>, Map<String, dynamic>>([],Map<String, dynamic>());

  Future<List<String>> citedCases;
  List<String> caseCitations = [];

  MetaReadingPageState({required this.title}) 
    : citedCases = getListOfCitations(querySearch(title, "cite_to"));

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: getSearchBar(searchValue,
        (value) => setState(() => searchValue = value),
        (value) async {
            print("Fetching suggestions");
            t1 = await fetchSuggestions(value, "search");
            print("Fetched suggestions");
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
        } ),
      body: CitationsPage(
        title: title,
        citedCases: citedCases,
        caseCitations: caseCitations
      ),
    );
  }
}
