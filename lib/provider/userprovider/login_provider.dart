import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:zolar_roof/constants/shared_preferences.dart';
import 'package:zolar_roof/screens/user_module/screens/user_dashboard_screen.dart';
import 'package:zolar_roof/utils/utils.dart';

import '../../constants/constants.dart';
import '../../model/appfeedback_model.dart';
import '../../screens/user_module/screens/login_screen.dart';

class LoginProvider extends ChangeNotifier{
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? userId;
  String? userEmail;
  String? userName;
  String? clientCode;
  Future<void>  login(BuildContext context,String email,String password) async {

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email:email,
        password: password,
      );
      userId = userCredential.user!.uid??"";
     userEmail = userCredential.user!.email??"";
      DocumentSnapshot userSnapshot = await FirebaseFirestore.instance.collection('users').doc(userCredential.user!.uid).get();
      clientCode = userSnapshot['client_code'] ?? "";
      userName = userSnapshot['name'] ?? "";
      print("agent code$clientCode");
      SharedPref().saveLoggedInState(true);


      Utils.navigatePushAndReplacement(context,UserDashBoard());
      Constants.showLoginErrorToast("Logged In Successfully");

    } catch (e) {
      Constants.showLoginErrorToast("Invaild Crediantials..Please check the email id or Password.");
    }
    notifyListeners();
  }
  Stream<List<AppFeedback>> getCompliantHistory() {
    return FirebaseFirestore.instance
        .collection('appfeedback')
        .where('userId', isEqualTo: userId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return AppFeedback(
          reviewGrade: doc['reviewGrade'] as String? ?? '',
          reviewMessage: doc['reviewMessage'] as String? ?? '',
          userId: doc['userId'] as String? ?? '',
          userName: doc['username'] as String? ?? '',
          clentCode: doc['client_code'] as String? ?? '',
          status: doc['status'] as String? ?? '',

        );
      }).toList();
    });
  }


  Future<void> logout(BuildContext context) async {
    try {
      await _auth.signOut();
      await SharedPref().saveLoggedInState(false); // Update the user login state
      Utils.navigatePushAndReplacement(context, LoginScreen());
      Constants.showLoginErrorToast("Logged Out Successfully");
    } catch (e) {
      print("Error during logout: $e");
    }
    notifyListeners();
  }

}
