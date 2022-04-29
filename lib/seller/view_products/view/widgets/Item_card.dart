import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemCards extends StatelessWidget {
  ItemCards({Key? key, required this.products}) : super(key: key);

  final dynamic products;

  final TextStyle _textStyle = GoogleFonts.poppins(
    color: Colors.blueGrey[900],
    fontSize: 12.sp,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      // height: 180,
      // width: 160,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: .15.sh,
            padding: EdgeInsets.all(5.w),
            child: Image.network(products[imageField].toString()),
          ),
          Padding(
            padding: EdgeInsets.all(5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products[nameField].toString(),
                  style: GoogleFonts.poppins(
                    color: Colors.blueGrey[900],
                    fontWeight: FontWeight.w700,
                    fontSize: 12.sp,
                  ),
                ),
                Text(products[descriptionField].toString(), style: _textStyle),
                Row(
                  children: [
                    Text(
                      '\$ ${products[discountPriceField].toString()}  ',
                      style: _textStyle,
                    ),
                    Text(
                      '\$ ${products[priceField].toString()} ',
                      style: GoogleFonts.poppins(
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Qty: ${products[quantityField].toString()}',
                  style: _textStyle,
                ),
                SizedBox(
                  height: .01.sh,
                ),
                Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.trashCan,
                      size: 20.sp,
                      color: Colors.blueGrey,
                    ),
                    SizedBox(
                      width: .03.sw,
                    ),
                    Icon(
                      FontAwesomeIcons.pen,
                      size: 18.sp,
                      color: Colors.blueGrey,
                    )
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
