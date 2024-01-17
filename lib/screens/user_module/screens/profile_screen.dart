import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:provider/provider.dart';

import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/resources/drawable_resoruces.dart';
import 'package:zolar_roof/screens/select_type_screen.dart';

import 'package:zolar_roof/screens/user_module/screens/webview_screen.dart';
import 'package:zolar_roof/utils/utils.dart';

import '../../../provider/userprovider/login_provider.dart';
import '../../../resources/color_resources.dart';
import '../../../resources/style_resource.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  DocumentSnapshot? userSnapshot;

  InAppWebViewController? webView;
  bool? plantServiceTeamBool=false;
  bool? contactDetailsBool=false;
  bool? aboutBool=false;

  firbasevalue()async {
    userSnapshot = await FirebaseFirestore.instance.collection('users').doc(context.read<LoginProvider>().userId).get();
    return userSnapshot;
  }

  @override
  void initState() {
    // TODO: implement initState
    firbasevalue();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: firbasevalue(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              return
             Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(height: Constants.setHeight(context)/4.5,
                    width: Constants.setWidth(context),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                          gradient: LinearGradient(colors: [
                            Color(0xFF123F91),
                            Color(0xFF1860E1),
                          ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.asset(DrawableResource.profile_pic,height: 120,width: 120,),
                          SizedBox(width: 30,),
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(userSnapshot!['name']??"",style: TextStyle(fontSize:18,fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(height: 3,),
                              Text(userSnapshot!['client_code']??"",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey),),
                              SizedBox(height: 8,),
                              Text(userSnapshot!['username']??"",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                              SizedBox(height: 3,),
                              Text(userSnapshot!['mobileNumber']??"",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                            ],
                          ),

                        ],
                      ),
                    ),),
                  ),
                  SizedBox(height: 20,),
                  Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      extraIcons(context, DrawableResource.kseb_bill_calculator, "KSEB Bill Calculator", () {
                        setState(() {
                         Utils.navigateTo(context, WebViewScreen(webViewScreenType: "https://bills.kseb.in/",));
                        });
                      }),
                      extraIcons(context, DrawableResource.mnre_national_portal, "MNRE National Portal", () {
                        setState(() {
                          Utils.navigateTo(context, WebViewScreen(webViewScreenType: "https://solarrooftop.gov.in/",));
                        });
                      })
                    ],
                  ),
                  SizedBox(height: 20,),
                  buttonsDesign(context, "Plant Service Team", () {
                   setState(() {

                     plantServiceTeamBool = !plantServiceTeamBool!;
                   });
                  }),
                  plantServiceTeamBool==true?  plantServiceTeam():Container(),
                  SizedBox(height: 5,),

                  buttonsDesign(context, "Contact Details", () {
                    setState(() {

                      contactDetailsBool = !contactDetailsBool!;
                    });
                  }),
                  contactDetailsBool==true? contactDetails ():Container(),


                  SizedBox(height: 5,),

                  buttonsDesign(context, "About Zolar Roof Pvt Ltd", () {
                    setState(() {
                      aboutBool =!aboutBool!;
                    });
                  }),
                  aboutBool==true?about():Container(),
                  SizedBox(height: 10,),
                  logout(context,"Log Out",(){
                    Utils.navigateTo(context, SelectTypeScreen());
                  })

                ],
              );
            }
          },
        ),
      ),

    );
  }
  extraIcons(
      BuildContext context, String image, String name, VoidCallback pressed) {
    return GestureDetector(
      onTap: pressed,
      child: Container(
        height: 150.0,
        width: MediaQuery.of(context).size.width / 3,
        decoration: BoxDecoration(
            border: Border.all(color: ColorResource.lightGrey),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                blurRadius: 4.0,
              ),
            ],
            borderRadius: BorderRadius.circular(18),
            color: ColorResource.whiteTextColor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 6,
            ),
           Image.asset(
              image,
              width: 50,
              height: 50,

            ),
            SizedBox(
              height: 12,
            ),
            Text(
              name,
              textAlign: TextAlign.center,
              style: StyleResource.psansRegular(
                  context, 18, ColorResource.currencyGrey),
            ),
          ],
        ),
      ),
    );
  }
  buttonsDesign(
      BuildContext context,  String name, VoidCallback pressed) {
    return GestureDetector(
      onTap: pressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10,),
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(
              // border: Border.all(color: ColorResource.lightGrey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: ColorResource.whiteTextColor),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: StyleResource.psansRegular(
                      context, 14, ColorResource.currencyGrey),
                ),
                Icon(Icons.arrow_drop_down_outlined,size: 24,)
              ],
            ),
          ),
        ),
      ),
    );
  }
  logout(
      BuildContext context,  String name, VoidCallback pressed) {
    return GestureDetector(
      onTap: pressed,
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10,),
        child: Container(
          height: 50.0,
          width: MediaQuery.of(context).size.width ,
          decoration: BoxDecoration(
            // border: Border.all(color: ColorResource.lightGrey),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 4.0,
                ),
              ],
              borderRadius: BorderRadius.circular(10),
              color: ColorResource.whiteTextColor),
          child: Padding(
            padding: const EdgeInsets.only(left: 18.0,right: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(
                  name,
                  textAlign: TextAlign.center,
                  style: StyleResource.psansRegular(
                      context, 14, Colors.red),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget buildTextRow(String label, String value) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        Expanded(
          flex: 3,
          child: Text(
            '$label',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          flex: 3,
          child: Text(":"),
        ), Expanded(
          flex: 3,
          child: Text(value),
        ),
      ],
    );
  }
  plantServiceTeam(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildTextRow("Plant Technician", "NA"),
              SizedBox(height: 10,),
              buildTextRow("Plant Supervisor", "Radhakrishnan N"),
              SizedBox(height: 10,),
              buildTextRow("Plant Engineer", "Albin Paul")
            ],
          ),
        ),
      ),
    );
  }
  contactDetails(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              buildTextRow("Albin Paul", " 8129110444"),
              SizedBox(height: 10,),
              buildTextRow("Radhakrishnan N", "9812345678"),

            ],
          ),
        ),
      ),
    );
  }
  about(){
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: const Text("Zolar Roof Private Limited is a Private incorporated on 06 August 2021."
          " It is classified as Non-govt company and is registered at Registrar of Companies, Ernakulam."
          " Its authorized share capital is Rs. 1,000,000 and its paid up capital is Rs. 275,000. It is inolved in"
          " Manufacture of electricity distribution and control apparatus [electrical apparatus for switching or protecting electrical circuits "
          "(e.g. switches, fuses, voltage limiters, surge suppressors, junction boxes etc.) for a voltage exceeding 1000 volts; similar apparatus "
          "(including relays, sockets etc.) for a voltage not exceeding 1000 volts; boards, panels, consoles, cabinets and other bases equipped with "
          "two or more of the above apparatus for electricity control or distribution of electricity including power capacitors.")

      ),
    );
  }


}
