import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';
import 'SearchBar.dart';

// TODO: make styling standard instead of having magic numbers throughout code
// TODO: can return types be made more specific than Widget for greater type
// safety?

final ThemeData citationsPageThemeData = ThemeData (
  canvasColor: Colors.grey[50],
);

class CitationsPage extends StatefulWidget {
  final String title;

  const CitationsPage({super.key, required this.title});

  @override
  State<CitationsPage> createState() => CitationsPageState();
}

class CitationsPageState extends State<CitationsPage> {

  final List<String> citedCases = [
          "Jones v. Smith (1972)",
          "Foo v. Bar (2000)",
          "Aliens v. Predators (2004)",
          "Ninjas v. Pirates (2069)",
          "Brothers v. Sisters",
          "Englishmen v. Scots",
          "Welshmen v. Scots",
          "Japanese v. Scots",
          "Scots v. Other Scots"];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    // TODO: make this actually do something
    appBar: getSearchBar('', ["foo", "bar", "baz"], (value) => (() => value)),
      body: Column(
        children: [
          Divider ( color: citationsPageThemeData.canvasColor ),
          Expanded ( child: getCitationElement("Cites", citedCases)),
          Expanded ( child: getCitationElement("Cited by", citedCases)),
        ]
      )
    );
  }
}

Widget getHeaderText(String header) {
  return Text(
    '${header}',
    style: const TextStyle(
      color: Colors.black,
      decoration: TextDecoration.none,
      fontSize: 32,
      height: 1.1,
    ),
  );
}

Widget getCitationElement(String name, List<String> listElements) {
  return Column (
    children: [
      Container ( child: getHeaderText(name)),
      Expanded ( child: getListView(listElements)),
    ],
  );
}

class HoverBoldedListElement extends StatefulWidget {
  final String text;

  const HoverBoldedListElement({super.key, required this.text});

  @override
  State<HoverBoldedListElement> createState()
    => HoverBoldedListElementState(text);
}

class HoverBoldedListElementState extends State<HoverBoldedListElement> {
  final String text;
  bool isBold = false;

  HoverBoldedListElementState(this.text);

  void makeBold(PointerEvent details) {
    setState(() {
      isBold = true;
    });
  }
  
  void makeUnbold(PointerEvent details) {
    setState(() {
      isBold = false;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MouseRegion (
      onEnter: makeBold,
      onExit: makeUnbold,
      child: Container (
        child: Text(
          '${text}',
          style: TextStyle(
            color: Colors.black,
            decoration: TextDecoration.none,
            fontSize: 20,
            height: 1.1,
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        padding: const EdgeInsets.all(8.0),
      )
    );
  }
}

Widget getListElement(String name) {
  return Container (
    child: HoverBoldedListElement(
        text: name,
    ),
  );
}

Widget getListView(List<String> listElements) {
  return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: listElements.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 40,
          color: citationsPageThemeData.canvasColor,
          child: getListElement(listElements[index]),
        );
      },
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: citationsPageThemeData.canvasColor,
      ),
  );
}

