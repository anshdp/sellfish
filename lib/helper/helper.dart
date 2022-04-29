import 'package:buy_fish/common/common_login/repository/common_login_repo.dart';
import 'package:buy_fish/constants/sharedpreferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool? userType, permissionType, isLogin;
String? userId, emailId, username;

class HelperClass {
  Future getValidationData() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    userType = sharedPreferences.getBool(userTypePref);
    permissionType = sharedPreferences.getBool(permissionPref);
    isLogin = sharedPreferences.getBool(isLoginPref);
    userId = sharedPreferences.getString(userIdPref);
    emailId = sharedPreferences.getString(emailPref);
    username = sharedPreferences.getString(userNamePref);
  }

  Future setValidationData() async {
    final preference = await SharedPreferences.getInstance();

    await preference.setString(userIdPref, currentUserId);

    await preference.setString(emailPref, email);

    await preference.setBool(userTypePref, type);

    await preference.setBool(permissionPref, permission);

    await preference.setString(userNamePref, userName);
  }

  Future clearUserDetails() async {
    final pref = await SharedPreferences.getInstance();
    await pref.clear();
  }
}
