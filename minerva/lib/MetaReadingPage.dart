import 'ReadingPage.dart';
import 'CitationPage.dart';
import 'SearchBar.dart';
import 'dart:ui';
import 'dart:core';
import 'package:flutter/material.dart';
import 'queryFunc.dart';

class MetaReadingPage extends StatefulWidget {
  final String title;

  const MetaReadingPage({super.key, required this.title});

  @override
  State<MetaReadingPage> createState() => MetaReadingPageState(title: title);
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
  String searchValue = '';
  final Map<String, dynamic> chosenCase;

  PageState currState = PageState.reading;

  MetaReadingPageState({required this.title})
    : chosenCase = getParsedJson(title);

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: getSearchBar(searchValue,
        (value) => setState(() => searchValue = value),
        (value) async => await fetchSuggestions(value, "search"), 
        (value) => currState = PageState.reading ),
      drawer: getDrawer(),
      body:
      currState == PageState.reading ?
         ReadingPage( title: title, chosenCase: chosenCase ) :
         CitationsPage( title: title ),
    );
  }
}

