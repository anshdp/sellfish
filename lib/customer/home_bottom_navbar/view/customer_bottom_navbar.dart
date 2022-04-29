import 'package:buy_fish/customer/cart/cart.dart';
import 'package:buy_fish/customer/feed/feed.dart';
import 'package:buy_fish/customer/profile/profile.dart';
import 'package:buy_fish/customer/wishlist/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class CustomerNavbar extends StatefulWidget {
  const CustomerNavbar({Key? key}) : super(key: key);

  @override
  _CustomerNavbarState createState() => _CustomerNavbarState();
}

class _CustomerNavbarState extends State<CustomerNavbar> {
  int _selectedIndex = 0;

  final List<Widget> _widgetOptions = [
    const Cart(),
    CustomerFeed(),
    const Cart(),
    Wishlist(),
    const CustomerProfile()
    // ProductDetails()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.blueGrey),
        title: Text(
          'SellFish',
          style: GoogleFonts.poppins(
            color: Colors.blueGrey,
            fontSize: 25.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Icon(
              Icons.notifications,
              size: 30.sp,
            ),
          ),
        ],
      ),
      drawer: const Drawer(),
      body: SafeArea(
        minimum: EdgeInsets.only(top: 20.w),
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: GNav(
              rippleColor: Colors.grey[300]!,
              hoverColor: Colors.grey[100]!,
              gap: 2,
              activeColor: Colors.black,
              iconSize: 24,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              duration: const Duration(milliseconds: 400),
              tabBackgroundColor: Colors.grey[100]!,
              color: Colors.black,
              tabs: const [
                GButton(
                  icon: LineIcons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: LineIcons.rss,
                  text: 'Feed',
                ),
                GButton(
                  icon: LineIcons.shoppingBag,
                  text: 'Bag',
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  text: 'Wishlist',
                ),
                GButton(
                  icon: LineIcons.userTie,
                  text: 'Account',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
