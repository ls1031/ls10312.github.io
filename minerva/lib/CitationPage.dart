import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';

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
    return Column
    (
      children: [
        Expanded ( child: getCitationElement("Cites", citedCases)),
        Expanded ( child: getCitationElement("Cited by", citedCases)),
      ]
    );
  }
}

Widget getHeaderText(String header) {
  return Text(
      '${header}',
      style: const TextStyle(
        color: Colors.black,
        decoration: TextDecoration.none,
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

Widget getListElement(String name) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      '${name}',
      style: const TextStyle(
        color: Colors.black,
        decoration: TextDecoration.none,
      ),
    )
  );
}

Widget getListView(List<String> listElements) {
  return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: listElements.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.teal[index * 100],
          child: getListElement(listElements[index]),
        );
      }
  );
}

