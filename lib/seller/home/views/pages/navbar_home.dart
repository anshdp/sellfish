import 'package:buy_fish/helper/helper.dart';
import 'package:buy_fish/seller/home/views/widgets/custom_cards.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NavbarHome extends StatefulWidget {
  const NavbarHome({Key? key}) : super(key: key);

  @override
  State<NavbarHome> createState() => _NavbarHomeState();
}

class _NavbarHomeState extends State<NavbarHome> {
  String? _chosenValue;

  TextStyle greyFonts = GoogleFonts.poppins(
    color: Colors.grey.shade500,
    fontWeight: FontWeight.bold,
    fontSize: 15,
  );
  TextStyle headStyle = GoogleFonts.montserrat(
    fontSize: 25,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('WED, 23 MARCH', style: greyFonts),
                Text(
                  'Hi, $username',
                  style: GoogleFonts.fredokaOne(
                    fontSize: 35,
                  ),
                ),
                Text(emailId.toString(), style: greyFonts)
              ],
            ),
            trailing: const Padding(
              padding: EdgeInsets.only(right: 5),
              child: CircleAvatar(
                radius: 35,
              ),
            ),
          ),
          const SizedBox(height: 30),
          ListTile(
            title: Text('Analytics', style: headStyle),
            trailing: DropdownButton(
              hint: _chosenValue == null
                  ? Text(
                      'Monthly',
                      style: GoogleFonts.poppins(fontSize: 20),
                    )
                  : Text(
                      _chosenValue.toString(),
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
              items: <String>[
                'Day',
                'Monthly',
                'Year',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: const TextStyle(color: Colors.black),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  _chosenValue = value;
                });
              },
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          Container(
            child: Row(
              children: [
                CustomCards(
                  color: Colors.deepPurple.shade900,
                  text: 'Transactions Success',
                  percentage: '97%',
                  count: '2654',
                ),
                CustomCards(
                  color: Colors.cyan.shade900,
                  text: 'Response rate',
                  percentage: '97%',
                  count: '2654',
                ),
                CustomCards(
                  color: Colors.indigo.shade500,
                  text: 'Happy feedbacks',
                  percentage: '97%',
                  count: '2654',
                )
              ],
            ),
          ),
          Card(
            elevation: 50,
            shadowColor: Colors.black,
            color: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Earnings',
                    style: headStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total balance',
                        style: greyFonts,
                      ),
                      Text(
                        '5,892.00,',
                        style: headStyle,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
