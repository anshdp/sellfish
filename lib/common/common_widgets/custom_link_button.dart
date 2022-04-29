import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    Key? key,
    required this.linkText,
    required this.onTap,
    this.subText = '',
  }) : super(key: key);
  final String linkText;
  final String subText;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            subText,
            style: GoogleFonts.montserrat(
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            linkText,
            style: GoogleFonts.montserrat(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      onTap: () => onTap(),
    );
  }
}
