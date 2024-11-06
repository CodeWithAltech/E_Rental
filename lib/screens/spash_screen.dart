import 'package:e_rental/screens/roomid.dart';
import 'package:flutter/material.dart';
import 'package:e_rental/screens/email_signin.dart';
import 'package:e_rental/Utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: backgroundColor2,
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: size.height * 0.53,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                    color: splashColor,
                    image: const DecorationImage(
                      image: AssetImage(
                        "images/image.png",
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: size.height * 0.59,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "E-Rental\nComfont and Fun",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.acme(
                            fontWeight: FontWeight.bold,
                            fontSize: 40,
                            color: textColor1,
                            height: 1.2),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        "Enjoy Online House Utility Payements \nAt Your Home Comfont",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.acme(
                          fontSize: 18,
                          color: textColor2,
                        ),
                      ),
                      SizedBox(height: size.height * 0.04),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                        ),
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: backgroundColor3.withOpacity(0.9),
                            border: Border.all(
                              color: Colors.white,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12.withOpacity(0.05),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: const Offset(0, -1),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Row(
                              children: [
                                GestureDetector(
                                  child: Container(
                                    height: size.height * 0.08,
                                    width: size.width / 2.2,
                                    decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "RoomID",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (cxt) => const RoomSignIn(),
                                      ),
                                    );
                                  },
                                ),
                                const Spacer(),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => const SignIn(),
                                      ),
                                    );
                                  },
                                  child: Text(
                                    "Email/Password",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: textColor1,
                                    ),
                                  ),
                                ),
                                const Spacer(),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'V-1.0.0',
                          style: TextStyle(
                            color: textColor1,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
