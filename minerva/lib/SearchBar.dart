import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:async';
// For this function to work, you need to add the http
// dependency to pubspec.yaml
import 'queryFunc.dart';

PreferredSizeWidget getSearchBar(String searchValue,
  Function(String) onSearch, Future<List<String>> Function(String) asyncSuggestions) {
  return EasySearchBar(
    title: const Text(
      "Minerva",
      style: TextStyle(fontFamily: "Josefin_Sans", color: Colors.white)
    ),
    onSearch: onSearch,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.black,
    asyncSuggestions: asyncSuggestions,
  );
}
