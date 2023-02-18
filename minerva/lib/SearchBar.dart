import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget getSearchBar(String searchValue, List<String> suggestions,
  Function(String) onSearch) {
  return EasySearchBar(
    title: const Text(
      "Minerva",
      style: TextStyle(fontFamily: "Josefin_Sans", color: Colors.white)
    ),
    onSearch: onSearch,
    suggestions: suggestions,
    iconTheme: IconThemeData(color: Colors.white),
    backgroundColor: Colors.black,
  );
}
