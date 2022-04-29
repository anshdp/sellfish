import 'package:buy_fish/common/common_login/bloc/login_bloc.dart';
import 'package:buy_fish/constants/db_collection_constants.dart';
import 'package:buy_fish/constants/db_field_constants.dart';
import 'package:buy_fish/constants/sharedpreferences_constants.dart';
import 'package:buy_fish/helper/helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

final FirebaseAuth _authentication = FirebaseAuth.instance;

final collection = FirebaseFirestore.instance.collection(userCollection);

late String email, currentUserId, userName;
late bool type, permission;

class CommonLoginRepository {
  Future<bool> loginUser(UserLoginEvent event) async {
    try {
      final result = await _authentication.signInWithEmailAndPassword(
        email: event.email,
        password: event.password,
      );

      final id = result.user!.uid;

      final collection = FirebaseFirestore.instance.collection(userCollection);

      final docSnapshot = await collection.doc(id).get();

      if (docSnapshot.exists) {
        final data = docSnapshot.data();

        email = data![emailField].toString();

        currentUserId = data[userIdField].toString();

        type = data[userTypeField] as bool;

        permission = data[permissionField] as bool;

        userName = data[userNameField].toString();
      }

      await HelperClass().setValidationData();

      return true;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'invalid-email':
          break;
        case 'wrong-password':
          break;
        case 'user-not-found':
          break;
        default:
      }
      // ignore: only_throw_errors
      throw e.code;
    }
  }
}
