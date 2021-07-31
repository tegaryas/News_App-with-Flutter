import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Headline extends StatelessWidget {
  final String headline;

  Headline({this.headline});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20,
        right: 20,
        top: 20,
        bottom: 15,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            headline,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Color(0xFFeeeeee),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            child: Text(
              'Show All',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
