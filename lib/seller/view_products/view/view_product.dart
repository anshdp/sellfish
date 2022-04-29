import 'dart:async';

import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/helper/helper.dart';
import 'package:buy_fish/seller/view_products/products_view.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewProducts extends StatelessWidget {
  ViewProducts({Key? key}) : super(key: key);

  late List<dynamic> products;

  CollectionReference productsRef =
      FirebaseFirestore.instance.collection(productsCollection);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productsRef.where(currentUser, isEqualTo: userId).snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          products = snapshot.data!.docs;
          // print(products[1][nameField]);
          return Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 15.w,
                vertical: 10.w,
              ),
              child: GridView.builder(
                itemCount: products.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.60,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) =>
                    ItemCards(products: products[index]),
              ),
            ),
          );
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: .3.sh,
                ),
                const CircularProgressIndicator(
                  color: Colors.redAccent,
                  backgroundColor: Colors.amberAccent,
                ),
                Text(
                  'You are not added any products',
                  style: GoogleFonts.aBeeZee(
                    fontSize: 20.sp,
                  ),
                ),
              ],
            ),
          );
        }
      },
    );
  }
}
