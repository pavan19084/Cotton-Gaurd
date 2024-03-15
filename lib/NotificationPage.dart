// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatelessWidget {
  final String language;

  const NotificationPage({Key? key, required this.language}) : super(key: key);

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
              ? 'This is the notification page in English.'
              : 'આ સૂચના પૃષ્ઠ ગુજરાતીમાં છે.',
          style: GoogleFonts.roboto(),
        ),
      ),
    );
  }
}
