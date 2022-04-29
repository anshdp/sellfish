import 'package:buy_fish/helper/helper.dart';
import 'package:buy_fish/router/app_constants.dart';
import 'package:flutter/material.dart';

class CustomerProfile extends StatelessWidget {
  const CustomerProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () async {
                await HelperClass().clearUserDetails();
                print('data clear');
                await Navigator.pushReplacementNamed(
                  context,
                  RouteConstants.userLogin,
                );
              },
              child: const Text('LogOut'),
            ),
            ElevatedButton(
              onPressed: () async {
                await HelperClass().getValidationData();
                print(userId);
                print(userType);
                print(isLogin);
              },
              child: const Text('userData'),
            ),
          ],
        ),
      ),
    );
  }
}
