import 'package:buy_fish/customer/feed/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.productsDetails}) : super(key: key);

  dynamic productsDetails;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: appBar(),
      body: DetailsBody(productData: productsDetails),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 10.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CheckoutButtons(
              icon: const Icon(
                Icons.shopping_cart_outlined,
                color: Colors.blueGrey,
              ),
              text: 'Add to Cart',
            ),
            SizedBox(
              width: .02.sw,
            ),
            CheckoutButtons(
              icon: const Icon(
                Icons.download_done_sharp,
                color: Colors.blueGrey,
              ),
              text: 'Buy now',
            ),
          ],
        ),
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: Colors.blueGrey,
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.white),
      actions: [
        const Icon(Icons.search),
        SizedBox(
          width: .03.sw,
        ),
        const Icon(Icons.shopping_cart_outlined),
        SizedBox(
          width: .03.sw,
        ),
      ],
    );
  }
}

class CheckoutButtons extends StatelessWidget {
  CheckoutButtons({
    Key? key,
    this.icon,
    this.text = '',
  }) : super(key: key);

  Icon? icon;
  String? text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: icon!,
      label: Text(
        text!,
        style: GoogleFonts.poppins(
          color: Colors.blueGrey,
          fontSize: 20.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
        padding: MaterialStateProperty.all(
          EdgeInsets.symmetric(vertical: 10.w, horizontal: 4.w),
        ),
      ),
    );
  }
}
