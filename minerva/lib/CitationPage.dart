import 'package:flutter/material.dart';
import 'dart:core';
import 'dart:ui';

// TODO: make styling standard instead of having magic numbers throughout code
// TODO: can return types be made more specific than Widget for greater type
// safety?

final ThemeData citationsPageThemeData = ThemeData (
  canvasColor: Colors.grey[50],
);

class CitationsPage extends StatefulWidget {
  final String title;
  final Future<List<String>> citedCases;
  final List<String> caseCitations;

  const CitationsPage({super.key, required this.title,
    required this.citedCases, required this.caseCitations});

  @override
  State<CitationsPage> createState() => CitationsPageState(
    citedCases: citedCases,
    caseCitations: caseCitations,
  );
}

class CitationsPageState extends State<CitationsPage> {

  final Future<List<String>> citedCases;
  final List<String> caseCitations;

  CitationsPageState({required this.citedCases, required this.caseCitations});
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: citedCases,
      builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
        if (snapshot.hasData) {
          return getGeneratedWidget(snapshot.data ?? List.filled(0, ''),
            caseCitations);
        }
        else {
          return CircularProgressIndicator();
        }
      }
    );
  }
}

Widget getGeneratedWidget(List<String> casesCited, List<String> caseCitations) {
  return Scaffold(
    body: Column(
      children: [
        Divider ( color: citationsPageThemeData.canvasColor ),
        Expanded ( child: getCitationElement("Cites", casesCited)),
        Expanded ( child: getCitationElement("Cited by", caseCitations)),
      ]
    )
  );
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
      Expanded ( child: getListView(listElements) ),
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

