import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/customer/feed/bloc/favorite_bloc.dart';
import 'package:buy_fish/customer/product_details/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCards extends StatefulWidget {
  ProductCards({Key? key, required this.products}) : super(key: key);

  final dynamic products;

  @override
  State<ProductCards> createState() => _ProductCardsState();
}

class _ProductCardsState extends State<ProductCards> {
  final TextStyle _textStyle = GoogleFonts.poppins(
    color: Colors.blueGrey[900],
    fontSize: 12.sp,
  );

  final FavoriteBloc _favoriteBloc = FavoriteBloc();

  bool isFavorite = false;

  @override

  // ----------check product in wishlist---
  // void initState() {
  //   super.initState();

  //   () async {
  //     // await Future<dynamic>.delayed(const Duration(seconds: 2));
  //     isFavorite = await isFavoriteProduct(widget.products[productIdField]);
  //     if (mounted) {
  //       setState(() {
  //         isFavorite = isFavorite;
  //       });
  //     }
  //   }();
  // }

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _favoriteBloc,
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute<MaterialPageRoute>(
              builder: (context) =>
                  ProductDetails(productsDetails: widget.products),
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
                child: Image.network(widget.products[imageField].toString()),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: isFavorite == false
                    ? IconButton(
                        onPressed: () {
                          _favoriteBloc.add(
                            AddToFavorite(favoriteProducts: widget.products),
                          );
                          setState(() {
                            isFavorite = !isFavorite;
                          });
                        },
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                        ),
                      )
                    : IconButton(
                        onPressed: () {
                          print('already in wishlist');
                        },
                        icon: const Icon(
                          Icons.favorite_border_outlined,
                          color: Colors.red,
                        ),
                      ),
              ),
              Padding(
                padding: EdgeInsets.all(5.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.products[nameField].toString(),
                      style: GoogleFonts.poppins(
                        color: Colors.blueGrey[900],
                        fontWeight: FontWeight.w700,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      widget.products[descriptionField].toString(),
                      style: _textStyle,
                    ),
                    Row(
                      children: [
                        Text(
                          '\$ ${widget.products[discountPriceField].toString()}  ',
                          style: _textStyle,
                        ),
                        Text(
                          '${widget.products[priceField].toString()} ',
                          style: GoogleFonts.poppins(
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'Qty: ${widget.products[quantityField].toString()}',
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



// ----------check product in wishlist---
// Future<bool> isFavoriteProduct(dynamic _productId) async {
//   var _favStatus = false;

//   await HelperClass().getValidationData();

//   final _favCollection =
//       FirebaseFirestore.instance.collection(favoriteCollection).doc(userId);

//   final docSnap = await _favCollection.get();

//   final queue = docSnap.get('favoriteProductsArray') as List;

//   for (final item in queue) {
//     if (item['productId'].contains(_productId) == true) {
//       _favStatus = true;
//     }
//   }
//   return _favStatus;
// }
