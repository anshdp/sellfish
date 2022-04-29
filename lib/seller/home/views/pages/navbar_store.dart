import 'package:buy_fish/seller/add_product.dart/add_product.dart';
import 'package:buy_fish/seller/view_products/view/view_product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Store extends StatelessWidget {
  Store({Key? key}) : super(key: key);

  TextStyle productTextStyle = GoogleFonts.poppins(fontSize: 30);
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: Text(
            'Add a new product',
            style: productTextStyle,
          ),
          onTap: () {
            showMaterialModalBottomSheet<dynamic>(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => AddProducts(),
            );
          },
        ),
        ViewProducts()
      ],
    );
  }
}
