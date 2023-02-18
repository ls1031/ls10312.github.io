import 'ReadingPage.dart';
import 'CitationPage.dart';
import 'SearchBar.dart';
import 'dart:ui';
import 'package:flutter/material.dart';

class MetaReadingPage extends StatefulWidget {
  final String title;

  const MetaReadingPage({super.key, required this.title});

  @override
  State<MetaReadingPage> createState() => MetaReadingPageState(title: title);
}

enum PageState { reading, citations }
class MetaReadingPageState extends State<MetaReadingPage> {
  final String title;

  PageState currState = PageState.reading;

  MetaReadingPageState({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: getSearchBar('', ['foo', 'bar', 'baz'], (value) => (() => value)),
      body: currState == PageState.reading ?
        MyHomePage( title: title ) :
        CitationsPage( title: title ),
    );
  }
}
