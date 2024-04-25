import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SolutionPage extends StatelessWidget {
  final String language;

  const SolutionPage({Key? key, required this.language}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(
          "CottonGuard",
          style: GoogleFonts.roboto(),
        ),
      ),
      body: ListView(
        padding: EdgeInsets.all(8),
        children: [
          // First Card
          _buildCard(
            title: "Fusarium Wilt",
            description: language == 'eng'
                ? "You can purchase some product to prevent fusarium wilt."
                : "ફ્યુઝેરિયમ વિલ્ટને રોકવા માટે થોડું ઉત્પાદન ખરીદી શકો છો.",
            imageUrl: 'assets/fussiram.jpeg',
            buyUrl:
                "https://localstore.agribegri.com/products/wilt-special---fost-rootex-1ltr-and-stop-wilt-1ltr--wilt-.php",
            infoUrl:
                "https://cropprotectionnetwork.org/encyclopedia/fusarium-wilt-of-cotton#:~:text=Fusarium%20wilt%20is%20a%20significant,vasinfectum.",
          ),
          // Second Card
          _buildCard(
            title: "Curl Virus",
            description: language == 'eng'
                ? "You can purchase something for curl virus"
                : "કર્લ વાઇરસ માટે શો ખરીદી શકાય તે વિશે કોઈપણ માહિતી મળી શકે છે.",
            imageUrl: 'assets/curl_virus.jpeg',
            buyUrl:
                "https://www.flipkart.com/tomato-yellow-leaf-curl-virus-disease/p/itme3zys2tcwhskf?pid=9781402047688&lid=LSTBOK97814020476884VJJPI&marketplace=FLIPKART&cmpid=content_book_8965229628_gmc",
            infoUrl: "https://pubmed.ncbi.nlm.nih.gov/11137169/",
          ),
          // Third Card
          _buildCard(
            title: "Bacterial Blight",
            description: language == 'eng'
                ? "You can buy something for this problem"
                : "આ સમસ્યા માટે શું ખરીદી શકાય છે તે વિશે માહિતી મળી શકે છે.",
            imageUrl: 'assets/bacterial_blight.jpeg',
            buyUrl: "https://chaarviinnovations.com/product/bacterial-blight/",
            infoUrl:
                "https://cropwatch.unl.edu/plantdisease/soybean/bacterial-blight",
          ),
        ],
      ),
    );
  }

  // Function to build a card widget
  Widget _buildCard({
    required String title,
    required String description,
    required String imageUrl,
    required String buyUrl,
    required String infoUrl,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Image.asset(
            imageUrl,
            height: 160,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
                Container(height: 10),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey[400],
                  ),
                ),
                Row(
                  children: <Widget>[
                    Spacer(),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      child: Text(
                        language == 'eng' ? "Buy Now" : "હવે ખરીદો",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        _launchURL(buyUrl);
                      },
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.transparent,
                      ),
                      child: Text(
                        language == 'eng' ? "More Info" : "વધુ માહિતી",
                        style: TextStyle(color: Colors.blue),
                      ),
                      onPressed: () {
                        _launchURL(infoUrl);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(height: 5),
        ],
      ),
    );
  }

  // Function to launch URLs
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
