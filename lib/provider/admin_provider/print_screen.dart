import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:printing/printing.dart';
import 'package:provider/provider.dart';

import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/provider/admin_provider/quation_provider.dart';
import 'package:pdf/widgets.dart' as pw;

class QuotationSummaryScreen extends StatefulWidget {
  @override
  State<QuotationSummaryScreen> createState() => _QuotationSummaryScreenState();
}

class _QuotationSummaryScreenState extends State<QuotationSummaryScreen> {
  final GlobalKey<State<StatefulWidget>> _printKey = GlobalKey();

  void _printScreen() {
    Printing.layoutPdf(onLayout: (PdfPageFormat format) async {
      final doc = pw.Document();

      final image = await WidgetWraper.fromKey(
        key: _printKey,
        pixelRatio: 2.0,
      );

      doc.addPage(pw.Page(
          pageFormat: format,
          build: (pw.Context context) {
            return pw.Center(
              child: pw.Expanded(
                child: pw.Image(image),
              ),
            );
          }));

      return doc.save();
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quotation Summary"),
      ),
      body: RepaintBoundary(
        key: _printKey,
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Consumer<QuationProvider>(
            builder: (context,data,_) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buildSummaryItem("EmailId", data.emailid.text),
                  buildSummaryItem("UserName", data.username.text),
                  buildSummaryItem("Phone Number", data.phoneNumber.text),
                  buildSummaryItem("KWH Energy", data.kwhEnergy.text),
                  buildSummaryItem("Daily Used Limit", data.dailyUsedLimit.text),
                  buildSummaryItem("Energy Produced", data.energyProduced.text),
                  buildSummaryItem("Solar Energy For Kseb", data.solarEnergyForKseb.text),
                  buildSummaryItem("Solar Type", data.solarTYpe.text),
                  buildSummaryItem("Solar Capacity", data.subsidyCapacity.text),
                  buildSummaryItem("Subsidy Capacity", data.subsidyCapacity.text),
                  buildSummaryItem("Subsidy Amount", data.susidyAmount.text),
                  buildSummaryItem("Total Amount", data.totalAmount.text),

                ],
              );
            }
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.print),
        onPressed: _printScreen,
      ),
    );
  }

  Widget buildSummaryItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
        ],
      ),
    );
  }
}