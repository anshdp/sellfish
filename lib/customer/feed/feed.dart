import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/customer/feed/components.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomerFeed extends StatelessWidget {
  CustomerFeed({Key? key}) : super(key: key);

  late List<dynamic> products;

  final CollectionReference productsRef =
      FirebaseFirestore.instance.collection(productsCollection);
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: productsRef.snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasData) {
          products = snapshot.data!.docs;
          // print(products[1][nameField]);
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: GridView.builder(
                itemCount: products.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.55.w,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductCards(products: products[index]);
                }),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
