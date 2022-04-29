import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductTitle extends StatelessWidget {
  ProductTitle({Key? key, required this.productData}) : super(key: key);

  dynamic productData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aquarium fishes',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          Text(
            productData[nameField].toString(),
            style: Theme.of(context).textTheme.headline4!.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
          ),
          SizedBox(
            height: .001.h,
          ),
          Row(
            children: [
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Price\n',
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    TextSpan(
                      text: '\$ ${productData[priceField]}\n\n',
                      style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: Colors.grey,
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.lineThrough,
                          ),
                    ),
                    TextSpan(
                      text: '\$ ${productData[discountPriceField]}',
                      style: Theme.of(context).textTheme.headline4!.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Image.network(
                  productData[imageField].toString(),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
