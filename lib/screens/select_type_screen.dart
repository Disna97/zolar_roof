import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/constants/shared_preferences.dart';
import 'package:zolar_roof/screens/admin_module/admin_login_screen.dart';
import 'package:zolar_roof/screens/user_module/screens/login_screen.dart';
import 'package:zolar_roof/screens/user_module/screens/user_dashboard_screen.dart';
import 'package:zolar_roof/utils/utils.dart';

import '../provider/userprovider/login_provider.dart';
import '../resources/color_resources.dart';
import '../resources/drawable_resoruces.dart';
import 'admin_module/dashboard.dart';

class SelectTypeScreen extends StatefulWidget {
  const SelectTypeScreen({super.key});

  @override
  State<SelectTypeScreen> createState() => _SelectTypeScreenState();
}

class _SelectTypeScreenState extends State<SelectTypeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<LoginProvider>().userEmail;
    context.read<LoginProvider>().userId;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: _renderMainHead(),
    );
  }

  _renderMainHead() {
    return Column(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.700,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF123F91),
                  Color(0xFF1860E1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Image.asset(
              DrawableResource.swiper3,fit: BoxFit.cover,
            )),
        SizedBox(height: 30,),
        _renderSelectTypeButton()

      ],
    );
  }

  _renderSelectTypeButton(){
    return   Consumer<LoginProvider>(
      builder: (context,data,_) {
        return Column(
          children: [
          Padding(padding: EdgeInsets.all(20),child:  Constants. buttonDesign(context,"SignIn as User",(){Utils.navigateTo(context,  LoginScreen());
           }),),
            Padding(padding: EdgeInsets.all(20),child: Constants. buttonDesign(context,"SignIn as Admin",(){Utils.navigateTo(context,   AdminDashBoard());
           }),),

          ],
        );
      }
    );
  }
}
