
// TODO: when we have our own DB with cases, we can get rid of this entirely.
// This exists purely to feed the web scraper.

const String FindlawUrlStem = "https://caselaw.findlaw.com/";
const String FindlawScotusExtension = "us-supreme-court/";

String getFindlawUrl(String citation) {
  final List<String> splittedString = citation.split(' ');
  return FindlawUrlStem + FindlawScotusExtension + splittedString[0] + '/'
    + splittedString[2] + '.html';
}

