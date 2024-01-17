import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/resources/drawable_resoruces.dart';
import 'package:zolar_roof/screens/user_module/screens/request_general_service.dart';
import 'package:zolar_roof/screens/user_module/screens/request_panel_wash.dart';
import 'package:zolar_roof/utils/utils.dart';

class ServiceScreen extends StatefulWidget {
  const ServiceScreen({super.key});

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Column(
        children: [
          Container(
            height: Constants.setHeight(context)/2,
            width: Constants.setWidth(context),
            child: Image.asset(DrawableResource.service,fit: BoxFit.cover,),
          ),
          SizedBox(height: 15,),
         Padding(padding: EdgeInsets.all(10),child:  Constants.buttonDesign(context, "Request Panel Wash @ 199/kw.", (){
           Utils.navigateTo(context, RequestPanelWash());
         }),),
          SizedBox(height: 15,),
         Padding(padding: EdgeInsets.all(10),child:  Constants.buttonDesign(context, "Request general service @499.", (){
           Utils.navigateTo(context, RequestGeneralService());
         }),)
        ],
      ) ,
    );
  }
}
