import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCards extends StatelessWidget {
  CustomCards(
      {Key? key,
      required this.color,
      required this.text,
      required this.count,
      required this.percentage})
      : super(key: key);
  Color color;
  String percentage;
  String count;
  String text;
  final TextStyle _textStyle = GoogleFonts.poppins(
    fontSize: 30,
    color: Colors.white,
    fontWeight: FontWeight.bold,
  );
  final TextStyle _textStyle2 = GoogleFonts.poppins(
    fontSize: 18,
    color: Colors.grey.shade300,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 180,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        color: color,
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                percentage,
                style: _textStyle,
              ),
              Text(
                count,
                style: _textStyle2,
              ),
              const LinearProgressIndicator(
                color: Colors.amber,
                value: 20,
              ),
              Text(
                text,
                style: _textStyle2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
