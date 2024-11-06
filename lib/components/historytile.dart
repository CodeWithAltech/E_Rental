import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HistoryTile extends StatelessWidget {
  const HistoryTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(8.0),
            margin: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              textAlign: TextAlign.center,
              '12\nMonth',
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
                  text: 'You have Paid #UgX-20000\n',
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'Date : 12th/ Nov/2024',
                      style: GoogleFonts.lato(
                        fontSize: 12,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ]),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CircleAvatar(
              backgroundColor: Colors.lightBlueAccent,
              child: Center(
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
