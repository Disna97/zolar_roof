import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:zolar_roof/constants/constants.dart';
import 'package:zolar_roof/screens/admin_module/create_accout_screen.dart';
import 'package:zolar_roof/utils/utils.dart';

class SignInProvider extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> createAccount(
      String userNameController,
      String passwordController,
      String confirmPasswordController,
      String nameController,
      String clientController, String mobileNumber,
      String customerAddress,
      String subsidy_release_data,
      String subsidy_amount,
      String is_edible_capacity,
      String is_this_a_subsidy_project,
      String wheeled_section,
      String wheeled_consumer_number,
      String is_wheel_opted,
      String pole_number,
      String transformer,
      String phase_of_kseb_connection,
      String last_connected_load,
      String kseb_section_office,
      String kseb_customer_number,
      String portal_app_passworb,
      String portal_app_username,
      String customer_rm_mobile_app,
      String rm_portal_number,
      String data_logger_check_digits,
      String data_logger_serial_number,
      String pv_module_serial_number,
      String pv_module_capacity,
      String pv_modues_making,
      String inverter_serial_number,
      String inverter_capacity,
      String inverter_making,
      String plant_capacity,
      String solar_plant_id,
      String gps_location,
      String pv_plant_address

      ) async {
    try {
      if (passwordController.toString() != confirmPasswordController.toString()) {
        throw FirebaseAuthException(
          code: 'passwords-not-matching',
          message: 'Passwords do not match',
        );
      }


      UserCredential userCredential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: userNameController.toString(),
        password: passwordController.toString(),
      );


      await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
        "client_code":clientController.toString(),
        'name': nameController.toString(),
        'password': passwordController.toString(),
        'username': userNameController.toString(),
        "mobileNumber":mobileNumber.toString(),
        "customerAddress":customerAddress.toString(),
        "subsidy_release_data":subsidy_release_data.toString(),
        "subsidy_amount":subsidy_amount.toString(),
        "is_edible_capacity":is_edible_capacity.toString(),
        "is_this_a_subsidy_project":is_this_a_subsidy_project.toString(),
        "wheeled_section":wheeled_section.toString(),
        "wheeled_consumer_number":wheeled_consumer_number.toString(),
        "is_wheel_opted":is_wheel_opted.toString(),
        "pole_number":pole_number.toString(),
        "transformer":transformer.toString(),
        "phase_of_kseb_connection":phase_of_kseb_connection.toString(),
        "last_connected_load":last_connected_load.toString(),
        "kseb_section_office":kseb_section_office.toString(),
        "kseb_customer_number":kseb_customer_number.toString(),
        "portal_app_passworb":portal_app_passworb.toString(),
        "portal_app_username":portal_app_username.toString(),
        "customer_rm_mobile_app":customer_rm_mobile_app.toString(),
        "rm_portal_number":rm_portal_number.toString(),
        "data_logger_check_digits":data_logger_check_digits.toString(),
        "data_logger_serial_number":data_logger_serial_number.toString(),
        "pv_module_serial_number":pv_module_serial_number.toString(),
        "pv_module_capacity":pv_module_capacity.toString(),
        "pv_modues_making":pv_modues_making.toString(),
        "inverter_serial_number":inverter_serial_number.toString(),
        "inverter_capacity":inverter_capacity.toString(),
        "inverter_making":inverter_making.toString(),
        "plant_capacity":plant_capacity.toString(),
        "solar_plant_id":solar_plant_id.toString(),
        "gps_location":gps_location.toString(),
        "pv_plant_address":pv_plant_address.toString()

      });


      Constants.showLoginErrorToast('Account Created Successfully');
      print("Account created: ${userCredential.user?.uid}");
    } on FirebaseAuthException catch (e) {

      Constants.showLoginErrorToast(e.message ?? 'An error occurred');
    } catch (e) {
      print("Unexpected error during account creation: $e");
      Constants.showLoginErrorToast('An unexpected error occurred');
    }
    notifyListeners();
  }
}