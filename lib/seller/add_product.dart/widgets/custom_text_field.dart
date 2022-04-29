import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText = '',
    this.inputType = TextInputType.text,
    this.controller,
  }) : super(key: key);

  final String hintText;

  final TextInputType inputType;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      controller: controller,
      style: GoogleFonts.poppins(
        fontSize: 18.sp,
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
        suffixIcon: Padding(
          padding: EdgeInsets.all(20.w),
          child: const FaIcon(
            FontAwesomeIcons.circleCheck,
            color: Colors.grey,
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
            Radius.circular(15),
          ),
          borderSide: BorderSide(color: Colors.greenAccent),
        ),
      ),
    );
  }
}
