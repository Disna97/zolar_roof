import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zolar_roof/screens/admin_module/dashboard.dart';
import 'package:zolar_roof/utils/utils.dart';
import '../../../constants/constants.dart';
import '../../../resources/color_resources.dart';
import '../../../resources/drawable_resoruces.dart';
import '../../../resources/style_resource.dart';
class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);
  @override
  _AdminLoginScreenState createState() => _AdminLoginScreenState();
}
class _AdminLoginScreenState extends State<AdminLoginScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseReference _database = FirebaseDatabase.instance.reference();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  void dispose() {
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _renderBodyMain(),
    );
  }
  Widget _authFields() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Constants.textFormFeildsDesign(context, userNameController, "UserName", Icons.account_box_outlined),
        const SizedBox(height: 10,),
        Constants.textFormFeildsDesign(context, passwordController, "Password", Icons.password),
        const SizedBox(height: 10,),],
    );
  }
  _renderBodyMain() {
    return SingleChildScrollView(
      child: Column(
        children: [_renderMainHead(),
          _rendSubHead()
        ],
      ),
    );
  }
  _renderMainHead() {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.500,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
                  Color(0xFF123F91),
                  Color(0xFF1860E1),
                ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Image.asset(
              DrawableResource.swiper2,fit: BoxFit.cover,
            )),
      ],
    );
  }
  _rendSubHead() {
    return SingleChildScrollView(
      child: Container(
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(color: ColorResource.loginPageColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _renderSizedBox(MediaQuery.of(context).size.height * 0.040),

              _renderLoginText(),
              _renderSizedBox(MediaQuery.of(context).size.height * 0.009),
              _renderLoginDescription("Please Enter Login Details "),

              _renderSizedBox(MediaQuery.of(context).size.height * 0.020),
              _authFields(),
              Padding(padding:     const EdgeInsets.only(left: 40.0, right: 40,bottom: 10),child:  Constants. buttonDesign(context,"  SignIn  ",(){
                if(userNameController.text=="firealbin@gmail.com"&&passwordController.text=="123456"){
                  print("object");
                  Utils.navigatePushAndReplacement(context,AdminDashBoard());

                }
                else{
                  Constants.showLoginErrorToast("Please check the credintails..you are not a registered admin");
                }
              }),),

              const SizedBox(height: 10,),


              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: SvgPicture.asset(
                  DrawableResource.onboarding,
                  width: 140,
                  height: 110,
                  color: ColorResource.greyColor,
                ),
              ),
            ],
          )
      ),
    );
  }

  _renderSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }
  _renderLoginText() {
    return Text(
      "Admin Login",
      style: StyleResource.smallBlackNormalTextStyle(context).copyWith(fontSize: 20),
    );
  }
  _renderLoginDescription(String description) {
    return Text(
      description,
      style: StyleResource.smallGreyBoldTextStyle(context).copyWith(
          color: ColorResource.greyColor, fontWeight: FontWeight.normal),
    );
  }

}

