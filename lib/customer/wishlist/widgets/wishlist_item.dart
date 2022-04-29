import 'package:buy_fish/customer/wishlist/bloc/wishlist_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class WishlistCards extends StatelessWidget {
  WishlistCards({Key? key, required this.favProducts}) : super(key: key);

  final dynamic favProducts;

  final WishlistBloc _wishlistBloc = WishlistBloc();

  final TextStyle _textStyle = GoogleFonts.poppins(
    color: Colors.blueGrey[900],
    fontSize: 12.sp,
  );

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _wishlistBloc,
      child: GestureDetector(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 6.w),
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: .15.sh,
                padding: EdgeInsets.all(8.w),
                child: Image.network(favProducts['image'].toString()),
              ),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      favProducts['productName'].toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          favProducts['productPrice'].toString(),
                          style: _textStyle,
                        ),
                        SizedBox(width: 10),
                        Text(
                          favProducts['productPrice'].toString(),
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            print(favProducts['index']);
                            _wishlistBloc.add(RemoveFromWishlist(
                                favProducts['productId'].toString()));
                          },
                          icon: const Icon(
                            Icons.delete,
                            size: 20,
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.shopping_cart,
                            size: 20,
                            color: Colors.black,
                          ),
                          label: const Text(
                            'Add to cart',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
