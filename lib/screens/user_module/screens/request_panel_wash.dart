import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/provider/userprovider/service_provider.dart';
import 'package:zolar_roof/utils/utils.dart';

import '../../../provider/userprovider/login_provider.dart';

class RequestPanelWash extends StatefulWidget {
  @override
  _RequestPanelWashState createState() => _RequestPanelWashState();
}

class _RequestPanelWashState extends State<RequestPanelWash> {
  DateTime _selectedDate = DateTime.now();
  String? _selectedTimeSlot;

  TextEditingController _textEditingController = TextEditingController();

  List<String> timeSlots = [
    '9:00 AM',
    '10:00 AM',
    '11:00 AM',
    '12:00 PM',
    '1:00 PM',
    '2:00 PM',
    '3:00 PM',
    '4:00 PM',
    '5:00 PM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Request Panel Wash'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // DatePicker
            Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text('Select Date:'),
                    SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        _selectDate(context);
                      },
                      child: Text('Choose Date'),
                    ),
                  ],
                ),

                SizedBox(height: 20),
                Text('Selected Date: ${ DateFormat('dd-MM-yyyy').format(_selectedDate)}'),
              ],
            ),
            SizedBox(height: 20),

            // DropdownButton with time slots
            Row(
              children: [
                Text('Select Time Slot:'),
                SizedBox(width: 10),
                DropdownButton<String>(
                  value: _selectedTimeSlot,
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedTimeSlot = newValue;
                    });
                  },
                  items: timeSlots.map((String time) {
                    return DropdownMenuItem<String>(
                      value: time,
                      child: Text(time),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(height: 20),

            // TextFormField
            TextFormField(
              controller: _textEditingController,
              decoration: InputDecoration(
                labelText: 'Enter additional information',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 30),
            Constants.buttonDesign(context, "Submit", (){
              print("_textEditingController.text,"+_textEditingController.text);
              print(_selectedDate.toString());
              print( context.read<LoginProvider>().userId.toString(),);
              print(context.read<LoginProvider>().userName.toString());
              print( context.read<LoginProvider>().userName.toString());
              print( _selectedTimeSlot.toString());
              context.read<ServiceProvider>().sendServiceData(context,
                  _textEditingController.text,
                  _selectedDate.toString(),
                  context.read<LoginProvider>().userId.toString(),
                  context.read<LoginProvider>().userName.toString(),_selectedTimeSlot.toString());
            })

            // Button to submit the formU
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)), // 1 year from now
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
         // formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        _selectedDate = picked;
      });
    }
  }
}