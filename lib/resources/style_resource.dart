import 'package:flutter/cupertino.dart';

import '../constants/constants.dart';
import 'color_resources.dart';

String fontFamily = Constants.fontFamily;
String fontRoboto = Constants.fontRoboto;
class StyleResource{
  static TextStyle smallNormalSubTextStyle(BuildContext context) {
    //12.5
    double size =12.5;
    return TextStyle(
      fontFamily: fontFamily,
      color: ColorResource.subTextColors,
      fontSize: size,
      fontWeight: FontWeight.normal,
    );
  }
  static TextStyle smallBlackNormalTextStyle1(BuildContext context) {
    //16
    double size =16;
    return TextStyle(
        color: ColorResource.commonTextColor,
        fontSize: size,
        fontWeight: FontWeight.normal,
        fontFamily: fontFamily);
  }
  static TextStyle smallBlackNormalTextStyle(BuildContext context) {
    //12
    double size =12;
    return TextStyle(
      fontFamily: fontFamily,
      color: ColorResource.commonTextColor,
      fontSize:size,
      fontWeight: FontWeight.normal,
    );
  }
  static TextStyle smallGreyBoldTextStyle(BuildContext context) {
    //13
    double size =13;
    return new TextStyle(
      color: ColorResource.textGreyColor,
      fontSize:  size,
      fontFamily: fontFamily,
      fontWeight: FontWeight.w600,
    );
  }
  static TextStyle psansRegular(
      BuildContext context, double size, Color color) {
    return new TextStyle(color: color, fontFamily: fontFamily, fontSize: size);
  }
}