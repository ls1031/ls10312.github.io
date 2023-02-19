import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_10/main.dart';
import 'dart:convert' as convert;
import 'dart:async';
import 'main.dart';
// For this function to work, you need to add the http
// dependency to pubspec.yaml
import 'queryFunc.dart';

PreferredSizeWidget getSearchBar(String searchValue,
  Function(String) onSearch, Future<List<String>> Function(String) asyncSuggestions,
    Function(String) onSuggestionTap, buttonText, Function(String) tap) {
  return EasySearchBar(
    title: const Text(
      "Minerva",
      style: TextStyle(fontFamily: "Josefin_Sans", color: Colors.white)
    ),
    onSearch: onSearch,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.black,
    asyncSuggestions: asyncSuggestions,
    onSuggestionTap: onSuggestionTap,
    // ignore: prefer_const_literals_to_create_immutables
    actions:[
    ElevatedButton( 
            onPressed: (){
               tap('$buttonText');
            }, //tap('$buttonText'),
            child:  Text('$buttonText'),
    )
    ]
    
  );
}

//Future ability to look through past chosen cases
Widget getDrawer() {
  return Drawer(
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
                onTap: () {}
            ),
            ListTile(
                title: const Text('Item 2'),
                onTap: () {}
            )
          ]
      )
  );
}

