// ignore_for_file: prefer_const_constructors

import 'dart:math';

import 'package:e_rental/Utils/colors.dart';
import 'package:e_rental/components/historytile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Historypage extends StatelessWidget {
  const Historypage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor3,
      appBar: AppBar(
        centerTitle: true,
        leadingWidth: sqrt1_2 / 5,
        leading: Container(),
        title: Text(
          'History',
          style: GoogleFonts.acme(
            fontSize: 14,
          ),
        ),
        elevation: 0,
      ),
      body: ListView.builder(
        physics: BouncingScrollPhysics(),
        itemCount: 10,
        itemBuilder: (context, index) {
          return HistoryTile();
        },
      ),
    );
  }
}
