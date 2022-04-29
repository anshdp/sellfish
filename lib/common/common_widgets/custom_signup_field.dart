import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomSignUpField extends StatelessWidget {
  CustomSignUpField({
    Key? key,
    this.hintText,
    this.secured,
    this.controller,
  }) : super(key: key);

  String? hintText;

  bool? secured;

  TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 25,
            offset: Offset(0, 5),
            spreadRadius: -25,
          ),
        ],
      ),
      margin: const EdgeInsets.only(bottom: 20),
      child: TextField(
        controller: controller,
        style: GoogleFonts.poppins(
          fontSize: 20,
          color: Colors.black,
          letterSpacing: 0.24,
          fontWeight: FontWeight.w500,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(
            color: Color(0xffA6B0BD),
          ),
          fillColor: Colors.white,
          filled: true,
          suffixIcon: const Padding(
            padding: EdgeInsets.all(8),
            child: FaIcon(
              FontAwesomeIcons.circleCheck,
              color: Colors.greenAccent,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(1),
            ),
            borderSide: BorderSide(color: Colors.white),
          ),
        ),
        obscureText: secured!,
      ),
    );
  }
}
