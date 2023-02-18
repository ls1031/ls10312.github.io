import 'package:easy_search_bar/easy_search_bar.dart';
import 'dart:convert' as convert;
import 'package:flutter/material.dart';
import 'package:search_page/search_page.dart';
import 'dart:async';
import 'dart:io';
import 'SearchBar.dart';
import 'queryFunc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchValue = '';
  var searchRes;

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      appBar: getSearchBar(searchValue, (value) => setState(() => searchValue = value), (value) async {
        searchRes = await fetchSuggestions(value, "search");
        return searchRes;

      }, () {}),
        drawer: Drawer(
            child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  const DrawerHeader(
                    decoration: BoxDecoration(
                      color: Colors.blue,
                    ),
                    child: Text('Drawer Header'),
                  ),
                  ListTile(
                      title: const Text('Item 1'),
                      onTap: () => Navigator.pop(context)
                  ),
                  ListTile(
                      title: const Text('Item 2'),
                      onTap: () => Navigator.pop(context)
                  )
                ]
            )
        ),
        body: Center(
            child: Text('Welcome to Minverva, the case relationship explorer!')
        )
    );
  }
}