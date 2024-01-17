

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../resources/color_resources.dart';
import '../resources/style_resource.dart';

class Constants{
  static const fontFamily = "PTSans";
  static const fontRoboto = "RobotoMedium";
  static String loggedInKey = 'is_logged_in';

 static  setHeight(BuildContext context){
    var h=MediaQuery.of(context).size.height;
    return h;
  }
  static setWidth(BuildContext context){
    var h=MediaQuery.of(context).size.width;
    return h;
  }
  static buttonDesign(BuildContext context,String buttonName,Function onTap,){
   return  Column(
       crossAxisAlignment: CrossAxisAlignment.center,
       children: [
         Container(
           width:setWidth(context) ,

           decoration: BoxDecoration(
               gradient:   const LinearGradient(colors: [
                 ColorResource.orange_color,
                 ColorResource.red_color
               ]),
               color: ColorResource.redTextColor,
               borderRadius: BorderRadius.circular(10)),
           child: TextButton(
               onPressed: () {
                     onTap();
               },
               child:  Text(
                 buttonName,
                 style: const TextStyle(
                     color: Colors.white,
                     fontWeight: FontWeight.normal,
                     fontSize: 16),
               )),
         ),
       ]);
  }
  static textFormFeildsDesign(BuildContext context,TextEditingController controller,String text,IconData icon){
   return  Padding(
     padding: const EdgeInsets.only(left: 30.0, right: 30,bottom: 10),
     child: Container(
       decoration: containerDecoration(),
       height: 47.0,
       width: MediaQuery.of(context).size.width,
       margin: EdgeInsets.only(left: 1, right: 10),
       child: TextField(
         style: TextStyle(color: ColorResource.commonTextColor),
         controller: controller,
         decoration: InputDecoration(
             border: InputBorder.none,
             hintText: text,
             hintStyle: StyleResource.smallNormalSubTextStyle(context),
             labelText: text,
             labelStyle: StyleResource.smallBlackNormalTextStyle(context)
                 .copyWith(color: ColorResource.greyColor),
             // prefixIcon: Icon(Icons.account_circle_outlined),
             prefixIcon:  Icon(icon,color: ColorResource.greyColor)
         ),
       ),
     ),
   );
  }

  static BoxDecoration containerDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
            spreadRadius: 2,
            color: Colors.black.withOpacity(0.05), //New
            blurRadius: 7)
      ],
    );
  }
  static showLoginErrorToast(String message){
   return Fluttertoast.showToast(
     msg: message,
     toastLength: Toast.LENGTH_SHORT,
     gravity: ToastGravity.BOTTOM,
     timeInSecForIosWeb: 1,
     backgroundColor: ColorResource.red_color,
     textColor: Colors.white,
     fontSize: 16.0,
   );
  }

}