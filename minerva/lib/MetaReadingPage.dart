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
class MetaReadingPageState extends State<MetaReadingPage> {
  final String title;
  String searchValue = '';
  Map<String, dynamic> chosenCase = Map<String, dynamic>();

  PageState currState = PageState.reading;

  MetaReadingPageState({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: getSearchBar(
        searchValue,
        (value) => setState(() => searchValue = value),
        (value) async {
          var searchRes = await fetchSuggestions(value, "search")
            ?? List.filled(0, "");
          return searchRes;
        }, 
        (value) {
          currState = PageState.reading;
        }
      ),
      drawer: getDrawer(),
      body:
      currState == PageState.reading ?
         ReadingPage( title: title, chosenCase: chosenCase ) :
         CitationsPage( title: title ),
    );
  }
}
