import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/screens/user_module/screens/print_screen.dart';
import 'package:zolar_roof/screens/user_module/screens/profile_screen.dart';
import 'package:zolar_roof/screens/user_module/screens/service_screen.dart';

import '../../../provider/userprovider/login_provider.dart';
import 'compliant_tab_screen.dart';
import 'home_screen.dart';


class UserDashBoard extends StatefulWidget {
  @override
  _UserDashBoardState createState() => _UserDashBoardState();
}

class _UserDashBoardState extends State<UserDashBoard> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [],
        title: Text("Hi ${context.read<LoginProvider>().userName}..."),
      ),
      body: Center(
        child: _getPage(_currentIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(selectedLabelStyle: TextStyle(color: Colors.blue),
        unselectedLabelStyle: TextStyle(color: Colors.black),

        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home,color: Colors.blue,),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_comment_sharp,color: Colors.blue,),
            label: 'Complaint',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.work,color: Colors.blue,), // New icon for "Service"
            label: 'Service', // New label for "Service"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined,color: Colors.blue,),
            label: 'Profile',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_page_outlined,color: Colors.blue,),
            label: 'Print',
          ),

        ],
      ),
    );
  }

  Widget _getPage(int index) {
    switch (index) {
      case 0:
        return HomeScreen();
      case 1:
        return CompliantTabScreen();
      case 2:
        return ServiceScreen(); // Replace YourServiceScreen with the actual screen for "Service"
      case 3:
        return ProfileScreen();
      case 4:
        return PrintScreen();
      default:
        return Container();
    }
  }
}