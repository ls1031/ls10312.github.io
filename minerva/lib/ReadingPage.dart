import 'package:flutter/material.dart';
import 'package:easy_search_bar/easy_search_bar.dart';
import 'SearchBar.dart';
import 'QueryFunc.dart';
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
        scaffoldBackgroundColor: Color.fromARGB(255, 239, 239, 239),    
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
    //Variables here will fetch data from the api calls to render the text
   var searchValue;

   var Case_Name = 'idna';
   
   var date;
   var CitedNum;
   //String path ='"C:\Users\luiss\Downloads\CV.pdf"';
  //This needs to be configured with past search result data to provide meaningful search suggestions
  final List<String> _suggestions = ["Case 1", "Case 2", "Case 3"];

   @override
  
 
 
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
     //appBar: getSearchBar(searchValue, _suggestions,
        //(value) => setState(() => searchValue = value)),
      
       body:
       
       Container(
          color: Color.fromARGB(255, 255, 220, 150),
       child:SingleChildScrollView(
         child: SelectionArea( 
       child: Column( 
      
         
        children: [
            //Row that has title and the amount cited of
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [        
                Container(
                  margin: EdgeInsets.all(10.0), 
                  child:Align(         
                        alignment: Alignment.center,
                          //Text of the case name
                          child: Text(
                            style: TextStyle(
                              fontSize: 26.0,       
                              fontWeight: FontWeight.bold,   
                            ), 
                            textAlign: TextAlign.center,
                            'Title Name $Case_Name'      
                            ),
                          ),
                        ),
                      ]
                    ),
                  //margin: EdgeInsets.all(30.0),
                  //text of the cted num
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [                
                        Container(
                          margin: EdgeInsets.all(5.0), 
                            child: Text(
                              textAlign: TextAlign.right,  
                              'Cited By $CitedNum'
                            ),
                          ),  
                      
                        ] 
                    ),
                
            //Date Component
            Container(
              padding: EdgeInsets.all(50),
              
              child:Text(
                style: TextStyle (fontStyle: FontStyle.italic, fontSize:22.0),
                'here is $date'
                ),
              ),
              //Main text container down here 
              Container(
             
              margin: const EdgeInsets.fromLTRB(200,50,200,0),
              padding: EdgeInsets.all(16.0),
              
                child: const Text(  
                  style: TextStyle(
                  fontFamily: 'serif',
                  fontSize: 16.0,   
                ),
                softWrap: true,
                textAlign: TextAlign.justify,
                r"""Opinion of the Court by\nJustice Browne.\nThis was an action of replevin, brought against the plaintiff in error for the unlawful taking of a horse. The, defendant pleaded, besides property in himself and property in a third person, non cepit, and the statute of limitations. On the trial before the circuit court of Madison county, the defendant in error, the plaintiff helow, proved the horse was claimed to belong to plaintiff’s wife. That it was also claimed by Philip Creamer, who sold the horse to one Lock, who sold it to one Elihu Mather, who sold it to the defendant. This was all the evidence of taking by the defendant.\nStarr and Cowles, for plaintiff in error.\nBlackwell, for defendant in error.\nTo maintain the action of replevin, there must be an unlawful taking from the actual, or constructive possession of the plaintiff, which has not been proved. The judgment must therefore be reversed, ,\nJudgment reversed.\nReplevin lies for any unlawful taking of a chattel, and possession by the plaintiff and an actual wrongful taking by the defendant, are necessary to support the action. Pangburn v. Patridge, 7 Johns. Rep , 140.\n_ The action of replevin is grounded on a tortious taking, and sounds in damages like an action of trespass. Hopkins v. Hopkins, 10 Johns. Rep., 369.\nAt common law, a writ of replevin never lies, unless there has been a tortious taking, either originally or by construction of law, by some act which makes the party a trespasser ab initio. Meany v. Head, 1 Mason, 319.\nThe plea of non cepit puts in issue the fact of an actual taking; and unless there has been a wrongful taking from the possession of another, it is not a taking within the issue; and a wrongful detainer after a lawful taking, is not equivalent to an original wrongful talcing. Ibid.\nA mere possessory right is not sufficient to support this action; there must be an absolute, or at least a special property in the thing claimed. 5 Dane’s Dig., 516.\nThe present statute in relation to replevin is as follows : “ Whenever any goods or chattels shall have been wrongfully distrained, or otherwise wrongfully taken, or shall be wrongfully detained, an action of replevin may be brought for the recovery of such goods or chattels, by the owner or person entitled to their possession.” Purple’s Statutes, p. 868, Sec. 1. Scates’Comp., p. 226."""
              ),
            

          ),
        ],
        
      ),
       ),
       ),
       ),
    );  
  }
}

