
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:provider/provider.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/provider/userprovider/login_provider.dart';

import '../../../provider/userprovider/compliant_provider.dart';
import '../../../resources/color_resources.dart';
import '../../../resources/drawable_resoruces.dart';
import '../../../resources/style_resource.dart';
import '../../../utils/utils.dart';



class ComplaintRegisterScreen extends StatefulWidget {
  const ComplaintRegisterScreen({Key? key}) : super(key: key);

  @override
  State<ComplaintRegisterScreen> createState() => _ComplaintRegisterScreenState();
}

class _ComplaintRegisterScreenState extends State<ComplaintRegisterScreen> {

  String? email;
  String? phone;
  String? appVersion;

  @override
  void initState() {
    // TODO: implement initState

    context.read<ComplaintViewModel>().reviewMessageController.clear();
    context.read<ComplaintViewModel>().selectedIndex(0);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorResource.whiteTextColor,

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [


              _appExperience(),
              _submitButton()
            ],
          ),
        ),
      ),
    );
  }







  _appExperience() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0, right: 10, top: 10),
      child: Consumer<ComplaintViewModel>(builder: (context, data, _) {
        return Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            elevation: 3,
            shape: RoundedRectangleBorder(

                borderRadius: BorderRadius.circular(20)),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Padding(
                  padding: const EdgeInsets.only(
                      left: 10.0, right: 10, top: 10, bottom: 13),
                  child: Divider(
                    height: 2,
                    thickness: 2,
                    color: ColorResource.commonTextColor
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25.0, right: 28),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          data.selectedIndex(0);
                        },
                        child: Row(
                          children: [
                            data.reviewGrade == "Inverter Fault"
                                ?Icon(Icons.radio_button_checked,size: 18,)
                                : Icon(Icons.radio_button_off,size: 18,),
                            Text("  Inverter Fault",
                                style: StyleResource.smallBlackNormalTextStyle1(
                                    context, )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          data.selectedIndex(1);
                        },
                        child: Row(
                          children: [
                            data.reviewGrade == "Panel Fault"
                                ?Icon(Icons.radio_button_checked,size: 18,)
                                : Icon(Icons.radio_button_off,size: 18,),
                            Text("  Panel Fault",
                                style: StyleResource.smallBlackNormalTextStyle1(
                                  context, )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          data.selectedIndex(2);
                        },
                        child: Row(
                          children: [
                            data.reviewGrade == "KSEB Related"
                                ?Icon(Icons.radio_button_checked,size: 18,)
                                : Icon(Icons.radio_button_off,size: 18,),
                            Text("  KSEB Related",
                                style: StyleResource.smallBlackNormalTextStyle1(
                                  context, )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          data.selectedIndex(3);
                        },
                        child: Row(
                          children: [
                            data.reviewGrade == "Electrical Failure/ Hazards"
                                ?Icon(Icons.radio_button_checked,size: 18,)
                                : Icon(Icons.radio_button_off,size: 18,),
                            Text("  Electrical Failure/ Hazards",
                                style: StyleResource.smallBlackNormalTextStyle1(
                                  context, )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          data.selectedIndex(4);
                        },
                        child: Row(
                          children: [
                            data.reviewGrade == "Billing Related"
                                ?Icon(Icons.radio_button_checked,size: 18,)
                                : Icon(Icons.radio_button_off,size: 18,),
                            Text("  Billing Related",
                                style: StyleResource.smallBlackNormalTextStyle1(
                                  context, )),
                          ],
                        ),
                      ),
                      SizedBox(height: 20,),
                      InkWell(
                        onTap: () {
                          data.selectedIndex(5);
                        },
                        child: Row(
                          children: [

                              data.reviewGrade == "Others"
                                  ?Icon(Icons.radio_button_checked,size: 18,)
                                  : Icon(Icons.radio_button_off,size: 18,),


                            Text("  Others",
                                style: StyleResource.smallBlackNormalTextStyle1(
                                  context, )),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                Consumer<ComplaintViewModel>(builder: (context, data, _) {
                  return Container(
                    height: 300,
                    child: Padding(
                      padding:
                      const EdgeInsets.only(left: 15.0, right: 15, top: 15),
                      child: TextFormField(
                        maxLines: 10,
                        textAlign: TextAlign.start,
                        controller: data.reviewMessageController,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 10),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: ColorResource.greyColor),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color: ColorResource.greyColor),
                            ),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide:
                              BorderSide(color:ColorResource.greyColor),
                            ),
                            hintText:
                            'Add your Compliant',
                            hintStyle: StyleResource.smallBlackNormalTextStyle1(
                                context, )),
                      ),
                    ),
                  );
                }),
              ],
            ));
      }),
    );
  }

  _submitButton() {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, top: 10, bottom: 15),
      child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
        Consumer<ComplaintViewModel>(builder: (context, data, _) {
          return Container(
            height: 41.0,
            width: 120.0,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  ColorResource.orange_color,
                  ColorResource.red_color
                ]),
                color: ColorResource.redTextColor,
                borderRadius: BorderRadius.circular(25)),
            child: TextButton(
                onPressed: () {

                  if (data.reviewMessageController.text.isNotEmpty) {

                    // data.reviewMessageController.clear();
                    context.read<ComplaintViewModel>().sendAppFeedbackData(
                        context,
                        data.reviewGrade.toString(),
                        data.reviewMessageController.text,
                      context.read<LoginProvider>().userId.toString(),
                      context.read<LoginProvider>().userName.toString(),
                      context.read<LoginProvider>().clientCode.toString(),
                      ""
                    );
                  } else {
                    Constants.showLoginErrorToast("Thankyou");
                  }
                },
                child: Text(
                 "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                )),
          );
        }),
      ]),
    );
  }
}
