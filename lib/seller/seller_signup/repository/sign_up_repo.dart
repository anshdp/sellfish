import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/seller/seller_signup/seller_signup.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _authentication = FirebaseAuth.instance;

CollectionReference users =
    FirebaseFirestore.instance.collection(userCollection);

class SignUpRepo {
  Future<bool> createUser(SignUpSeller event) async {
    try {
      final userCredential =
          await _authentication.createUserWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      await users.doc(userCredential.user!.uid).set(
        {
          userNameField: event.username,
          emailField: event.email,
          phoneNoField: event.phoneNo,
          userIdField: userCredential.user!.uid,
          userTypeField: true,
          permissionField: false,
        },
      );

      return true;
    } catch (e) {
      throw e;
    }
  }
}
