import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/resources/drawable_resoruces.dart';
import 'package:zolar_roof/screens/user_module/screens/user_complaint_register_screen.dart';
import 'package:zolar_roof/screens/user_module/screens/view_compliant_history.dart';
import 'package:zolar_roof/utils/utils.dart';

class CompliantTabScreen extends StatefulWidget {
  const CompliantTabScreen({super.key});

  @override
  State<CompliantTabScreen> createState() => _CompliantTabScreenState();
}

class _CompliantTabScreenState extends State<CompliantTabScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        children: [
          Image.asset(DrawableResource.compliant),

         Padding(padding: EdgeInsets.all(20),child:  Constants.buttonDesign(context, "Register New Compliant", (){
           Utils.navigateTo(context,ComplaintRegisterScreen() );
         }),),
         Padding(padding: EdgeInsets.all(20),child:  Constants.buttonDesign(context, "View Compliant History", (){
          setState(() {
            Utils.navigateTo(context, ViewCompliantHistory());
          });

         }),)
        ],
      ),
    );
  }
}
