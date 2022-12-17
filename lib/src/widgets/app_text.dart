import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  final String text;
  final double size;
  const AppText({Key? key, required this.text, required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style:
            GoogleFonts.raleway(fontSize: size, fontWeight: FontWeight.w500));
  }
}
