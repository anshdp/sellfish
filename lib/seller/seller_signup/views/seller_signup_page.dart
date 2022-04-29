import 'package:buy_fish/common/common.dart';
import 'package:buy_fish/router/app_constants.dart';
import 'package:buy_fish/seller/seller_signup/seller_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class SellerSignUp extends StatelessWidget {
  SellerSignUp({Key? key}) : super(key: key);

  final SellerSignUpBloc _sellerLogin = SellerSignUpBloc();

  // String? _errorMessage = '';

  TextEditingController usernameController = TextEditingController(text: ''),
      emailController = TextEditingController(text: ''),
      phoneController = TextEditingController(text: ''),
      passwordController = TextEditingController(text: '');

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _sellerLogin,
      child: BlocConsumer<SellerSignUpBloc, SellerSignUpState>(
        listener: (context, state) {
          if (state is NavigateToLogin) {
            Navigator.pushNamed(context, RouteConstants.userLogin);
          } else {
            print('==========================');
          }
        },
        builder: (context, state) {
          print('state is =====================$state');
          return Scaffold(
            body: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 200, horizontal: 30),
                    color: Colors.white,
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'SellFish',
                              style: GoogleFonts.poppins(
                                fontSize: 40,
                                color: const Color(0xff205072),
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Enter your login details',
                              style: GoogleFonts.montserrat(
                                fontSize: 25,
                                color: Colors.greenAccent,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                        CustomSignUpField(
                          hintText: 'Full name',
                          controller: usernameController,
                          secured: false,
                        ),
                        const SizedBox(height: 5),
                        CustomSignUpField(
                          controller: emailController,
                          hintText: 'Email',
                          secured: false,
                        ),
                        const SizedBox(height: 5),
                        CustomSignUpField(
                          controller: phoneController,
                          hintText: 'Phone  no',
                          secured: false,
                        ),
                        const SizedBox(height: 5),
                        CustomSignUpField(
                          controller: passwordController,
                          hintText: 'Password',
                          secured: true,
                        ),
                        const SizedBox(height: 5),

                        // Text(
                        //   _errorMessage!,
                        //   style: GoogleFonts.montserrat(
                        //     fontSize: 18,
                        //     color: Colors.red,
                        //     fontWeight: FontWeight.w500,
                        //   ),
                        // ),
                        const SizedBox(
                          height: 5,
                        ),

                        ElevatedButton(
                          onPressed: () async {
                            _sellerLogin.add(
                              SignUpSeller(
                                username: usernameController.text,
                                email: emailController.text,
                                phoneNo: phoneController.text,
                                password: passwordController.text,
                              ),
                            );
                          },
                          style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                              const EdgeInsets.symmetric(
                                vertical: 18,
                                horizontal: 140,
                              ),
                            ),
                            shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                            backgroundColor:
                                MaterialStateProperty.all(Colors.greenAccent),
                          ),
                          child: Text(
                            'SignUp',
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                              color: Colors.white,
                              letterSpacing: 0.168,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        LinkButton(
                          subText: 'Already Have an account',
                          linkText: 'Login',
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              RouteConstants.userLogin,
                            );
                          },
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
