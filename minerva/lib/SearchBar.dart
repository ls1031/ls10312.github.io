import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'dart:async';
// For this function to work, you need to add the http
// dependency to pubspec.yaml
import 'queryFunc.dart';

Future<List<String>> getSuggestedNames(String searchTerm) {
  Future<List<String>> resultList;
  querySearch(searchTerm, "search")['results'].forEach((result) {
    resultList.get().add(result["name_abbreviation"]);
  });
  return resultList;
}

PreferredSizeWidget getSearchBar(String searchValue,
  Function(String) onSearch, Future<List<String>> Function(String) asyncSuggestions,
    Function(String) onSuggestionTap) {
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
  );
}
