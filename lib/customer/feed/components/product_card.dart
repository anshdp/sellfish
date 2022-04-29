import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/customer/feed/bloc/favorite_bloc.dart';
import 'package:buy_fish/customer/feed/components/product_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCards extends StatelessWidget {
  ProductCards({Key? key, required this.products}) : super(key: key);

  final dynamic products;

  final TextStyle _textStyle = GoogleFonts.poppins(
    color: Colors.blueGrey[900],
    fontSize: 12.sp,
  );

  final FavoriteBloc _favoriteBloc = FavoriteBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _favoriteBloc,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<MaterialPageRoute>(
              builder: (context) => ProductDetails(productsDetails: products),
            ),
          );
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                child: Image.network(products[imageField].toString()),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: IconButton(
                  onPressed: () {},
                  icon: IconButton(
                    onPressed: () {
                      _favoriteBloc
                          .add(AddToFavorite(favoriteProducts: products));
                      print('clicked');
                    },
                    icon: const Icon(Icons.favorite_border_outlined),
                  ),
                ),
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
                    Text(
                      products[descriptionField].toString(),
                      style: _textStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ ${products[discountPriceField].toString()}  ',
                          style: _textStyle,
                        ),
                        Text(
                          '${products[priceField].toString()} ',
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
