import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:web_scraper/web_scraper.dart' as scraper;
import 'UrlFormatter.dart';

class ReadingPage extends StatefulWidget {

        final String title;

        final Map<String, dynamic> caseJson;

        ReadingPage({super.key, required this.title, required this.caseJson});

        @override
        State<ReadingPage> createState() => ReadingPageState(
                caseName: title,
                // TODO: make this meaningful data
                citationCount: 5000,
                // TODO: make this meaningful data
                date: DateTime.now(),
                citation: caseJson.isEmpty ? ""
                        : caseJson["results"][0]["citations"]["cite"],
        );
}

class ReadingPageState extends State<ReadingPage> {

        //Variables here will fetch data from the api calls to render the text
        String searchValue = '';
        // TODO: what is this?
        String caseName = 'idna';
        // TODO: Fix. Unix time starts at 1970 so this might break
        final DateTime date;
        final int citationCount;
        final String citation;
        //String path ='"C:\Users\luiss\Downloads\CV.pdf"';
        //This needs to be configured with past search result data to provide meaningful search suggestions
        final List<String> _suggestions = ["Case 1", "Case 2", "Case 3"];

        ReadingPageState({required this.caseName, required this.date,
                required this.citationCount, required this.citation});

        // TODO: this method is fucking incomprehensible. Fix.
        @override
        Scaffold build(BuildContext context) {
                return getCuteWrapper([
                        //Row that has title and the amount cited of
                        Row(
                            mainAxisAlignment:
                                       MainAxisAlignment.center,
                            children: [ getTitleSection(caseName) ]
                        ),
                        //margin: EdgeInsets.all(30.0),
                        //text of the cted num
                        getCitationCountSection(citationCount),
                        //Date Component
                        getDateComponent(date),
                        //Main text container down here
                        getMainTextComponent(citation),
                ]);
        };
}

// TODO: move the text style to something else, because this is atrocious
Container getTitleSection(String caseName) {
        return Container(
                margin: EdgeInsets.all(10.0),
                child: Align(
                        alignment: Alignment.center,
                        //Text of the case name
                        child: Text(
                                style: TextStyle(
                                        fontSize: 26.0,
                                        fontWeight: FontWeight.bold
                                ),
                                textAlign: TextAlign.center,
                                'Title Name $caseName'
                        ),
                ),
        );
}

// TODO: move the text style to something else, because this is atrocious
Row getCitationCountSection(int citationCount) {
        return Row (
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                    Container(
                            margin: EdgeInsets.all(5.0),
                            child: Text(
                                    textAlign: TextAlign.right,
                                    'Cited By $citationCount'
                            ),
                    ),
            ]
        );
}

// TODO: what in the goddamn fuck
Widget getDateComponent(DateTime date) {
        return Container(
                padding: EdgeInsets.all(50),
                child: Text(
                        style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize:22.0
                        ),
                        // TODO: why is this the string?
                        'here is $date'
                ),
        );
}

// TODO: either delete or do something with this
//Future<String> getCaseHtml(String citation) async {
        //return await getCaseHtmlImpl(citation);
//}

/*
Future<String> getCaseHtml(String citation) async {
        final scraper.WebScraper webby =
                scraper.WebScraper("https://webscraper.io");
        await webby.loadWebPage(getFindlawUrl(citation)).whenComplete(() {
                String caseHtml = webby.getPageContent();
                webby.getElement(
                 "body.CSS_LD_FLF_852 CSS_LD_FLF_1000 CSS_PV_FLF_1034 "
                 + "CSS_PV_FLF_1000 CSS_AEM_FLF_1218 CSS_AEM_PALS_979 "
                 + "CSS_LP_PALS_979 PALS_6025_CSS_DIY_FORMS > div.latl-pages "
                 + "> section.lppage > div.medium-20 medium-centered large-9 "
                 + "large-uncentered columns > div.caselawContent section", []
                );
                return caseHtml;
        });
        return "";
}
*/

class WebScraperText extends StatefulWidget {
        final String citation;

        WebScraperText(this.citation);

        @override
        State<WebScraperText> createState() => WebScraperTextState(citation);
}

class WebScraperTextState extends State<WebScraperText> {
        final scraper.WebScraper webby =
                scraper.WebScraper("https://webscraper.io");
        final String citation;
        String? html;

        WebScraperTextState(this.citation);

        void getHtml() async {
                if (await webby.loadWebPage(getFindlawUrl(citation))) {
                        setState(() {
                                html = webby.getPageContent();
                        });
                }
        }

        @override
        void initState() {
                super.initState();
                getHtml();
        }

        @override
        Container build(BuildContext context) {
                return Container(
                        margin: const EdgeInsets.fromLTRB(200,50,200,0),
                        padding: EdgeInsets.all(16.0),
                        child: html == null
                                ? CircularProgressIndicator() 
                                // TODO: change this, it's hacky as hell
                                : Text( html ?? "Well, shit.",
                                        style: TextStyle(
                                                fontFamily: 'serif',
                                                fontSize: 16.0,
                                        ),
                                        softWrap: true,
                                        textAlign: TextAlign.justify,
                                )
                );
        }
}

// TODO: move text style somewhere else. This is fugly.
Widget getMainTextComponent(String citation) {
        if (citation.isEmpty)
                return Container( child:
                        Text ("Something went wrong while webscraping") );
        return WebScraperText(citation);
}

Scaffold getCuteWrapper(List<Widget> children) {
        return Scaffold(body: Container(
                color: Color.fromARGB(255, 255, 220, 150),
                child:SingleChildScrollView(child: SelectionArea(
                                child: Column(children: children)
                ))
        ));
}

