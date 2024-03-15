// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
      body: Center(
        child: Text(
          language == 'eng'
              ? 'This is the solution page in English.'
              : 'આ સમાધાન પૃષ્ઠ ગુજરાતીમાં છે.',
          style: GoogleFonts.roboto(),
        ),
      ),
    );
  }
}
