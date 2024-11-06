import 'package:e_rental/Utils/colors.dart';
import 'package:e_rental/pages/historypage.dart';
import 'package:e_rental/pages/homepage.dart';
import 'package:e_rental/pages/paymentpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int _selectedIndex = 0;

  void navigate(int index) {}

  final List<Widget> _pages = const [
    HomeScreen(),
    Paymentpage(),
    Historypage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor3,
        body: _pages[_selectedIndex],
        bottomNavigationBar: Container(
          padding: const EdgeInsets.all(12.0),
          decoration: const BoxDecoration(
              // color: Colors.amber,
              ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: BottomNavigationBar(
              currentIndex: _selectedIndex,
              selectedItemColor: Colors.black54,
              unselectedItemColor: Colors.lightBlueAccent,
              onTap: (int index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              // showUnselectedLabels: false,
              backgroundColor: Colors.grey[100],
              items: const [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home_max_sharp,
                    ),
                    label: 'Home'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.payments,
                    ),
                    label: 'Payment'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.history_edu_outlined,
                    ),
                    label: 'History'),
              ],
            ),
          ),
        ));
  }
}
