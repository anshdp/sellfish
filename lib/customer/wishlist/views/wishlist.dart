import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/customer/wishlist/widgets/wishlist_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Wishlist extends StatelessWidget {
  Wishlist({Key? key}) : super(key: key);

  CollectionReference favoriteRef =
      FirebaseFirestore.instance.collection(favoriteCollection);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  late User? currentUser = _auth.currentUser;

  List<dynamic>? favProducts;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: favoriteRef.doc(currentUser!.uid).snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasData) {
          favProducts = snapshot.data!.get('favoriteProductsArray') as List;
          return Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 10.w,
            ),
            child: GridView.builder(
              itemCount: favProducts!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.70.w,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) => WishlistCards(
                favProducts: favProducts![index],
              ),
            ),
          );
        } else {
          print('------------------------');
          return Container();
        }
      },
    );
  }
}
