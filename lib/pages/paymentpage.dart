// ignore_for_file: prefer_const_constructors

import 'dart:typed_data';

import 'package:e_rental/Utils/colors.dart';
import 'package:e_rental/components/dropdown.dart';
// import 'package:e_rental/components/paymentpdf.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:slide_to_act/slide_to_act.dart';
// import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class Paymentpage extends StatefulWidget {
  const Paymentpage({super.key});

  @override
  State<Paymentpage> createState() => _PaymentpageState();
}

class _PaymentpageState extends State<Paymentpage> {
  final String tenantname = 'ABAASA Albert';
  final String datteime = DateFormat.yMMMMd().add_jm().format(DateTime.now());
  final String bal = 'Ugx 200,000';
  //Payment Recipt
  Future<Uint8List> generatePdfData() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text(
                'E- Rental Payment Recipt',
                style: pw.TextStyle(
                  fontSize: 20,
                ),
              ),
              pw.SizedBox(height: 30),
              pw.Padding(
                padding: pw.EdgeInsets.all(10.0),
                child: pw.Column(
                  children: [
                    pw.Align(
                      child: pw.Row(
                        children: [
                          pw.Text('TenantID :', style: pw.TextStyle()),
                          pw.Text('\t\tPayment ID-NOV-001',
                              style: pw.TextStyle()),
                        ],
                      ),
                    ),
                    pw.Row(
                      children: [
                        pw.Text('Name :', style: pw.TextStyle()),
                        pw.Text('\t\t$tenantname', style: pw.TextStyle()),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text('Date :', style: pw.TextStyle()),
                        pw.Text('\t\t$datteime', style: pw.TextStyle()),
                      ],
                    ),
                    pw.Row(
                      children: [
                        pw.Text('OutStanding Balance :', style: pw.TextStyle()),
                        pw.Text('\t\t$bal', style: pw.TextStyle()),
                      ],
                    ),
                  ],
                ),
              ),
              pw.SizedBox(height: 20),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text(
                          'Month',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text(
                          'Amount',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text(
                          'Balance',
                          style: pw.TextStyle(fontWeight: pw.FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('November'),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('$bal'),
                      ),
                      pw.Padding(
                        padding: const pw.EdgeInsets.all(8.0),
                        child: pw.Text('500000'),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    return pdf.save();
  }

  // Generate and save the PDF file for downloading or sharing
  Future<File?> generatePdfFile() async {
    final pdfData = await generatePdfData();

    try {
      final dir = await getApplicationDocumentsDirectory();
      final file = File('${dir.path}/e_rental_payment.pdf');
      await file.writeAsBytes(pdfData);
      return file;
    } catch (e) {
      print('Error saving PDF: $e');
      return null;
    }
  }

  Future<void> _previewPdf() async {
    final pdfData = await generatePdfData();
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
            width: double.maxFinite,
            child: PdfPreview(
              build: (format) => pdfData,
              canChangePageFormat: true,
              canChangeOrientation: false,
              onPrinted: (context) async {
                // Handle after printing
                await savePdf(pdfData);
              },
              onShared: (context) async {
                // Handle after sharing
                await savePdf(pdfData);
              },
            ),
          ),
        );
      },
    );
  }

  Future<void> _downloadReceipt() async {
    final pdfFile = await generatePdfFile();
    if (pdfFile != null) {
      await Printing.sharePdf(
        bytes: await pdfFile.readAsBytes(),
        filename: 'e_rental_payment.pdf',
      );
      // Provide user feedback here
    }
  }

  Future<void> savePdf(Uint8List pdfData) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = '${directory.path}/e_rental_payment.pdf';
    final file = File(path);

    await file.writeAsBytes(pdfData);

    final result = await OpenFile.open(path);

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('PDF saved to $path and opened')),
    );

    if (result.message != "Permission denied") {}
  }

  Future<dynamic>? _payement() {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Monthly Payment'),
          content: Text(
            'Your Monthly Payment has been successfully processed!',
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MaterialButton(
                  color: Colors.lightBlueAccent,
                  onPressed: _previewPdf, // Show the PDF preview
                  child: Text(
                    'Preview Receipt',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
                MaterialButton(
                  color: Colors.lightBlueAccent,
                  onPressed: _downloadReceipt, // Download the receipt
                  child: Text(
                    'Download Receipt',
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            )
          ],
        );
      },
    );
  }

  // PhoneNumber Dailer for Emerngy
  void _launchDialer(String phoneNumber) async {
    final Uri launchUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(launchUri)) {
      await launchUrl(launchUri);
    } else {
      throw 'Could not launch $launchUri';
    }
  }

  // Information Bottom Sheet
  void _showGuidelines(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: backgroundColor2,
      showDragHandle: true,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Tenant Help',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Text(
                '1. Before make sure you are registered By Landlord\n'
                '2. Use the Given TenantID\n'
                '3. Double-check before Submitting Payment\n'
                '4. Reach out to support if you encounter any issues.',
                style: GoogleFonts.acme(
                  fontSize: 16,
                  // fontWeight: FontWeight.w200,
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: backgroundColor3,
          appBar: AppBar(
            leading: Container(),
            title: Text(
              'Month Payment',
              style: GoogleFonts.acme(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            centerTitle: true,
            actions: [
              Container(
                margin: EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: backgroundColor1,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () {
                    _launchDialer('+256708215305');
                  },
                  icon: Icon(
                    Icons.phone,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12.0),
                decoration: BoxDecoration(
                  color: backgroundColor1,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: IconButton(
                  onPressed: () => _showGuidelines(context),
                  icon: Icon(
                    Icons.help,
                    color: Colors.lightBlueAccent,
                  ),
                ),
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(12.0),
            child: ListView(
              // physics: BouncingScrollPhysics(),
              children: [
                Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: backgroundColor2,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 18.0,
                          vertical: 8.0,
                        ),
                        child: Column(
                          children: [
                            Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  'Tenant Name :',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\t\t$tenantname',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Date :',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\t\t\t$datteime',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  'Balance :',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '\t\t$bal',
                                  style: GoogleFonts.lato(
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      myTextField('Payment ID- NOV-001', Colors.white),
                      DropDownField(),
                      DropDownField(),
                      myTextField('Enter Payment Amount', Colors.black12),

                      //Button for Submissiion
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: backgroundColor2,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20.0,
                      ),
                      child: Column(
                        children: [
                          SlideAction(
                            onSubmit: _payement,
                            animationDuration:
                                Duration(milliseconds: 2000), // Fixed duration
                            submittedIcon: Icon(
                              Icons.done_all_rounded,
                              color: Colors.white,
                            ),
                            borderRadius: 8.0,
                            text: 'Slide To Pay',
                            textStyle: GoogleFonts.acme(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                            sliderButtonIcon: Icon(Icons.done_all_sharp),
                            innerColor: Colors.white,
                            outerColor: Colors.lightBlueAccent,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 20.0),
                            child: Container(
                              width: size.width,
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(
                                  color: Colors.white,
                                  // strokeAlign: 12,
                                  width: 4,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                              child: const Center(
                                child: Text(
                                  "Payment Recipts",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.lightBlueAccent,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// My textField Here
Container myTextField(String hint, Color color) {
  return Container(
    padding: const EdgeInsets.symmetric(
      horizontal: 25,
      vertical: 10,
    ),
    child: TextField(
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          fillColor: Colors.white,
          filled: true,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(8.0),
          ),
          hintText: hint,
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontSize: 12,
          ),
          suffixIcon: Icon(
            Icons.payment_outlined,
            color: color,
          )),
    ),
  );
}
