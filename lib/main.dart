import 'package:flutter/material.dart';
import 'package:guzo/homepage.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(
    MaterialApp(
      home: HomePage(),
      theme: ThemeData(textTheme: GoogleFonts.quicksandTextTheme()),
      debugShowCheckedModeBanner: false,
    ),
  );
}
