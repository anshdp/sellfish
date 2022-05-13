import 'package:buy_fish/customer/product_details/bloc/product_details_bloc.dart';
import 'package:buy_fish/customer/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetails extends StatelessWidget {
  ProductDetails({Key? key, required this.productsDetails}) : super(key: key);

  dynamic productsDetails;

  final ProductDetailsBloc _productDetailsBloc = ProductDetailsBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _productDetailsBloc,
      child: BlocConsumer<ProductDetailsBloc, ProductDetailsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return Scaffold(
            appBar: appBar(),
            body: DetailsBody(productData: productsDetails),
            bottomNavigationBar: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(Icons.share),
                      ),
                    ),
                  ),
                  GestureDetector(
                    child: const Card(
                      child: Padding(
                        padding: EdgeInsets.all(16),
                        child: Icon(Icons.favorite_border),
                      ),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.blueGrey),
                      padding: MaterialStateProperty.all(
                        EdgeInsets.symmetric(vertical: 10.w, horizontal: 4.w),
                      ),
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_bag_outlined),
                    label: Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Text(
                        'Add to bag',
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  // ElevatedButton checkoutButtons(
  //   Icon icon,
  //   String text,
  //   Function fun,
  // ) {
  //   return ElevatedButton.icon(
  //     style: ButtonStyle(
  //       backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey),
  //       padding: MaterialStateProperty.all(
  //         EdgeInsets.symmetric(vertical: 10.w, horizontal: 4.w),
  //       ),
  //     ),
  //     onPressed: () {
  //       fun();
  //     },
  //     icon: icon,
  //     label: Padding(
  //       padding: const EdgeInsets.only(right: 10),
  //       child: Text(
  //         text,
  //         style: GoogleFonts.poppins(
  //           color: Colors.white,
  //           fontSize: 20.sp,
  //           fontWeight: FontWeight.bold,
  //         ),
  //       ),
  //     ),
  //   );
  // }

  AppBar appBar() {
    return AppBar(
      elevation: 0,
      iconTheme: const IconThemeData(color: Colors.grey),
      actions: [
        const Icon(Icons.search),
        SizedBox(
          width: .04.sw,
        ),
        const Icon(Icons.favorite_border),
        SizedBox(
          width: .04.sw,
        ),
        const Icon(Icons.shopping_cart_outlined),
        SizedBox(
          width: .06.sw,
        ),
      ],
    );
  }
}
