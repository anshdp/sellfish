// ignore_for_file: leading_newlines_in_multiline_strings, lines_longer_than_80_chars

import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/customer/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsBody extends StatelessWidget {
  DetailsBody({Key? key, required this.productData}) : super(key: key);

  dynamic productData;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(30),
            color: Colors.white,
            height: size.height / 3,
            width: size.width,
            child: Image.network(
              productData[imageField].toString(),
            ),
          ),
          Divider(),
          Container(
            margin: const EdgeInsets.only(left: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productData[nameField].toString().toUpperCase(),
                  style: GoogleFonts.poppins(
                    color: Colors.grey,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  productData[descriptionField].toString(),
                  style: GoogleFonts.poppins(),
                ),
                Row(
                  children: [
                    Text(
                      '\$ ${productData[discountPriceField]}',
                      style:
                          GoogleFonts.poppins(color: Colors.grey, fontSize: 22),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '\$ ${productData[priceField]}',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '60 % off',
                      style: GoogleFonts.poppins(
                        color: Colors.red,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Text(
                  'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry ,s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.',
                  style: GoogleFonts.poppins(fontSize: 15),
                ),
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                PocketCards(
                  size: size,
                  text: 'Delivery Details',
                  buttonText: 'Check deliver date',
                ),
                PocketCards(
                  size: size,
                  text: 'Bank Offers',
                  buttonText: 'more',
                ),
                PocketCards(
                  size: size,
                  text: 'Product Details',
                  buttonText: 'more',
                ),
                PocketCards(
                  size: size,
                  text: 'Returns',
                  buttonText: 'click here',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PocketCards extends StatelessWidget {
  PocketCards({
    Key? key,
    required this.size,
    required this.text,
    required this.buttonText,
  }) : super(key: key);

  final Size size;
  String text;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 20,
      ),
      child: SizedBox(
        width: size.width,
        child: Card(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(text),
              ),
              TextButton(
                onPressed: () {},
                child: Text(buttonText),
              )
            ],
          ),
        ),
      ),
    );
  }
}
