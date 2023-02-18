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

  final List<String> citedCases = ["Jones v. Smith (1972)", "Foo v. Bar (2000)", "Aliens v. Predators (2004)"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: citedCases.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 50,
          color: Colors.teal[index * 100],
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              '${citedCases[index]}',
              style: const TextStyle(
                color: Colors.black,
                decoration: TextDecoration.none,
              ),
            )
          ),
        );
      }
    );
  }
}

