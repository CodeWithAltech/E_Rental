// ignore_for_file: prefer_const_constructors

import 'package:e_rental/Utils/colors.dart';
import 'package:e_rental/pages/paymentpage.dart';
import 'package:e_rental/pages/tenantchat.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String datetime = DateFormat.yMMMMd().add_jm().format(DateTime.now());
    Size size = MediaQuery.of(context).size;
    return Container(
      color: backgroundColor3,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              'E-Rental',
              style: GoogleFonts.acme(
                fontSize: 12,
              ),
            ),
            actions: [
              Builder(
                builder: (BuildContext context) {
                  return IconButton(
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    icon: Icon(Icons.wechat_sharp),
                  );
                },
              ),
            ],
          ),
          drawer: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Drawer(),
            ),
          ),
          backgroundColor: backgroundColor3,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //your profile
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: backgroundColor2,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Icon(
                              Icons.person,
                              size: 50,
                            ),
                          ),
                        ),
                      ),
                      //RoomNumber
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8.0,
                          vertical: 20,
                        ),
                        child: Text(
                          'Room-ID\n' '$datetime',
                          style: GoogleFonts.acme(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                //Due Balance and Date
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: backgroundColor1,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Pending Balance',
                                style: GoogleFonts.acme(
                                  fontSize: 16,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'Check Balance',
                                style: GoogleFonts.acme(
                                  fontSize: 12,
                                  color: Colors.blue[500],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(12.0),
                        decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              margin: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: Colors.orangeAccent,
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: Text(
                                textAlign: TextAlign.center,
                                'Nov\nMonth',
                                style: GoogleFonts.lato(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text.rich(
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                TextSpan(
                                    text: 'Your Pending Balance #UgX-20000\n',
                                    style: GoogleFonts.lato(
                                      fontSize: 12,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Date : $datetime',
                                        style: GoogleFonts.lato(
                                          fontSize: 12,
                                          // color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    ]),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: Colors.orange,
                                child: Center(
                                  child: IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Paymentpage(),
                                        ),
                                      );
                                    },
                                    icon: const Icon(
                                      Icons.payments,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                //Payment Options
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: backgroundColor1,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Other Payment Options',
                            style: GoogleFonts.acme(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height * 0.3,
                        child: GridView(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 16 / 9,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                            // mainAxisExtent: 5,
                          ),
                          padding: EdgeInsets.all(12.0),
                          children: [
                            PaymentBtn('images/mtnpay.png'),
                            PaymentBtn('images/airtel.png'),
                            PaymentBtn('images/Online Bank.png'),
                            PaymentBtn('images/goplay.png'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                // Others
                Container(
                  margin: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: backgroundColor1,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12.0,
                          vertical: 8.0,
                        ),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Others',
                            style: GoogleFonts.acme(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          height: size.height * 0.15,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListView(
                              children: const [
                                Center(
                                  child: Icon(
                                    Icons.hourglass_empty_rounded,
                                    size: 30,
                                    color: Colors.grey,
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    'No Others ',
                                    style: TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          //FloatingButton for Chat
          floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.lightBlueAccent,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) => Tenantchat(),
                ),
              );
            },
            child: Icon(
              Icons.wechat_outlined,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  Container PaymentBtn(image) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Image.asset(
        image,
        height: 30,
      ),
    );
  }
}
