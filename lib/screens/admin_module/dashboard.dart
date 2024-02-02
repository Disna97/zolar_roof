import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:zolar_roof/screens/admin_module/create_accout_screen.dart';
import 'package:zolar_roof/screens/admin_module/quation.dart';

import 'complaint_view_page.dart';



class AdminDashBoard extends StatefulWidget {
  @override
  _AdminDashBoardState createState() => _AdminDashBoardState();
}

class _AdminDashBoardState extends State<AdminDashBoard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your App'),
      ),
      body: Center(
        child: _getPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Create Account',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message),
            label: 'Complaint View',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.accessibility),
            label: 'Quations',
          ),

        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return CreateAnAccount();
      case 1:
        return CompliantViewPage();
      case 2:
        return QuatationScreen();

      default:
        return Container();
    }
  }

}


