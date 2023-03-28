import 'CitationPage.dart';
import 'SearchBar.dart';
import 'ReadingPage.dart';
import 'CitationListCreator.dart';
import 'dart:core';
import 'package:flutter/material.dart';
import 'queryFunc.dart';
import 'dart:js' as js;
import 'package:tuple/tuple.dart';

class MetaReadingPage extends StatefulWidget {

        final String title;
        void Function(String) metaMutator;

        MetaReadingPage({super.key, required this.title,
                required this.metaMutator});

        @override
        State<MetaReadingPage> createState()
          => MetaReadingPageState(title: title, metaMutator: metaMutator);
}

enum PageState { reading, citations }

// TODO: this entire class is an unreadable nightmare
class MetaReadingPageState extends State<MetaReadingPage> {

        final String title;
        // TODO: this doesn't work for shit
        void Function(String) metaMutator;
        // TODO: why isn't this final?
        String searchValue = '';
        // TODO: eliminate var and make final
        var searchRes = Map<String, dynamic>();
        List<String> searchNames = [];
        // TODO: eliminate var and make final
        // TODO: WTF is "t1"?
        var t1 = Tuple2<List<String>, Map<String, dynamic>>([],Map<String, dynamic>());
        // TODO: Wrap this in future builder
        Future<List<Tuple2<String, String>>> citedCases;
        // TODO: finish this
        List<String> caseCitations = [];

        MetaReadingPageState({required this.title, required this.metaMutator}) 
                : citedCases = getListOfCitations(querySearch(title, "cite_to"));

        void onSearch(String value) => setState(() => searchValue = value);

        Future<List<String>> asyncSuggestions(String value) async {
                t1 = await fetchSuggestions(value, "search");
                setState(() {
                        searchNames = t1.item1;
                        searchRes = t1.item2;
                });
                return searchNames;
        }
        
        void onSuggestionTap(String value) {
                js.context.callMethod('open', [searchRes["results"]
                        [int.parse(value[0] + value[1])]["frontend_pdf_url"]]);
                setState(() {
                        citedCases = searchRes["results"]
                                [int.parse(value[0] + value[1])]["cites_to"];
                        caseCitations = searchRes["results"]
                                [int.parse(value[0] + value[1])]["citations"];
                });
        }

        @override
        Widget build(BuildContext context) {
                return Scaffold (
                        appBar: getSearchBar(searchValue,
                                onSearch,
                                asyncSuggestions,
                                onSuggestionTap),
                        body: ReadingPage(title: title, caseJson: searchRes)
                        // body: CitationsPage(
                        //         citedCases: citedCases,
                        //         caseCitations: caseCitations,
                        //         metaMutator: metaMutator,
                        // ),
                );
        }
}

