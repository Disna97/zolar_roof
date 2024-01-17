import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:zolar_roof/provider/admin_provider/signin_provider.dart';
import '../../constants/constants.dart';
import '../../resources/color_resources.dart';
import '../../resources/drawable_resoruces.dart';
import '../../resources/style_resource.dart';

class CreateAnAccount extends StatefulWidget {
  const CreateAnAccount({Key? key}) : super(key: key);

  @override
  _CreateAnAccountState createState() => _CreateAnAccountState();
}

class _CreateAnAccountState extends State<CreateAnAccount> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController customerAddress = TextEditingController();
  TextEditingController  pv_plant_address = TextEditingController();
  TextEditingController gps_location = TextEditingController();
  TextEditingController solar_plant_id = TextEditingController();
  TextEditingController plant_capacity = TextEditingController();
  TextEditingController inverter_making = TextEditingController();
  TextEditingController  inverter_capacity= TextEditingController();
  TextEditingController  inverter_serial_number= TextEditingController();
  TextEditingController pv_modues_making = TextEditingController();
  TextEditingController  pv_module_capacity= TextEditingController();
  TextEditingController pv_module_serial_number = TextEditingController();
  TextEditingController data_logger_serial_number  = TextEditingController();
  TextEditingController  data_logger_check_digits= TextEditingController();
  TextEditingController rm_portal_number = TextEditingController();
  TextEditingController  customRmMobileApp= TextEditingController();
  TextEditingController  portal_app_username= TextEditingController();
  TextEditingController  portal_app_passworb= TextEditingController();
  TextEditingController kseb_customer_number  = TextEditingController();
  TextEditingController kseb_section_office = TextEditingController();
  TextEditingController last_connected_load  = TextEditingController();
  TextEditingController  phase_of_kseb_connection= TextEditingController();
  TextEditingController  transformer= TextEditingController();
  TextEditingController pole_number = TextEditingController();
  TextEditingController is_wheel_opted = TextEditingController();
  TextEditingController wheeled_consumer_number = TextEditingController();
  TextEditingController  wheeled_section= TextEditingController();
  TextEditingController  is_this_a_subsidy_project= TextEditingController();
  TextEditingController is_edible_capacity  = TextEditingController();
  TextEditingController subsidy_amount = TextEditingController();
  TextEditingController subsidy_release_data = TextEditingController();

  TextEditingController clientController = TextEditingController();
  int select_container = 0;
  String select_drop = "0";
  int? selected_index ;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    subsidy_release_data.dispose();
    subsidy_amount.dispose();
    is_edible_capacity.dispose();
    is_this_a_subsidy_project.dispose();
    wheeled_section.dispose();
    wheeled_consumer_number.dispose();
    is_wheel_opted.dispose();


    pole_number.dispose();
    transformer.dispose();
    phase_of_kseb_connection.dispose();
    last_connected_load.dispose();
    kseb_section_office.dispose();
    kseb_customer_number.dispose();
    portal_app_passworb.dispose();
    portal_app_username.dispose();
    customRmMobileApp.dispose();
    rm_portal_number.dispose();
    data_logger_check_digits.dispose();
    data_logger_serial_number.dispose();
    pv_module_serial_number.dispose();
    pv_module_capacity.dispose();
    pv_modues_making.dispose();
    inverter_serial_number.dispose();
    inverter_capacity.dispose();
    inverter_making.dispose();
    plant_capacity.dispose();
    solar_plant_id.dispose();
    gps_location.dispose();
    pv_plant_address.dispose();
    userNameController.dispose();
    passwordController.dispose();
    confirmPassword.dispose();
    nameController.dispose();
    mobileNumber.dispose();
    customerAddress.dispose();
    clientController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: mainView(),
    ));
  }

  Widget _customerBasicInformation() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.textFormFeildsDesign(
              context, clientController, "Customer ID", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, nameController, "Customer Name", Icons.contact_page),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, userNameController,
              "Email Address", Icons.account_box_outlined),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, passwordController, "Password", Icons.password),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, confirmPassword,
              "Confirm Password", Icons.password_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, mobileNumber,
              "Mobile Number", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, customerAddress,
              "Customer Address", Icons.add_chart_sharp),
        ],
      ),
    );
  }

  Widget _solarPowerPlantDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.textFormFeildsDesign(
              context, pv_plant_address, "PV Plant Address", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, gps_location, "GPS Location", Icons.contact_page),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, solar_plant_id,
              "Solar Plant ID", Icons.account_box_outlined),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, plant_capacity, "Plant Capacity", Icons.password),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, inverter_making,
              "Inverter Make and Model", Icons.password_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, inverter_capacity,
              "Inverter Capacity", Icons.add_chart_sharp),

          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context,inverter_serial_number ,
              "Inverter Serial Number", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context,pv_modues_making ,
              "PV  Modues Make & Model", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context,pv_module_capacity ,
              "PV Modules Capacity", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, pv_module_serial_number,
              "PV Modules Serial Numbers", Icons.add_chart_sharp),
        ],
      ),
    );
  }

  Widget _monitoringRemoteDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.textFormFeildsDesign(
              context, data_logger_serial_number, "Data Logger Serial Number", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, data_logger_check_digits, "Data Logger Chl Digits", Icons.contact_page),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, rm_portal_number,
              "RM Portal Name", Icons.account_box_outlined),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, customRmMobileApp, "Customer's RM Mobile App", Icons.password),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, portal_app_username,
              "Portal/App(Username)", Icons.password_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, portal_app_passworb,
              "Portal/App(Password)", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _ksebDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.textFormFeildsDesign(
              context, kseb_customer_number, "KSEB Consumer Number", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, kseb_section_office, "KSEB  Section Office", Icons.contact_page),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, last_connected_load,
              "Last Connected Load", Icons.account_box_outlined),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, phase_of_kseb_connection, "Phase of KSEB Connection", Icons.password),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context,transformer ,
              "Transformer", Icons.password_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, pole_number,
              "Pole Number", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget _wheelingDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.textFormFeildsDesign(
              context, is_wheel_opted, "Is wheeling opted", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, wheeled_consumer_number, "Wheeled Consumer Number/s", Icons.contact_page),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, wheeled_section,
              "Wheeled Section", Icons.account_box_outlined),
          SizedBox(
            height: 10,
          ),


        ],
      ),
    );
  }
  Widget _subsidyDetails() {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constants.textFormFeildsDesign(
              context, is_this_a_subsidy_project, "Is this a Subsidy Project", Icons.add_chart_sharp),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(
              context, is_edible_capacity, "Eligible Susidy Capacity", Icons.contact_page),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, subsidy_amount,
              "Subsidy Amount", Icons.account_box_outlined),
          SizedBox(
            height: 10,
          ),
          Constants.textFormFeildsDesign(context, subsidy_release_data,
              "Subsidy Reelease Date", Icons.account_box_outlined),


        ],
      ),
    );
  }

  _renderBodyMain() {
    return SingleChildScrollView(
      child: Column(
        children: [_renderMainHead(), _rendSubHead()],
      ),
    );
  }

  _renderMainHead() {
    return Stack(
      children: [
        Container(
            height: MediaQuery.of(context).size.height * 0.400,
            width: MediaQuery.of(context).size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color(0xFF123F91),
              Color(0xFF1860E1),
            ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Image.asset(
                DrawableResource.loginPage,
              ),
            )),
      ],
    );
  }

  _rendSubHead() {
    return SingleChildScrollView(
      child: Container(
          decoration: BoxDecoration(color: ColorResource.loginPageColor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _renderSizedBox(MediaQuery.of(context).size.height * 0.040),
              _renderLoginText(),
              _renderSizedBox(MediaQuery.of(context).size.height * 0.009),
              _renderLoginDescription("Please Enter Create Account Details "),
              _renderSizedBox(MediaQuery.of(context).size.height * 0.020),
              _customerBasicInformation(),

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
          )),
    );
  }

  _renderSizedBox(double height) {
    return SizedBox(
      height: height,
    );
  }

  _renderLoginText() {
    return Text(
      "Create An Account",
      style: StyleResource.smallBlackNormalTextStyle(context)
          .copyWith(fontSize: 20),
    );
  }

  _renderLoginDescription(String description) {
    return Text(
      description,
      style: StyleResource.smallGreyBoldTextStyle(context).copyWith(
          color: ColorResource.greyColor, fontWeight: FontWeight.normal),
    );
  }

  ContainerDesign(BuildContext context, String text, bool isSelected) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment(0.8, 1),
            colors: <Color>[
              ColorResource.appBarGradientDark,
              ColorResource.mediumBlue,
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  text,
                  style: StyleResource.smallGreyBoldTextStyle(context)
                      .copyWith(color: Colors.white),
                ),
              ),
              Icon(
                isSelected
                    ? Icons.arrow_circle_down_rounded // Use your desired selected icon
                    : Icons.arrow_drop_down_circle_outlined, // Use your desired default icon
                color: Colors.white,
                size: 15,
              ),

            ],
          ),
        ),
      ),
    );
  }



  mainView() {
    return SingleChildScrollView(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              setState(() {

                select_container = 1;
              });
            },
            child: ContainerDesign(context, "Customer Basic Information", select_container == 1),

          ),
          select_container == 1 ? _customerBasicInformation() : Container(),
          InkWell(
            onTap: () {
              setState(() {
                select_container = 2;
              });
            },
            child: ContainerDesign(
              context,
              "Solar Power Plant Details",select_container == 2,
            ),
          ),
          select_container == 2 ? _solarPowerPlantDetails() : Container(),
          InkWell(
            onTap: () {
              setState(() {
                select_container = 3;
              });
            },
            child: ContainerDesign(
              context,
              " Monitoiring Remote Details",select_container == 3
            ),
          ),
          select_container == 3 ? _monitoringRemoteDetails() : Container(),
          InkWell(
            onTap: () {
              setState(() {
                select_container = 4;
              });
            },
            child: ContainerDesign(
              context,
              "KSEB Details",
                select_container == 4
            ),
          ),
          select_container == 4 ? _ksebDetails() : Container(),
          InkWell(
              onTap: () {
                setState(() {
                  select_container = 5;
                });
              },
              child: ContainerDesign(
                context,
                "Wheeling Details",
                  select_container == 5
              )),
          select_container == 5 ? _wheelingDetails() : Container(),
          InkWell(
              onTap: () {
                setState(() {
                  select_container = 6;
                });
              },
              child: ContainerDesign(
                context,
                "Subsidy Details",
                  select_container == 6
              )),
          select_container == 6 ? _subsidyDetails() : Container(),
         Padding(padding: EdgeInsets.all(10),child:  Constants.buttonDesign(context, "Create Account", () {
           context.read<SignInProvider>().createAccount(
               userNameController.text.trim(),
               passwordController.text.trim(),
               confirmPassword.text.trim(),
               nameController.text.trim(),
               clientController.text.trim(),
               mobileNumber.text.trim().toString(),customerAddress.text.trim().toString(),
               subsidy_release_data.text.trim(),
               subsidy_amount.text.trim(),
               is_edible_capacity.text.trim(),
               is_this_a_subsidy_project.text.trim(),
               wheeled_section.text.trim(),
               wheeled_consumer_number.text.trim(),
               is_wheel_opted.text.trim(),
               pole_number.text.trim(),
               transformer.text.trim(),
               phase_of_kseb_connection.text.trim(),
               last_connected_load.text.trim(),
               kseb_section_office.text.trim(),
               kseb_customer_number.text.trim(),
               portal_app_passworb.text.trim(),
               portal_app_username.text.trim(),
               customRmMobileApp.text.trim(),
               rm_portal_number.text.trim(),
               data_logger_check_digits.text.trim(),
               data_logger_serial_number.text.trim(),
               pv_module_serial_number.text.trim(),
               pv_module_capacity.text.trim(),
               pv_modues_making.text.trim(),
               inverter_serial_number.text.trim(),
               inverter_capacity.text.trim(),
               inverter_making.text.trim(),
               plant_capacity.text.trim(),
               solar_plant_id.text.trim(),
               gps_location.text.trim(),
               pv_plant_address.text.trim());
         }),)
        ],
      ),
    );
  }


}


