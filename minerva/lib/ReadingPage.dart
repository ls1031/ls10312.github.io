import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'SearchBar.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
    
        scaffoldBackgroundColor: const Color(0xFFEFEFEF),
      
      ),
      home: const MyHomePage(title: 'Nav Bar'),
       
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String searchValue = '';
   String Case_Name =' lms';
   String date = '1/1/2001';
   String CitedNum = '5000';
   
   //String path ='"C:\Users\luiss\Downloads\CV.pdf"';
  //This needs to be configured with past search result data to provide meaningful search suggestions
  final List<String> _suggestions = ["Case 1", "Case 2", "Case 3"];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     appBar: getSearchBar(searchValue, _suggestions,
        (value) => setState(() => searchValue = value)),

  
      body: Column(
        children: [
           // added Expanded widget
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                
                   Container(
                  
                  
              child: Text(
                style: TextStyle(
                  fontSize: 26.0,          
                  ), 
                  textAlign: TextAlign.center,
                'Title Name $Case_Name'
            
              ),                 
                  ),
                
                  Container(
                   
                     child: Text(
                      textAlign: TextAlign.right,
                      'Cited By $CitedNum'
                  ),
                  )
                
              ],
            ),
           
          Container(
            child:Text(
              'here is $date'
            ),
          ),
          
          Container(
            margin: EdgeInsets.all(30.0),  
              child: const Text(
                  style: TextStyle(
                    fontSize: 16.0,
    
                  ),
            
              textAlign: TextAlign.center,
              r"""Defendant Tobin was convicted by a jury of the crime of burglary. The court entered j      The sentence was excessive.\nTrd8767 he facts giving rise to this case are as follows: On the night of February 9, 1969, at about
                 11:00 P.M. the defendant, in the company of Sherri Tobin, Daniel Stout, Michael Hume and Eddie Dunn was in an automobile
                  driven by defendant in the vicinity of the Oliver C. Joseph Automobile Agency in Belleville. Their behavior while 
                  driving was observed by James Muir who resided nearby. He stated the car stopped by the agency and the driver, 
                  identified as Tobin, jumped out and ran across the street and kicked the agency door. The car in the meantime 
                  circled the block and picked Tobin up. The car drove away and Muir next observed four men walking up the street 
                  to the agency. Muir recognized one of the four as the man who kicked the door. The four men then entered the agency
                   building by the same door previously kicked. Muir then called the police.\nThe police arrived and Officers Rettle 
                   and Wobbe observed four men walking through the building. Two other policemen arrived. Rettle observed two of the 
                   suspects at the back door. He identified himself and ordered them out. They disappeared back inside the building. 
                   The police entered the building and found one suspect lying under a car, After turning on the lights they searched 
                   the building. The other suspects were found in the basement. The defendant was hiding behind an air compressor when 
                   discovered.\nAfter apprehending all four men the police with Mr. Muirs help located the car a few blocks away. Sherri\
                    Tobin was found in the car asleep. She was carrying a .38 caliber snub-nosed revolver, fully loaded, with the serial 
                    numbers filed off in the waist band of her slacks. One of the defendants, Hume, testified for the State and said defe
                    ndant stated earlier in the evening that they would go to Belleville and “make some money”. He also stated that 
                    defendant brought a gun into the building.\nThe evidence also showed that the door jamb of the door kicked by 
                    defendant was splintered and the door opened by force.\nAdditionally, Mr. Oliver P. Joseph testified that the
                     building was owned by and in the possession of Oliver C. Joseph, Inc., a corporation, engaged in the selling of 
                     automobiles.\nAs to the authority to be in the premises, * * * the law presumes that the presence in a public 
                     building for a purpose inconsistent with the purposes for which the building is open to the public is without
                      authority. (People v. Urban (1971), (Ill.App.2d), 266 N.E.2d 112, 114. Also see People v. Weaver (1968), 41 Ill.2d
                       434, 243 N.E.2d 245 cert. den. 3"""
          

            ),
          
          ),
        ],
        
      ),
    );
    
  }
}
